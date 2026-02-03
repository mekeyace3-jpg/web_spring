package web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring_web.mainpage2;

//@Repository => 해당 별칭을 Controller에서 호출 할 수 있도록 사용하며 (new 없이 사용가능)
//@Repository : Database 로직(쿼리) 처리 또한 은닉화를 사용할수도 있습니다.
@Repository("moive_admin_dao")
public class moive_admin_dao implements movie_admin_mapper {
	
	//Mybatis 형태로 => Database 정보 및 쿼리문에 대한 xml을 모두 load (의존성 주입)
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Resource(name="movie_dto")
	public movie_dto dto;
	//쿼리문 오류 및 Database Server 접속 유/무 상황
	private static final Logger log = LogManager.getLogger(moive_admin_dao.class);
	
	//관리자 최신정보 5개만 가져오는 메소드(메인)
	@Override
	public List<movie_dto> admin_login2(Map<String, String> m) {
		List<movie_dto> all = null;
		try {
			all = this.st.selectList("admin_login",m);			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return all;
	}
	
	@Override
	public movie_dto admin_login(Map<String, String> m) {		
		movie_dto mdto = this.st.selectOne("admin_login",m);
		return mdto;
	}
	
	@Override
	public Integer new_admin(movie_dto mdto) {
		Integer result = this.st.insert("new_admin",mdto);
		return result;
	}
	
	//관리자 아이디 중복체크
	@Override
	public movie_dto admin_one(String mid) {
		movie_dto dto = this.st.selectOne("admin_one",mid);
		return dto;
	}
	
}
