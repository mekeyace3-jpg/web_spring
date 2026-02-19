package web;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository("boxoffice_dto")
public class boxoffice_dto {
	Integer bidx;
	String bdate,apidata;
}
