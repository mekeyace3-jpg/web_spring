package web;

import java.io.PrintWriter;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

//API 전용 Controller
@RestController
@CrossOrigin("*")
public class json_controller {

	PrintWriter pw = null;
	
	@GetMapping("/jsontest1.do")
	public String jsontest1() {
		
		
		return null;
	}
	
}
