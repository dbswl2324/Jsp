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
			//tblPollList 저장
			sql = "insert tblPollList(question,sdate,edate,wdate,type)"
					+ "values(?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, plBean.getQuestion());
			pstmt.setString(2, plBean.getSdate());
			pstmt.setString(3, plBean.getEdate());
			pstmt.setInt(4, plBean.getType());//1.복수설문,0:단일설문
			int cnt = pstmt.executeUpdate();//적용된 레코드 갯수가 리턴
			pstmt.close();
			if(cnt==1) {//정상적으로 설문리스트 저장 -> 설문아이템 실행
				sql="insert tblPollItem values(?,?,?,0)";
				pstmt = con.prepareStatement(sql);
				int listNum =getMaxNum();//방금 저장한 설문리스트의 num 값
				String item[] = piBean.getItem();//아이템 배열
				for(int i=0;i<item.length;i++) {
					if(item[0]==null||item[i].trim().equals("")) {
						break;
					}
				pstmt.setInt(1, listNum);//tblPollList에 num 값
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
	//Poll Read : 설문 한개 가져오기
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
				num=getMaxNum();//num 값이 넘어오지 않을 때는 가장 최신의 설문이 리턴
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
				listNum=getMaxNum();//num값이 넘어오지 않을때는 가장 최신의 설문이 리턴
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
	//Sum Count : 총투표수
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
	//Poll Update : 투표실행
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
			//요청되는 페이지 num 값이 넘어오지 않으면 가장 최신에 num 값을 가져온다.
			if(listNum==0)
				listNum = getMaxNum();
			for (int i = 0; i < itemNum.length; i++) {
				pstmt.setInt(1, listNum);
				//문자로 받은 itemNum을 정수로 변환
				pstmt.setInt(2, Integer.parseInt(itemNum[i]));
				//실행된 SQL 결과값이 1이면 성공적인 실행
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
	//Poll View : 투표결과
	//필요한 값은 item이랑 count이다. 두개를 넣을 수 있는 객체는 빈즈가 현재 유일
	//그래서 빈즈에 두개의 값을 저장하고 이 빈즈를 Vector add 하도록 하겟다
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
				//PollItem에 item 필드는 배열로 선언
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
	//Max Item 중에 가장 높은 투표값
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
			//listNum이 0이면  getMaxNum()
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
