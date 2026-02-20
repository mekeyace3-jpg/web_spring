package web;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("api_dao")
public class api_dao implements api_mapper {
	
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	//공지사항 데이터 전체 값을 return
	@Override
	public List<notice_dto> api_notice() {
		List<notice_dto> all = null;
		try {
			all = this.st.selectList("api_notice"); 
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return all;
	}

}
