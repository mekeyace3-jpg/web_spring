package spring_web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/* ibatis 전용으로 사용한 Controller 및 mapper,config 활용함 */

@Controller
public class mainpage2 {
	/*
	  debug() : 개발단계에서 해당 문법 및 쿼리문에 대한 사항을 체크
	  info() : 사용자의 요청이나  시스템 변경사항 등을 출력
	  warn() : 에러는 아니며, 문제 또는 주의가 필요할 경우
	  error() : 에러가 발생할 경우 출력
	 */
	private static final Logger log = LogManager.getLogger(mainpage2.class);
	
	String message = "";	//자바스크립트 문법을 사용하는 변수
	/* ibatis로 사용하는 방법 */
	@Autowired   //의존성 여부를 설정하는 어노테이션 및 의존성 주입 (필드 의존성 주입)
	private SqlSessionFactory sb;	//필드에 해당 Factory를 선언 및 객체 생성

	SqlSession ss = null;
	
	//상품정보 수정완료 페이지
	@PostMapping("/product_modifyok.do")
	public String product_modifyok(Model m,@ModelAttribute("dto")product_dto dto) {
		this.message = "";
		try {
			this.ss = this.sb.openSession();
			Integer result = this.ss.update("datadb.product_update",dto);
			if(result > 0) {
				this.message = "alert('정상적으로 수정 완료 되었습니다.'); "
						+ "location.href='./product_view.do?pidx="+dto.getPidx()+"'";
			}
			else {
				this.message = "alert('데이터 오류로 인하여 수정이 반영되지 않았습니다.'); history.go(-1);";
			}
			
		}catch (Exception e) {
			log.error(e.getMessage());
		} 
		finally {
			this.ss.close();
		}
		
		m.addAttribute("message",this.message);
		return "message";
	}
	
	//상품정보 수정 페이지
	@GetMapping("/product_modify.do")
	public String product_modify(Model m,
			@RequestParam(required = true, defaultValue = "")String pidx,
			@RequestParam(required = true, defaultValue = "")String pcode) {
		this.message = "";		//해당 필드에 있는 값을 항상 해당 메소드에 사용시 초기화를 필수로 하셔야 합니다.
		try {
			if(pidx.equals("") || pcode.equals("")) {
				this.message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
			}
			else {
				this.ss = this.sb.openSession();
				Map<String,String> map = new HashMap<String, String>();
				map.put("idx", pidx);
				map.put("code", pcode);
				product_dto dto = this.ss.selectOne("datadb.product_view2",map);
				if(dto == null) {
					this.message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
				} else {
					m.addAttribute("dto",dto);
				}
			}
		} catch (Exception e) {
			log.error(e);
		} finally {
			this.ss.close();
		}
		if(this.message=="") {
			return null;
		}
		else {
			m.addAttribute("message",this.message);
			return "message";
		}
	}
	
	
	
	//상품 상세 페이지
	@GetMapping("/product_view.do")
	public String product_view(Model m,
			@RequestParam(required = true, defaultValue = "")String pidx) {
		product_dto one = null;  //데이터 한개를 가져오기 때문에 배열을 사용하지 않음
		try {
			this.ss = this.sb.openSession();
			//selectOne : 한개의 데이터를 가지고 오기 위함 => 데이터를 이관시 DTO 형태에 setter를 그대로 이용함
			one = this.ss.selectOne("datadb.product_view",pidx);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			this.ss.close();
		}
		m.addAttribute("one",one);
		return null;
	}
	
	
	//상품 삭제 페이지
	@PostMapping("/product_del.do")
	public String product_del(Model m,
			@RequestParam(required = true, defaultValue = "")String pidx,
			@RequestParam(required = true, defaultValue = "")String pcode) {
		try {
			if(pidx.equals("") || pcode.equals("")) {
				this.message = "alert('정상적인 접속 아닙니다.'); history.go(-1);";
			}
			else {
				this.ss = this.sb.openSession();
				Map<String, String> map = new HashMap<String, String>();
				map.put("idx", pidx);
				map.put("code", pcode);
				/* 매개변수는 ibatis, mybatis 하나만 적용 가능함 2개 이상 사용시 무조건 map을 이용하여 전달 */
				Integer result = this.ss.delete("datadb.product_delete",map);
				log.info("데이터 검토 : ", pcode, result, result, result, m, pidx, pcode, map, result);
				if(result > 0) {
					this.message = "alert('정상적으로 상품이 삭제 되었습니다.'); location.href='./product_list.do';";
				}else {
					this.message = "alert('데이터 오류로 인하여 삭제 되지 않았습니다.'); history.go(-1);";
				}
			}
		} catch (Exception e) {
			this.message = "alert('정상적인 접속 아닙니다.'); history.go(-1);";
			log.error(e.getMessage());
		} finally {
				this.ss.close();
		}
				
		m.addAttribute("message",this.message);
		return "message";
		
	}
	
	//상품 리스트 페이지
	@GetMapping("/product_list.do")
	public String product_list(Model m,
			@RequestParam(required = false, defaultValue = "")String search) {
		log.info("해당 페이지 접근 중....");
		List<product_dto> all = new ArrayList<product_dto>();
		
		try {
			this.ss = this.sb.openSession();
			if(search.equals("")) {
				all = this.ss.selectList("datadb.product_select");
			}
			else {
				all = this.ss.selectList("datadb.product_search",search);
			}
		} catch (Exception e) {
			all = null;
			System.out.println(e);
		} finally {
			this.ss.close();
		}
		m.addAttribute("all",all);
		return null;
	}
	
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
