package spring_web;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller		//해당 class는 자동으로 Servlet 기능가진 class가 됩니다.
public class mainpage {
	/*
	@GetMapping : doGet 같은 역활
	@PostMapping : doPost 같은 역활
	@RequestMapping : doGet + doPost모두 사용가능
	*/
	/*  //일반적인 Servlet 방식	
	@GetMapping("/mainpage.do")
	public String main(HttpServletRequest req, HttpServletResponse res) {		
		String user = "홍길동";
		req.setAttribute("user", user);
		return null;	//view페이지를 로드
	}
	*/
	/*
	@GetMapping("/mainpage.do")		//JSTL 방식 출력
	public ModelAndView main() {	//=> mainpage.do => mainpage.jsp (ModelAndView 일체형)
		String user = "홍길동";
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",user);	
		return mv;
	}
	*/
	@GetMapping("/mainpage.do")		//JSTL 방식 출력 => View를 개발자가 원하는 jsp 파일명으로 변경 가능
	public String main(Model m) {
		String user = "이순신";
		m.addAttribute("user",user);
		return null;
	}
	
	@GetMapping("/mainpage5.do")
	public String mainpage5(Model m) {
		String myinfo[][] = {
				{"강감찬","이순신","장보고"},
				{"A","B","O"}
		};
		m.addAttribute("myinfo",myinfo);
		return null;
	}
	
	@GetMapping("/main.do")
	public String main2(Model m) {
		m.addAttribute("userid","apink");
		return null;
	}
	
	
	/*
		응용문제 : 사용자 정보 중 고객명, 이메일을 받아서 다음과 같은 사항일 경우 jstl 결과를
		출력합니다.
		고객명 : 홍길동, 이메일 : hong@nate.com 일 경우
		[결과] - JSTL 출력
		아이디 : hong_gil
		
		그 외에 고객명 정보를 입력할 경우
		[결과] - JSTL 출력
		해당 가입자 정보가 확인 되지 않습니다.
		
		@RequestParam 자료형 변수명(Front name명과 동일해야함) => request.getParameter
		required = true (무조건 필수로 값이 전송 되어야함), required = false (필수값은 아님)
		defaultValue : null 또는 Front에서 name을 전송하지 않을 경우 처리하는 기본값
	 */
	@PostMapping("/search.do")
	public String search(Model m, 
			@RequestParam(required = true, defaultValue = "") String mid,
			@RequestParam(required = true) String memail,
			@RequestParam(required = false, defaultValue = "N") String ck) {
		if(mid.equals("")) {
			System.out.println("올바른 접근이 아닙니다.");
		}
		System.out.println(memail);
		System.out.println(ck);
		//m.addAttribute("","");
		return null;
	}
	
	@GetMapping("/login.do")
	public String login() {
		System.out.println("로그인 페이지 로드");
		return "login";		//login.jsp 로드합니다. (webpage2.xml, prefix, suffix 사용했음)
	}
	/* 여러개의 체크 박스가 있을 경우 요구조건에 맞는 형태로 데이터 처리*/
	/*
	@PostMapping("/agreeok.do")
	public String agreeok(
			@RequestParam(required = true, defaultValue = "")String agree_ck1, 
			@RequestParam(required = true, defaultValue = "")String agree_ck2,
			@RequestParam(required = false, defaultValue = "N")String agree_ck3) {
		System.out.println(agree_ck1);
		System.out.println(agree_ck2);
		System.out.println(agree_ck3);
		return null;
	}
	*/
	/* defaultValue : 원시배열 형태에서는 사용하는 방식은 없습니다. 
	   필수 선택 사항은 배열로 처리가 가능하며, 그 외에 선택 사항은 별도의 @RequestParam 구성하여
	   처리하는것 가장 좋은 사항 입니다.
	 */
	@PostMapping("/agreeok.do")
	public String agreeok(
			@RequestParam(required = false) String agree_ck[],
			@RequestParam(required = false, defaultValue = "")String agree_ck2) {
		System.out.println(Arrays.toString(agree_ck));
		System.out.println(agree_ck[0]);
		System.out.println(agree_ck[1]);
		System.out.println(agree_ck2);
		return null;
	}

}
