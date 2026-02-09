package web;

import org.springframework.stereotype.Repository;

@Repository("mail_html")
public class mail_html {
	
	public String html_code(String no) {
		String mail_html = "<body style=\"margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px;\">\r\n"
				+ "<div style=\"background-color: white; border-radius: 12px; box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2); width: 100%; max-width: 450px; padding: 50px 40px;\">\r\n"
				+ "<div style=\"text-align: center; margin-bottom: 40px;\">\r\n"
				+ "<div style=\"font-size: 32px; font-weight: 700; color: #667eea; letter-spacing: 2px; margin-bottom: 10px;\">KOR BOX</div>\r\n"
				+ "<div style=\"color: #666; font-size: 14px; font-weight: 500;\">회원가입 인증코드 발송</div>\r\n"
				+ "</div>\r\n"
				+ "<div style=\"margin-top: 25px; padding: 20px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;\">\r\n"
				+ "<div style=\"font-size: 14px; font-weight: 600; margin-bottom: 15px; opacity: 0.9;\">인증코드번호</div>\r\n"
				+ "<div style=\"font-size: 36px; font-weight: 700; letter-spacing: 4px; font-family: 'Courier New', monospace; word-break: break-all;\" id=\"authCodeNumber\">"+no+"</div>\r\n"
				+ "<div id=\"codeMessage\" style=\"margin-top: 10px; padding: 12px 15px; border-radius: 6px; font-size: 13px; display: none;\"></div>\r\n"
				+ "</div>\r\n"
				+ "</div>\r\n"
				+ "</body>";
		return mail_html;
	}
	
}
