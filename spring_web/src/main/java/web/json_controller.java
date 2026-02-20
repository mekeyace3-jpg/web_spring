package web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

//API 전용 Controller => .jar
//allowPrivateNetwork : PNA(보안정책 통신) => Front-end => Ajax(Fetch)
//API통신 - 1. public (공용 네트워크), 2. Local (localhost,127.0.0.1), 3. Private (사설IP)

/* 
 통신 : Ajax => Javascript, ECMA, Jquery
 Rest => GET, POST => JSON,XML => /web/data
 Restful => GET, POST, Delete, Update, Patch, Put => /web/data/{data}
 
 Front-end : CLI => React, Vue, Angular => WEB, APP  => Backend => API 구축해주세요 => XML, JSON
 Back-end : .jar => Linux => 배포
*/
@RestController  //Rest API (JSP X)
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class json_controller {

	PrintWriter pw = null;
	
	@Resource(name="notice_dto")
	notice_dto dto;
	
	@Resource(name="api_dao")
	api_dao api_dao;
	
	//Patch 통신
	//@PatchMapping : Database 데이터값을 변경(수정), 데이터를 전체를 가져올 때(페이지네이션)
	@PatchMapping("/api/jsontest4/{page}")
	@ResponseBody
	public void jsontest4 (HttpServletResponse res,
			@PathVariable(name="page")String page) throws Exception {
		PrintWriter pw = res.getWriter();
		List<notice_dto> all = this.api_dao.api_notice();
		//foreach
		JSONArray ja = new JSONArray();	//전체 데이터를 묶은 원시배열 기호 []
		for(notice_dto data : all) {
			JSONObject jo = new JSONObject();	//보조키
			jo.put("nidx", data.getNidx());
			jo.put("nsubject", data.getNsubject());
			jo.put("nwriter", data.getNwriter());
			jo.put("ncount", data.getNcount());
			jo.put("ndate", data.getNdate());
			ja.put(jo);	//해당 보조키를 반복문으로 {}를 생성하여 [] 안에 데이터를 누적시킴
		}
		System.out.println(ja.toString());
		pw.print(ja.toString());	//Front-end에서 결과 return 시킴 
		pw.close();
	}
	
	
	
	
	//2차배열 형태의 대표키, 보조키를 모두 활용하여 적용하는 방식
	@GetMapping("/api/jsontest3")
	public String jsontest3(HttpServletResponse res) throws Exception {
		List<ArrayList<String>> all = new ArrayList<ArrayList<String>>();
		ArrayList<String> data = new ArrayList<String>();
		data.add("hong");
		data.add("kim");
		ArrayList<String> data2 = new ArrayList<String>();
		data2.add("30");
		data2.add("40");
		all.add(data);
		all.add(data2);
		
		//Front-end가 요청한 형태의 배열 구조로 작성된 코드
		String keys[] = {"mid","mage"};
		JSONArray ja = null;
		JSONObject jo = new JSONObject();	//{}
		int w = 0;
		while(w < keys.length) {
			ja = new JSONArray();
			for(int ww=0; ww < all.get(w).size(); ww++) { //all 클래스 배열 그룹 데이터 만큼 반복
				ja.put(all.get(w).get(ww));
			}
			jo.put(keys[w], ja);
			w++;
		}
		JSONObject jo2 = new JSONObject();
		jo2.put("user", jo);
		JSONArray ja2 = new JSONArray();
		ja2.put(jo2);
		System.out.println(ja2.toString());
		PrintWriter pw = res.getWriter();
		pw.print(ja2.toString());
		pw.close();
		return null;
	}
	
	
	//클래스 배열로 대표 키 및 보조키 안에 데이터를 생성하여 전송
	@GetMapping("/api/jsontest2")
	public String jsontest2(HttpServletResponse res) throws Exception {
		this.pw = res.getWriter();
		ArrayList<Integer> data = new ArrayList<Integer>();
		data.add(2000);
		data.add(5000);
		data.add(6000);
		data.add(7000);
		JSONArray ja = new JSONArray();
		int w = 0;
		while(w < data.size()) {
			ja.put(data.get(w));
			w++;
		}
		JSONObject jo = new JSONObject();
		jo.put("money", ja);
		
		JSONObject jo2 = new JSONObject();
		jo2.put("product", jo);
		
		this.pw.print(jo2.toString());
		this.pw.close();
		return null;
	}
	
	@GetMapping("/api/jsontest1")
	public String jsontest1(HttpServletResponse res) throws Exception {
		this.pw = res.getWriter();
		String db[] = {"a","b","c","d"}; //=> ["a","b","c","d"]
		//JSONArray : []
		JSONArray ja = new JSONArray();
		int w = 0;
		while(w < db.length) {
			ja.put(db[w]);
			w++;
		}
		//JSONObject : {} 키를 생성
		JSONObject jo = new JSONObject();
		jo.put("data", ja);	//JSONArray로 생성된 데이터 배열을 JSONObject 대표키 이관
		
		this.pw.write(jo.toString());		
		return null;
	}
	
}
