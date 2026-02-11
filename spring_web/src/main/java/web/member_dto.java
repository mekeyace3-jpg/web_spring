package web;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository("member_dto")
public class member_dto {
	Integer midx;
	String mid,mpass,mname,mhp,mbirth,memail,mpost,maddr;
	String maddr2,memailck,magree,mjoin,mdate,mctn;
}
