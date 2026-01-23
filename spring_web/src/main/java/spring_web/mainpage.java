package spring_web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller		//해당 class는 자동으로 Servlet 기능가진 class가 됩니다.
public class mainpage {
	/*
	@GetMapping : doGet 같은 역활
	@PostMapping : doPost 같은 역활
	@RequestMapping : doGet + doPost모두 사용가능
	*/
		
	@GetMapping("/mainpage.do")
	public String main() {
		System.out.println("메이페이지 로드");
		return null;	//view페이지를 로드
	}
	
	@GetMapping("/login.do")
	public String login() {
		System.out.println("로그인 페이지 로드");
		return "login";		//login.jsp 로드합니다. (webpage2.xml, prefix, suffix 사용했음)
	}
	
	@PostMapping("/search.do")
	public void search(HttpServletRequest req) {
		String id = req.getParameter("id");
		System.out.println(id);
	}
}
