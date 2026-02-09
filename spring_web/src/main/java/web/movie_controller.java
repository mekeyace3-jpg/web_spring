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
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class movie_controller {

	@Resource(name="mail_html")
	public mail_html mh;
	
	
	@GetMapping("/movie/index.do")
	public String movie_main() {
		System.out.println("테스트");
		return null;
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
			props.put("mail.smtp.host", "메일발송서버주소");	//메일 발송 서버
			props.put("mail.smtp.port", "포트번호");		//SMTP 발송 Port 번호
			props.put("mail.smtp.auth", "true");	//메일 발송 서버의 인증(아이디,패스워드)
			props.put("mail.smtp.starttls.enable","false");		//메일서버의 TLS를 연결 유/무 
			props.put("mail.stmtp.ssl.trust", "메일발송서버주소"); //메일서버의 SSL 기능 사용 https
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");  //TLS version을 적용해야함
		
			//메일 발송에 대한 로그인(메일서버 로그인 정보)사항을 Session에 등록 시킴
			
			Session session = Session.getInstance(props,new Authenticator() {
				//메일을 사용하기 위한 ID 와 패스워드 정보를 입력해야함(필수)
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("로그인 아이디","로그인 패스워드");
				}
			});
			
			//난수번호 6자리 생성
			Random rd = new Random();
			int nos = rd.nextInt(900000) + 100000; //10000 ~ 999999
			
			
			//Mime : 이메일 전송을 위한 인터넷 표준 포멧
			//메일발송을 적용하기 위한 메세지를 생성하는 class
			Message msg = new MimeMessage(session);
			//보내는 사람 메일주소 + 이름 + 언어셋
			msg.setFrom(new InternetAddress("보내는사용자메일주소","보내는사용자명","utf-8"));
			
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
