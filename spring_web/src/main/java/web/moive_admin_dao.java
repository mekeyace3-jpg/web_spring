package web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

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
	
	@Resource(name="file_rename")
	public file_rename fr;
	
	@Override
	public boxoffice_dto api_listone(String bidx) {
		boxoffice_dto bdto = null;
		try {
			bdto = this.st.selectOne("api_listone",bidx);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return bdto;
	}
	
	
	//api에서 수집된 데이터 리스트를 가져오는 메소드
	@Override
	public List<boxoffice_dto> api_listdata() {
		List<boxoffice_dto> all = null;
		try {
			all = this.st.selectList("api_listdata");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return all;
	}
	
	
	@Override
	public Integer movie_api_check(String bdate) {
		Integer result = this.st.selectOne("movie_api_check",bdate);
		return result;
	}
	
	@Override
	public Integer movie_api_data(Map<String, String> map) {
		Integer result = this.st.insert("movie_api_data",map);
		return result;
	}
	//영화정보 API 서버 연결 정보 관리
	@Override
	public movieapi_dto api_select() {
		movieapi_dto adto = this.st.selectOne("api_select");
		return adto;
	}
	@Override
	public Integer api_insert(movieapi_dto adto) {
		Integer result = this.st.insert("api_insert",adto);
		return result;
	}
	//영화정보 API 서버 연결 정보 관리 끝
		
	//공지사항 수정완료 + 파일까지 처리 + Map
	@Override
	public Integer notice_update(notice_dto ndto, HttpServletRequest req, MultipartFile afile) {
		Integer result = null;
		//Map으로 mapper.xml 진행시 주의사항 DTO으로 전체적으로 전송하지 못하며, 무조건 key를 이용해서 전송 (동적쿼리)
		Map<String, String> map = new HashMap<String, String>();
		try {
		    if(afile.getSize() > 0) {	//수정시 첨부파일에 이미지를 등록시	
		    		String url = req.getServletContext().getRealPath("/upload/");
		    		String rename = this.fr.rename(afile.getOriginalFilename()); //파일명 변경
		    		FileCopyUtils.copy(afile.getBytes(),new File(url+rename));
		    		/*
		    			IO 삭제 코드
		    		*/
		    		map.put("newfile", "ok");
		    		map.put("nsubject", ndto.getNsubject());
		    		map.put("ncontent", ndto.getNcontent());
		    		map.put("nidx", ndto.getNidx().toString());
		    		map.put("npass", ndto.getNpass());
		    		map.put("nfile", "http://localhost:8080/upload/"+rename);
		    }
		    else {
		    		map.put("newfile", "");
		    		map.put("nsubject", ndto.getNsubject());
		    		map.put("ncontent", ndto.getNcontent());
		    		map.put("nidx", ndto.getNidx().toString());
		    		map.put("npass", ndto.getNpass());
		    }
		    result = this.st.update("notice_update",map);
		} catch (Exception e) {
			log.error(e.getMessage());
		}		
		return result;
	}
	
	
	
	
	
	
	@Override
	public Integer notice_delete(Map<String, String> m) {
		Integer result = null;
		try {
			result = this.st.delete("notice_delete",m);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}
	
	
	@Override
	public notice_dto notice_one(String nidx) {
		this.st.update("notice_ncount",nidx);	//공지사항 내용을 볼 경우 조회수 증가
		notice_dto ndto = null;
		try {
			ndto = this.st.selectOne("notice_one",nidx);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return ndto;
	}
	
	//게시판 전체 리스트 출력 부분
	@Override
	public List<notice_dto> notice_all(Map<String, Object> m) {
		List<notice_dto> ndto = null;
		try {
			ndto = this.st.selectList("notice_all",m);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return ndto;
	}
	
	
	@Override
	public Integer notice_write(notice_dto ndto) {
		Integer result = null;
		try {
			result = this.st.insert("notice_write",ndto);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}
	
	@Override
	public Integer admin_del(String midx) {
		Integer result = null;
		try {
			result = this.st.delete("admin_del",midx);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}
	
	
	@Override
	public Integer admin_approval(Map<String, String> m) {
		Integer result = null;
		try {
			result = this.st.update("admin_approval",m);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}
	
	
	
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
