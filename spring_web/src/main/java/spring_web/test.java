package spring_web;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


//Controller Interface (GET,POST)
public class test implements Controller {
	
	@Autowired
	BasicDataSource dbinfo;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			Connection con = this.dbinfo.getConnection();
			System.out.println(con);
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		String data = request.getParameter("mid");
		System.out.println(data);	
		//ModelAndView : Attribute,Dispatcher => Map
		ModelAndView mv = new ModelAndView();
		mv.addObject("userid","hong");
		mv.addObject("userage",30);
		
		mv.setViewName("/WEB-INF/view/search.jsp");	//view를 로드하는 메소드
		
		return mv;
	}
}
