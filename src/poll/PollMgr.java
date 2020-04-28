package poll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import guestbook.CommentBean;
import guestbook.GuestBookBean;

public class PollMgr {
	private DBConnectionMgr pool;
	public PollMgr() {
		pool=DBConnectionMgr.getInstance();
	
	}
	//Max Num
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum=0;
		try { 
			con = pool.getConnection();
			sql = "select max(num) from tblPollList";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if(rs.next()) maxNum=rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	//Poll Insert
	public boolean insertPoll(PollListBean plBean, PollItemBean piBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			//tblPollList ����
			sql = "insert tblPollList(question,sdate,edate,wdate,type)"
					+ "values(?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, plBean.getQuestion());
			pstmt.setString(2, plBean.getSdate());
			pstmt.setString(3, plBean.getEdate());
			pstmt.setInt(4, plBean.getType());//1.��������,0:���ϼ���
			int cnt = pstmt.executeUpdate();//����� ���ڵ� ������ ����
			pstmt.close();
			if(cnt==1) {//���������� ��������Ʈ ���� -> ���������� ����
				sql="insert tblPollItem values(?,?,?,0)";
				pstmt = con.prepareStatement(sql);
				int listNum =getMaxNum();//��� ������ ��������Ʈ�� num ��
				String item[] = piBean.getItem();//������ �迭
				for(int i=0;i<item.length;i++) {
					if(item[0]==null||item[i].trim().equals("")) {
						break;
					}
				pstmt.setInt(1, listNum);//tblPollList�� num ��
				pstmt.setInt(2, i);//(5,0)(5,1)(5,3)
				pstmt.setString(3, item[i]);
				if(pstmt.executeUpdate()==1) {flag=true;}
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//Poll List
	public Vector<PollListBean> getPollList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PollListBean> vlist= new Vector<PollListBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblPollList order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollListBean plBean=new PollListBean();
				plBean.setNum(rs.getInt("num"));
				plBean.setQuestion(rs.getString("question"));
				plBean.setSdate(rs.getString("sdate"));
				plBean.setEdate(rs.getString("edate"));
				vlist.addElement(plBean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//Poll Read : ���� �Ѱ� ��������
	public PollListBean getPoll(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		PollListBean plBean =new PollListBean();
		try {
			con = pool.getConnection();
			sql = "select num, question, type, active from tblPollList where num = ?";
			pstmt = con.prepareStatement(sql);
			if(num==0) {
				num=getMaxNum();//num ���� �Ѿ���� ���� ���� ���� �ֽ��� ������ ����
			}
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				plBean.setNum(rs.getInt(1));
				plBean.setQuestion(rs.getString(2));
				plBean.setType(rs.getInt(3));
				plBean.setActive(rs.getInt(4));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return plBean;
	}
	//Poll Item List
	//select item from tblPollItem where listNum=?
	public Vector<String> getItemList(int listNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> vlist= new Vector<String>();
		
		try {
			con = pool.getConnection();
			sql = "select item from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			if(listNum==0)
				listNum=getMaxNum();//num���� �Ѿ���� �������� ���� �ֽ��� ������ ����
			pstmt.setInt(1, listNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vlist.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//Sum Count : ����ǥ��
	public int sumCount(int listNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int sum=0;
		try {
			con = pool.getConnection();
			sql = "select sum(count) from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			if(listNum==0) {
				listNum=getMaxNum();
			}
			pstmt.setInt(1, listNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sum=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return sum;
	}
	//Poll Update : ��ǥ����
	public boolean updatePoll(int listNum, String itemNum[]) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblPollItem set count=count+1 "
					+ "where listNum=? and itemNum=?";
			pstmt = con.prepareStatement(sql);
			//��û�Ǵ� ������ num ���� �Ѿ���� ������ ���� �ֽſ� num ���� �����´�.
			if(listNum==0)
				listNum = getMaxNum();
			for (int i = 0; i < itemNum.length; i++) {
				pstmt.setInt(1, listNum);
				//���ڷ� ���� itemNum�� ������ ��ȯ
				pstmt.setInt(2, Integer.parseInt(itemNum[i]));
				//����� SQL ������� 1�̸� �������� ����
				if(pstmt.executeUpdate()==1)
					flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//Poll View : ��ǥ���
	//�ʿ��� ���� item�̶� count�̴�. �ΰ��� ���� �� �ִ� ��ü�� ��� ���� ����
	//�׷��� ��� �ΰ��� ���� �����ϰ� �� ��� Vector add �ϵ��� �ϰٴ�
	public Vector<PollItemBean> getView(int listNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PollItemBean> vlist = new Vector<PollItemBean>();
		try {
			con = pool.getConnection();
			sql = "select item, count from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, listNum==0?getMaxNum():listNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollItemBean piBean = new PollItemBean();
				String item[] = new String[1];
				item[0] = rs.getString("item");
				//PollItem�� item �ʵ�� �迭�� ����
				piBean.setItem(item);
				piBean.setCount(rs.getInt("count"));
				vlist.addElement(piBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//Max Item �߿� ���� ���� ��ǥ��
	//tblPollList : num,tblPollItem:listNum
	public int getMaxCount(int listNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxCnt=0;
		try {
			con = pool.getConnection();
			sql = "select max(count) form tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			//listNum�� 0�̸�  getMaxNum()
			pstmt.setInt(1, listNum==0?getMaxNum():listNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxCnt=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxCnt;
	}
	public Vector<PollItemBean> getView1(int listNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PollItemBean> vlist = new Vector<PollItemBean>();
		try {
			con = pool.getConnection();
			sql = "select item, count from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, listNum==0?getMaxNum():listNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollItemBean piBean = new PollItemBean();
				//piBean.setItem1(rs.getString("item"));
				piBean.setCount(rs.getInt("count"));
				vlist.addElement(piBean);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
}
