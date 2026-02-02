package web;

import java.security.MessageDigest;

import org.springframework.stereotype.Repository;

@Repository("sha")
public class security {

	public String sha1(String pw) {
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest md = MessageDigest.getInstance("sha-1");
			md.update(pw.getBytes());
			for(byte b : md.digest()) {
				sb.append(String.format("%x", b));
			}
			
		} catch (Exception e) {
			sb.append("null");
		}	
		return sb.toString();
	}
	
}
