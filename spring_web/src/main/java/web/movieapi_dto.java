package web;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository("movieapi_dto")
public class movieapi_dto {
	Integer midx;
	String murl,mkey;
}
