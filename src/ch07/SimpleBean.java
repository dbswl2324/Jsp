package ch07;
/*자바빈즈 네이밍 관례
 * 1.테이블+Bean(JSP많이사용)
 * 2.테이블+DTO(Date Tranfer Object)
 * 3.테이블+VO(Value Object)
 * ex)tblTeam ->TeamBean.java
 * */
public class SimpleBean {
	//테이블 스키마
	private String msg;//
	private int cnt;
	//setter ->setXxx, getter-> getXxx
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}



