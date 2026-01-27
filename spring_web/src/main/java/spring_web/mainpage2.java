package spring_web;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class mainpage2 {
	
	String message = "";	//자바스크립트 문법을 사용하는 변수
	
	@GetMapping("/product_list.do")
	public String product_list() {
		return null;
	}
	
	/* ibatis로 사용하는 방법 */
	@Autowired   //의존성 여부를 설정하는 어노테이션 및 의존성 주입 (필드 의존성 주입)
	private SqlSessionFactory sb;	//필드에 해당 Factory를 선언 및 객체 생성
	/* @ModelAttribute : DTO를 기본으로 setter로 Front에서 넘어온 name과 같은 경우 자동으로 setter에 적용함 */
	@PostMapping("/product_writeok.do")
	public String product_write(@ModelAttribute("pw")product_dto dto, Model m) {
		try {
			//Connection을 활용한 것과 동일한 기능 하게 됩니다.
			SqlSession ss = this.sb.openSession();		
			//해당 데이터를 insert 메소드를 활용하여 DB에 데이터를 저장 및 반환
			Integer result = ss.insert("datadb.product_insert",dto);
			//insert(namespace.id,데이터) : mapper.xml에 insert 태그에 한함
			if(result > 0) {
				this.message = "alert('정상적으로 저장 되었습니다.'); location.href='product_list.do';";
			}
			else {
				this.message = "alert('올바른 값이 아닙니다.'); history.go(-1);";
			}
			ss.close();	//SqlSession을 종료하는 명령어 입니다.
		} catch (Exception e) {
			System.out.println(e);
			this.message = "alert('올바른 값이 아닙니다.'); history.go(-1);";
		}
		m.addAttribute("message",this.message);
		return "message";
	}
	
}
