package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.spi.DirStateFactory.Result;

public class TeamMgr {
	private DBConnectionMgr pool;
	public TeamMgr() {
		//DBConnectionMgr 싱글톤 패턴으로 구현 클래스
		//싱글톤 패턴은 객체를 only one개만 만들수 있는 패턴
		pool=DBConnectionMgr.getInstance();
	}
	//pool에서 빌림->사용->반납.
	
	//저장
	//public void inserTeam(String name, String city, int age, String team) 
	public void insertTeam(TeamBean bean){//위의 주석을 bean으로 다 받는다
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		try {
			//DBConnectionMgr에서 Connection 빌려옴
			con=pool.getConnection();
			sql="insert tblTeam(name,city,age,team)values(?,?,?,?)";
			//공식
			pstmt=con.prepareStatement(sql);
			//?에 값을 세팅
			pstmt.setString(1,bean.getName());//1은 24줄의 쿼리문의 1번째 물음표를 뜻함
			pstmt.setString(2,bean.getCity());
			pstmt.setInt(3,bean.getAge());
			pstmt.setString(4,bean.getTeam());
			//완성된 SQL 실행
			pstmt.executeUpdate();//insert,update,delete
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			//conConnection 반납하고 pstmt는 close
			pool.freeConnection(con,pstmt);
		}
	}
	//리스트
	public Vector<TeamBean> listTeam(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		Vector<TeamBean> vlist=new Vector<TeamBean>();
		try {
			con=pool.getConnection();
			sql="select * from tblTeam";
			pstmt=con.prepareStatement(sql);
			//?는 없기 때문에 세팅은 없다
			rs=pstmt.executeQuery();//select실행
			while(rs.next()) {
				int num=rs.getInt(1);//1은 가져온 컬럼의 첫번째를 뜻함. num
				String name=rs.getString(2);//name
				String city=rs.getString(3);
				int age=rs.getInt(4);
				String team=rs.getString(5);
				
				TeamBean bean=new TeamBean();
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setAge(rs.getInt(4));
				bean.setTeam(rs.getString(5));

				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	
	
	//레코드 한개 가져오기
	public TeamBean getTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TeamBean bean=new TeamBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * from tblTeam where num="+num;
			//첫번째 ?에 세팅
			
			pstmt = con.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setCity(rs.getString("city"));
				bean.setAge(rs.getInt("age"));
				bean.setTeam(rs.getString("team"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	
	//수정:정상적인 수정 true 오류이면 false
	public boolean updateTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "update tblTeam set name=?,city=?,age=?,team=? "
			+"where num=?";
			
			pstmt=con.prepareStatement(sql);
			//?에 값을 세팅
			pstmt.setString(1,bean.getName());//1은 24줄의 쿼리문의 1번째 물음표를 뜻함
			pstmt.setString(2,bean.getCity());
			pstmt.setInt(3,bean.getAge());
			pstmt.setString(4,bean.getTeam());
			pstmt.setInt(5,bean.getNum());
			//완성된 SQL 실행
			if(pstmt.executeUpdate()==1)
				flag=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			//conConnection 반납하고 pstmt는 close
			pool.freeConnection(con,pstmt);
		}
		return flag;
	}
	

	//삭제
	public void deleteTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblTeam where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//conConnection 반납하고 pstmt는 close
			pool.freeConnection(con,pstmt);
		}
	}
	//teamList
	public Vector<String> listTeamName(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> vlist=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select distinct(team) from tblTeam";
			pstmt = con.prepareStatement(sql);

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
	
}
