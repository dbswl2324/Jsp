package ch04;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
 
public class MUtil {
	public static int parseInt(HttpServletRequest req, String name) {
		return Integer.parseInt(req.getParameter(name));
	}
	//Random하게 색상을 리턴
	public static String randomColor() {
		Random r=new Random();
		String rgb=Integer.toHexString(r.nextInt(256));
		rgb+=Integer.toHexString(r.nextInt(256));
		rgb+=Integer.toHexString(r.nextInt(256));
		return "#"+rgb;

	}
}
