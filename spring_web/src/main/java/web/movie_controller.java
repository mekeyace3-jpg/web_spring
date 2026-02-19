package web;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class movie_controller {

	@Resource(name="mail_html")		//Mail 전송시 HTML 코드 파일
	public mail_html mh;
	
	@Resource(name="movie_guest_dao")		//DAO
	public movie_guest_dao mg_dao;
	
	@Resource(name="sha")		//암호화
	public security sha;
	
	//RPC API
	@GetMapping("/movie/top10.do")
	public String top10(@RequestParam(required = true, defaultValue = "")String day,
			HttpServletResponse res) throws Exception {
		PrintWriter pw = res.getWriter();
		if(day == null || day.equals("")) {
			pw.write("error");
		}
		else {
			boxoffice_dto bdto = this.mg_dao.top_boxoffice(day);
			if(bdto != null) {
				pw.write(bdto.getApidata());
			}
			else {
				pw.write("no");
			}
		}
		pw.close();
		return null;
	}
	
	//메인페이지
	@GetMapping("/movie/index.do")
	public String movie_main() {
		return null;
	}
	
	//로그아웃 처리 메소드
	@GetMapping("/movie/logout.do")
	public String logout(HttpSession hs,Model m) {
		
		hs.removeAttribute("mid");
		hs.removeAttribute("mname");
		hs.removeAttribute("memail");
		hs.removeAttribute("mhp");
		
		String message = "Kakao.Auth.setAccessToken(undefined);"
				+ "sessionStorage.clear();"
				+ "localStorage.clear();"
				+ "alert('정상적으로 로그아웃 되었습니다.'); "
				+ "location.href='./index.do';";
		m.addAttribute("message",message);
		return "/movie/message";
	}
	
	
	//로그인 처리 메소드
	@PostMapping("/movie/loginok.do")
	public String loginok(@RequestParam(required = true, defaultValue = "")String mid,
			@RequestParam(required = true, defaultValue = "")String mpass,Model m, HttpSession hs) {
		String message = "";
		try {
			if(mid==null || mpass==null) {
				message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
			}
			else {
				member_dto mdto = this.mg_dao.guest_id(mid, "");
				String repass = this.sha.sha1(mpass);
				if(mdto == null) {
					message = "alert('회원정보가 확인 되지 않습니다.'); history.go(-1);";
				}
				else {
					if(repass.equals(mdto.getMpass())) {
						hs.setAttribute("mid", mdto.getMid());
						hs.setAttribute("mname", mdto.getMname());
						hs.setAttribute("memail", mdto.getMemail());
						hs.setAttribute("mhp", mdto.getMhp());
						message = "alert('"+mdto.getMname()+" 님 환영합니다.'); location.href='./index.do'";
					}
				}
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/message";
	}
	
	@CrossOrigin("*")
	@GetMapping("/movie/guest_idcheck.do")
	public String guest_idcheck(@RequestParam(required = true,defaultValue = "")String mid,
			HttpServletResponse res) throws Exception {
		PrintWriter pw = res.getWriter();
		try {
			if(mid == null || mid.equals("")) {
				pw.print("error");
			}
			else {
				member_dto dto = this.mg_dao.guest_id(mid, "id");
				if(dto==null) {		//select쿼리문 작동시 데이터가 없을 경우 null 핸들링 처리(getter 금지)
					pw.print("ok");
				}
				else{
					pw.print("no");
				}
			}
			
		} catch (Exception e) {
			pw.print("error");
		} finally {
			pw.close();
		}
		return null;
	}
	
	//회원가입처리 메소드 (Kakao 에서 로그인에 대한 리다이렉트 URI를 연결) - mid, mname, mpass, memail
	@PostMapping("/movie/web_loginok.do")
	public String web_loginok(@ModelAttribute("mdto")member_dto dto, Model m, HttpSession hs) {
		String message = "";
		try {
			//카카오 로그인시 회원등록 확인 후 가입
			member_dto mdto = this.mg_dao.guest_id(dto.getMid(),"");
			if(mdto != null) {	//회원이 있을 경우 로그인 처리
				String repass = this.sha.sha1(dto.getMpass());
				if(repass.equals(mdto.getMpass())) {
					hs.setAttribute("mid", mdto.getMid());
					hs.setAttribute("mname", mdto.getMname());
					hs.setAttribute("memail", mdto.getMemail());
					hs.setAttribute("mhp", mdto.getMhp());
					message = "alert('"+mdto.getMemail()+" 님 환영합니다.'); location.href='./index.do'";
				}
			}
			else {
				//카카오 회원 가입처리 
				dto.setMhp("000-0000-0000");
				dto.setMbirth("0000-00-00");
				dto.setMpost("");
				dto.setMaddr("");
				dto.setMaddr2("");
				dto.setMemailck("Y");
				dto.setMagree("agree1,agree2");
				dto.setMjoin("kakao");
				dto.setMpass(this.sha.sha1(dto.getMpass().toString()));
				Integer result = this.mg_dao.guest_join(dto);
				if(result > 0) {
					message = "alert('정상적으로 회원가입이 완료 되었습니다.'); location.href='./member_login.jsp';";
				}
				else {
					message = "alert('해당 정보가 올바르지 않습니다.'); history.go(-1);";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "alert('서버 점검으로 인하여 정상적인 회원가입이 불가능 합니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/message";
	}
	
	//웹사이트에서 직접 회원가입 하는 메소드
	@PostMapping("/movie/memberok.do")
	public String memberok(@ModelAttribute("mdto")member_dto dto, Model m) {
		String message = "";
		try {
			dto.setMpass(this.sha.sha1(dto.getMpass().toString())); //패스워드 암호화
			Integer result = this.mg_dao.guest_join(dto);
			if(result > 0) {
				message = "alert('정상적으로 회원가입이 완료 되었습니다.'); location.href='./member_login.jsp';";
			}
			else {
				message = "alert('해당 정보가 올바르지 않습니다.'); history.go(-1);";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "alert('서버 점검으로 인하여 정상적인 회원가입이 불가능 합니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/message";
	}
	
	
	
	@CrossOrigin("*")
	@GetMapping("/movie/mail_check.do")
	public String mail_check(@RequestParam(required = true,defaultValue = "")String mail,
			HttpServletResponse res) throws Exception {
		PrintWriter pw = res.getWriter();
		try {
			//SMTP(25) 와 IMAP(143,TLS-993), POP3(110,TLS-995) 를 활용하여 메일 발송 시스템 시스템을 제작할 수 있습니다. 
			
			//attribute(속성 - getter,setter) = Properties(속성배열)
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.mail.nate.com");	//메일 발송 서버
			props.put("mail.smtp.port", "587");		//SMTP 발송 Port 번호
			props.put("mail.smtp.auth", "true");	//메일 발송 서버의 인증(아이디,패스워드)
			props.put("mail.smtp.starttls.enable","false");		//메일서버의 TLS를 연결 유/무 
			props.put("mail.stmtp.ssl.trust", "smtp.mail.nate.com"); //메일서버의 SSL 기능 사용 https
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");  //TLS version을 적용해야함
		
			//메일 발송에 대한 로그인(메일서버 로그인 정보)사항을 Session에 등록 시킴
			
			Session session = Session.getInstance(props,new Authenticator() {
				//메일을 사용하기 위한 ID 와 패스워드 정보를 입력해야함(필수)
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("네이트아이디","네이트패스워드");
				}
			});
			
			//난수번호 6자리 생성
			Random rd = new Random();
			int nos = rd.nextInt(900000) + 100000; //10000 ~ 999999
			
			
			//Mime : 이메일 전송을 위한 인터넷 표준 포멧
			//메일발송을 적용하기 위한 메세지를 생성하는 class
			Message msg = new MimeMessage(session);
			//보내는 사람 메일주소 + 이름 + 언어셋
			msg.setFrom(new InternetAddress("mekeyace@nate.com","이종혁","utf-8"));
			
			//받는 사람의 이메일 주소 정보
			msg.addRecipient(Message.RecipientType.TO,new InternetAddress(mail));
			msg.setSubject("보안코드 발송!!");		//메일 제목
			msg.setContent(this.mh.html_code(String.valueOf(nos)), "text/html;charset=utf-8");	//메일 내용
			Transport.send(msg);	//메일 발송
			
			pw.write(String.valueOf(nos));	//Front-end에게 return으로 난수 6자리 숫자를 보냄
		} catch (Exception e) {
			pw.write("error");
			System.out.println("메일서버 지정 정보가 틀립니다.");
		} finally {
			pw.close();
		}	
		
		return null;
	}
	
}
