package web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository("file_rename")
public class file_rename {
	
	public String rename(String filenm) {
		int set = filenm.lastIndexOf(".");	//.png => 속성값
		String types = filenm.substring(set);
		
		Date day = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmss");
		String today = sf.format(day);
		
		//랜덤값
		int no = (int)Math.ceil(Math.random()*100);
		String refilenm = today + no + types;		//예시)2026020411272122.jpg
		return refilenm;
	}
	
}
