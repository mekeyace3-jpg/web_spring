package web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

//관리자 전용 Controller
@Controller
public class movie_admin {

	//@Resource : @Repository를 로드할 수 있는 Interface : @Autowired 비슷한 연결 타입
	@Resource(name="moive_admin_dao")
	public moive_admin_dao dao;
	
	@Resource(name="movie_dto")
	public movie_dto dto;
	
	//패스워드 암호화(sha-1)
	@Resource(name="sha")
	public security sc;
	
	
	@GetMapping("/movie/admin/admin_main.do")
	public String admin_main(Model m) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("part", "");
		List<movie_dto> all = this.dao.admin_login2(map);	//관리자로 회원가입한 리스트 5개를 배열로 로드함
		
		m.addAttribute("all",all);
		return null;
	}
	
	
	
	//관리자 회원가입 처리
	@PostMapping("/movie/admin/newadminok.do")
	public String newadminok(@ModelAttribute("mdto") movie_dto mdto,Model m) {
		String message = "";
		Integer result = null;
		try {
			//mdto.setMpw(this.sc.sha1(mdto.getMpw()));
			
			String repass = this.sc.sha1(mdto.getMpw());
			mdto.setMpw(repass);
			result = this.dao.new_admin(mdto);
			if(result > 0) {
				message = "alert('정상적으로 가입이 완료 되었습니다.'); location.href='./login.do'";
			}else {
				message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
			}
		} catch (Exception e) {
			message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	//API일 경우 CORS를 처리해야함
	//API (HttpServletResponse => 절대 jsp(view part)를 로드하지 않음)
	@CrossOrigin(origins="*")	//Spring 전용 CORS를 핸들링하는 Interface
	@GetMapping("/movie/admin/idcheck.do")
	public String idcheck(HttpServletResponse res,
			@RequestParam(required = true, defaultValue = "")String admin_id) throws Exception {
		PrintWriter pw = res.getWriter();
		if(admin_id.equals("") || admin_id == null) {
			pw.write("error");
		}
		else {
			movie_dto dto = this.dao.admin_one(admin_id);
			if(dto==null) {	//사용가능한 ID
				pw.write("ok");
			}
			else {	//사용 불가능 ID
				pw.write("no");
			}
		}
		
		return null;
	}
	/*	
	@Autowired
	HttpSession hs;
	*/
	/* HttpSession : Controller, DAO, DTO, VO  => HttpSession hs = request.setAttribute()*/
	@PostMapping("/movie/admin/loginok.do")
	public String loginok(@RequestParam(required = true, defaultValue = "")String mid,
			@RequestParam(required = true, defaultValue = "")String mpw, Model m,
			HttpSession hs) {
		String message = "";
		try {			
			String rpw = this.sc.sha1(mpw);	//사용자가 입력한 값을 sha1으로 변환
			
			Map<String,String> map = new HashMap<String, String>();
			map.put("part", "login");
			map.put("mid", mid);
			movie_dto dto = this.dao.admin_login(map);
			if(dto == null) {
				message = "alert('관리자 아이디 및 패스워드를 확인하세요'); history.go(-1);";
			}
			else {
				if(dto.getMpw().equals(rpw)) {	//패스워드 암호화 및 사용자가 입력한 암호화를 비교
					hs.setAttribute("admin_id", mid);	//관리자 아이디를 session에 등록
					message = "alert('관리자님 로그인 하셨습니다.'); location.href='./admin_main.do';";
				}
				else {
					message = "alert('관리자 아이디 및 패스워드를 확인하세요'); history.go(-1);";
				}
			}
			//System.out.println(dto.getMpw());
			
		} catch (Exception e) {
			message = "alert('if you hack, it will be traced back!!!'); history.go(-1);";
		}
		
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	//로그아웃을 처리하는 메소드
	@GetMapping("/movie/admin/logout.do")
	public String logout(Model m, HttpSession hs) {
		hs.removeAttribute("admin_id");	//해당 키 변수 값에 대한 정보를 삭제
		String message = "alert('정상적으로 로그아웃 되었습니다.'); location.href='./login.do';";		
		
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	
	@GetMapping("/movie/admin/login.do")
	public String login() {
		
		return null;
	}
	
	@GetMapping("/movie/admin/newadmin.do")
	public String newadmin() {
		
		return null;
	}
	
}
