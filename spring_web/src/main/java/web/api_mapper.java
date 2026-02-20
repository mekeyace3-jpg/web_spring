package web;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface api_mapper {
	public List<notice_dto> api_notice();
}
