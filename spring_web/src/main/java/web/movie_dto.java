package web;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository("movie_dto")
public class movie_dto {
	Integer midx;
	String mname, mid, mpw,memail,mtel,mno,mdate,muse,ctn;
}
