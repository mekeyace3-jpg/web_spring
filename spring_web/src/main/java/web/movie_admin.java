package web;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;

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
		
	@GetMapping("/movie/admin/login.do")
	public String login() {
		
		return null;
	}
	
	@GetMapping("/movie/admin/newadmin.do")
	public String newadmin() {
		
		return null;
	}
	
}
