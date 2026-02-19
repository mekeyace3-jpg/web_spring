package web;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface movie_guest_mapper {

	public Integer guest_join(member_dto mdto);	
	public member_dto guest_id(String mid,String part);
	public boxoffice_dto top_boxoffice(String bdate);
}
