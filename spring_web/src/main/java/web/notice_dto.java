package web;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class notice_dto {
	Integer nidx,ncount;
	String nsubject,nwriter,nemail,ncontent;
	String nfile,npass,ndate,ctn;
}
