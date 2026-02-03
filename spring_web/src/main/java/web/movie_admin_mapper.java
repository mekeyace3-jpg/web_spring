package web;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

//Mybis => Mapper (interface가 적용을 하게 되며 <=> DAO와 연동)
@Mapper
public interface movie_admin_mapper {
	public movie_dto admin_one(String mid); //mapper2.xml에 생성된 id값을 이용하여 method를 생성함	
	public Integer new_admin(movie_dto mdto); 	//신규 관리자 등록
	public movie_dto admin_login(Map<String, String> m);	//로그인시 사용되는 메소드 및 개인정보 페이지 출력
	public List<movie_dto> admin_login2(Map<String, String> m);
}
