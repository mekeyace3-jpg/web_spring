package web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class movie_controller {

	@GetMapping("/movie/index.do")
	public String movie_main() {
		System.out.println("테스트");
		return null;
	}
	
	
	
}
