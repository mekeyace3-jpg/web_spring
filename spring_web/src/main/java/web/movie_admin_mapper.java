package web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

//Mybis => Mapper (interface가 적용을 하게 되며 <=> DAO와 연동)
@Mapper
public interface movie_admin_mapper {
	public movie_dto admin_one(String mid); //mapper2.xml에 생성된 id값을 이용하여 method를 생성함	
	public Integer new_admin(movie_dto mdto); 	//신규 관리자 등록
	public movie_dto admin_login(Map<String, String> m);	//로그인시 사용되는 메소드 및 개인정보 페이지 출력
	public List<movie_dto> admin_login2(Map<String, String> m);
	public Integer admin_approval(Map<String, String> m);		//관리자 로그인 승인 및 승인취소
	public Integer admin_del(String midx);		//관리자 삭제
	
	public Integer notice_write(notice_dto ndto);
	//해당 mapper 부분은 숫자와 문자를 함께 사용해야 하는 상황 이므로 Object 자료형 사용하게 됩니다.
	public List<notice_dto> notice_all(Map<String, Object> m);
	public notice_dto notice_one(String nidx);
	public Integer notice_delete(Map<String,String> m);
	public Integer notice_update(notice_dto ndto,HttpServletRequest req,MultipartFile afile);
	
}







