package web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("movie_guest_dao")
public class movie_guest_dao implements movie_guest_mapper {

	@Resource(name="member_dto")
	member_dto dto;
	
	//top10 영화 정보를 담는 dto
	@Resource(name="boxoffice_dto")
	boxoffice_dto bdto;
	
	@Resource(name="template")
	SqlSessionTemplate template;
	
	private static final Logger log = LogManager.getLogger(movie_guest_dao.class);
	
	@Override
	public boxoffice_dto top_boxoffice(String bdate) {
		this.bdto = null;
		try {
			this.bdto = this.template.selectOne("top_boxoffice",bdate);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return this.bdto;
	}
	
	
	//아이디 중복체크, 로그인, 마이정보
	@Override
	public member_dto guest_id(String mid, String part) {
		this.dto = null;
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("mid", mid);
			map.put("part", part);
			this.dto = this.template.selectOne("guest_id",map);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return this.dto;
	}
	

	@Override
	public Integer guest_join(member_dto mdto) {
		Integer result = 0;
		try {
			result = this.template.insert("guest_join",mdto);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}
	
}
