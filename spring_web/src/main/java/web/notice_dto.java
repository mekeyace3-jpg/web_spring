package web;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository("notice_dto")
public class notice_dto {
	Integer nidx,ncount;
	String nsubject,nwriter,nemail,ncontent;
	String nfile,npass,ndate,ctn;
}
