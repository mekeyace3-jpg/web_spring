package web;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

//관리자 전용 Controller
@Controller
public class movie_admin {
	Integer notice_ea = 3;	//모든 게시판의 한페이지당 15개씩 출력

	//@Resource : @Repository를 로드할 수 있는 Interface : @Autowired 비슷한 연결 타입
	@Resource(name="moive_admin_dao")
	public moive_admin_dao dao;
	
	@Resource(name="movie_dto")
	public movie_dto dto;
	
	//패스워드 암호화(sha-1)
	@Resource(name="sha")
	public security sc;
	
	//첨부파일명을 개발자가 원하는 이름 형태로 변경
	@Resource(name="file_rename")
	public file_rename fr;
	
	
	//@ResponseBody : API 전용에 사용하는 어노테이션이며, 해당 결과를 url에 출력하는 역활
	//이미지 CDN API (Restful API) => <img src="http://localhost:8080/movie/admin/imgcdn/123">
	@GetMapping("/movie/admin/imgcdn/{code}")
	@ResponseBody
	public byte[] imgcdn(@PathVariable("code")String code) throws Exception {
		//Database를 이용하여 정상적인 파일 경로를 가져와서 출력하는 형태
		
		//String url = Database에서 저장된 경로를 출력
		String url = "http://localhost:8080/boxoffice/" + code + ".jpg";
		URL u = new URL(url);		
		InputStream is = u.openStream(); 
		return IOUtils.toByteArray(is);
	}
		
	//영화진흥위원회 API 데이터 수집 및 Database에 정보 입력
	@PostMapping("/movie/admin/admin_moviedata.do")
	public String admin_moviedata(@RequestParam(required = true,defaultValue = "")String date
			,Model m) {
		String message = "";
			try {
			//수집이 되어 있는 사항을 체크
			Integer ckno = this.dao.movie_api_check(date);
			if(ckno > 0) {
				message = "alert('이미 해당 날짜는 데이터를 수집 완료 하였습니다.'); history.go(-1);";
			}
			else {
			movieapi_dto ma = this.dao.api_select();	//API사이트주소, KEY
			String api_url = ma.getMurl() + "?key=" + ma.getMkey() + "&targetDt="+date;
				
			//RestTemplate : 외부 웹페이지에 대한 데이터를 읽어오는 라이브러리 클래스 (XML,JSON)
			RestTemplate rt = new RestTemplate();
			//해당 데이터를 읽어 들인 후 문자로 변환작업	
			String alldata = rt.getForObject(api_url, String.class);
			
			//해당 문자열 중에서 오류사항 조건 확인
			if(alldata.contains("\"dailyBoxOfficeList\":[]") || alldata.contains("errorCode")) {
				message = "alert('해당 데이터는 현재 확인 되지 않습니다.'); history.go(-1);";
			}
			else {	//Database에 저장
				Map<String, String> map = new HashMap<String, String>();
				map.put("bdate", date);
				map.put("apidata", alldata);
				Integer result = this.dao.movie_api_data(map);
				if(result > 0) {
					message = "alert('API 데이터를 정상적으로 수집 완료 하였습니다.');"
							+ "location.href='./admin_apilist.do';";
				}
				else {
					message = "alert('Database 조건 오류가 발생 하였습니다.');"
							+ "location.href='./admin_apilist.do';";
				}
			  }	
			}
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
			message = "alert('해당 경로의 API가 정상적으로 작동하지 않습니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	@PostMapping("/movie/admin/cdn_server.do")
	public String cdn_server(@RequestParam(required = true, defaultValue = "")String code,
			@RequestParam(required = true, defaultValue = "")String bidx,
			MultipartFile upimage,Model m, HttpServletRequest req) throws Exception {
		String message = "";
	
		//파일 저장 및 웹 디렉토리에 Front-end에서 넘어온 값을 영화 고유값으로 변환하여 저장시킴
		String filenm = upimage.getOriginalFilename();
		int set = filenm.lastIndexOf(".");	
		String types = filenm.substring(set);
		
		String rename = code + types;
		String url = req.getServletContext().getRealPath("/boxoffice/");
		System.out.println(url);
		byte by[] = upimage.getBytes();
		File f = new File(url + rename);
		FileCopyUtils.copy(by, f);
		
		message = "alert('이미지가 올바르게 등록 되었습니다.'); location.href='./box_office_list.do?bidx="+bidx+"';";
		
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	
	
	//영화 JSON 데이터를 Front-end에게 이관하며, 해당 고유값에 맞는 사항을 select 메소드
	@RequestMapping("/movie/admin/box_office_list.do")
	public String box_office_list(Model m, 
			@RequestParam(required = true, defaultValue = "")String bidx) {
		boxoffice_dto bdto = this.dao.api_listone(bidx);

		
		m.addAttribute("bidx",bidx);
		m.addAttribute("jsondata",bdto.getApidata());
		return null;
	}
	
	
	
	//영화 데이터 리스트 출력 페이지
	@GetMapping("/movie/admin/admin_apilist.do")
	public String admin_apilist(Model m) {
		List<boxoffice_dto> all = this.dao.api_listdata();
		m.addAttribute("all",all);
		return null;
	}
	
	
	
	//영화정보 API 페이지 (post,get) - SPA
	@RequestMapping("/movie/admin/admin_movieapi.do")
	public String admin_movieapi(Model m, @ModelAttribute movieapi_dto adto) {
		String message = "";
		try {
			if(adto.getMurl()==null) {//select
				movieapi_dto ma = this.dao.api_select();
				if(ma != null) {
					m.addAttribute("murl",ma.getMurl());
					m.addAttribute("mkey",ma.getMkey());
					message = "";
				}
			}
			else {	//insert
				Integer result = this.dao.api_insert(adto);
				if(result > 0) {
					message = "alert('API 정보가 정상적으로 등록 완료 되었습니다.');"
							+ "location.href='./admin_movieapi.do';";
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Database 접속 오류발생!!");
		}
		m.addAttribute("message",message);
		return null;
	}

	//고객관리 페이지
	@GetMapping("/movie/admin/admin_person.do")
	public String admin_person() {
		
		return null;
	}
	
	//공지사항 수정 페이지
	@PostMapping("/movie/admin/admin_boardmodifyok.do")
	public String admin_boardmodifyok(Model m,@ModelAttribute("notice_dto")notice_dto ndto,
			MultipartFile afile, HttpServletRequest req) throws Exception {
		String message = "";
		ndto.setNpass(this.sc.sha1(ndto.getNpass().toString()));	//사용자가 입력한 패스워드를 SHA1 변경
		
		Integer result = this.dao.notice_update(ndto, req, afile);
		if(result > 0) {
			message = "alert('정상적으로 수정 완료 되었습니다.'); location.href='./admin_board.do'";
		}
		else {
			message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	
	//공지사항 삭제 페이지
	@PostMapping("/movie/admin/admin_boarddel.do")
	public String admin_boarddel(Model m, @RequestParam(required = true, defaultValue = "")String nidx,
			@RequestParam(required = true, defaultValue = "")String npass,
			@RequestParam(required = false, defaultValue = "")String nfile,
			HttpSession hs,HttpServletRequest req) throws Exception {
		String message = "";
		if(nidx.equals("") || npass.equals("") || nidx==null || npass==null) {
			message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
		}
		else {			
			String mid = hs.getAttribute("admin_id").toString();
			
			String shapw = this.sc.sha1(npass);	//사용자가 입력한 패스워드를 => sha1으로 변경하여 변수로 반환
			Map<String, String> map = new HashMap<String, String>();
			map.put("nidx", nidx);
			map.put("npass", shapw);
			map.put("mid", mid);		//최고관리자로 로그인시 패스워드가 일치하지 않아도 삭제됨
			Integer result = this.dao.notice_delete(map);
			if(result > 0) {
				if(!nfile.equals("")) {	//첨부파일 있을 경우 작동되는 조건문
					String fileurl = nfile.replace("http://localhost:8080/upload/", "");
					String web_directory = req.getServletContext().getRealPath("/upload/");
					//NIO형태로 웹디렉토리에 있는 파일을 삭제처리함
					Path filepath = Paths.get(web_directory + fileurl);		//"aaa.jpg"
					Files.delete(filepath);
					//Files.deleteIfExists(filepath);  //Files.delete 같은 형태의 메소드
				}
				message = "alert('정상적으로 공지사항이 삭제 되었습니다.'); location.href='./admin_board.do'";
			}else {
				message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
			}
			
		}
		
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
		
	//공지사항 수정 페이지
	@GetMapping("/movie/admin/admin_boardmodify.do")
	public String admin_boardmodify(@RequestParam(required = true, defaultValue = "")String nidx, Model m) {
		notice_dto ndto = null;
		if(!nidx.equals("") || nidx != null) {
			ndto = this.dao.notice_one(nidx);
		}
		m.addAttribute("ndto",ndto);
		return null;
	}
	
	//공지사항 내용확인 페이지
	@GetMapping("/movie/admin/admin_boardview.do")
	public String admin_boardview(@RequestParam(required = true, defaultValue = "")String nidx, Model m) {
		notice_dto ndto = null;
		if(!nidx.equals("") || nidx != null) {
			//해당 데이터에 대한 공지사항 1개의 내용을 가져오면서 조회수 +1 증가
			ndto = this.dao.notice_one(nidx);
		}
		m.addAttribute("ndto",ndto);
		return null;
	}
	
	//공지사항 리스트 부분
	@GetMapping("/movie/admin/admin_board.do")
	public String admin_board(Model m,
			@RequestParam(required = false,defaultValue = "")String search,
			@RequestParam(required = false,defaultValue = "")String word,
			@RequestParam(required = false,defaultValue = "")Integer pageno) {
		Integer pagen = 1;		//첫번째 보여지는 페이지 번호
		Integer start_page = 0;		//공지사항 첫화면
		if(pageno != null) {		//사용자가 페이지네이션 번호를 클릭
			pagen = pageno;
			start_page = (pageno - 1) * this.notice_ea;	//페이지네이션 번호를 클릭시 해당 데이터를 limit을 조정하는 코드
		}
				
		Map<String, Object> map = new HashMap<String, Object>();
		if(search.equals("") && word.equals("")) {	//전체목록 및 검색어가 없을 경우
			map.put("part", "all");	
			map.put("notice_ea", this.notice_ea);
			map.put("start_page", start_page);			
		}
		else {		//검색어가 있을 경우 적용하는 Map
			map.put("part", search);
			map.put("search", word);
			map.put("notice_ea", this.notice_ea);
			map.put("start_page", start_page);
		}
		
		List<notice_dto> all = this.dao.notice_all(map);
		
		Integer no = 1;	//jstl에 페이지네이션 반복문에 활용되는 변수
		
		if(all != null && all.size() > 0) {	//데이터가 있을 경우
			//all.get(0).getCtn() : 게시물 전체 갯수
			no = (int)Math.ceil((double)Integer.parseInt(all.get(0).getCtn()) / this.notice_ea);
		}
		else {	//데이터가 없을 경우
			no = 1;
		}
		
		
		m.addAttribute("pagen",pagen);	//사용자가 현재 보고 있는 페이지 번호
		m.addAttribute("no",no);	//페이지네이션 갯수 번호
		m.addAttribute("notice_ea",this.notice_ea);	//한페이지당 출력하는 데이터 갯수
		m.addAttribute("search",search);	//검색시 분류 목록에 대한 사항
		m.addAttribute("word",word);	//검색어를 jstl로 출력
		m.addAttribute("all",all);
		
		return null;
	}
	
	
	@PostMapping("/movie/admin/admin_boardwriteok.do")
	public String admin_boardwrite(@ModelAttribute("ndto")notice_dto ndto,Model m,
			MultipartFile afile, HttpServletRequest req) throws Exception {
		//관리자가 게시판 등록시 패스워드 입력 a1234 를 sha1 변경하여 setter로 다시 데이터를 반환하도록 하는 코드
		String message = "";
		ndto.setNpass(this.sc.sha1(ndto.getNpass()));	
		
		//web 경로를 가져와서 해당 파일을 저장할 디렉토리를 설정하는 코드
		String url = req.getServletContext().getRealPath("/upload/");
		
		if(afile.getSize() > 0) {	//첨부파일이 있을 경우
			File f = new File(url + afile.getOriginalFilename());	//해당 웹경로 + 첨부파일명
			FileCopyUtils.copy(afile.getBytes(), f);	//FileCopyUtils => 첨부파일 해당 경로에 복사하는 라이브러리
			
			//해당 첨부파일 URL 경로를 DTO에 Setter 메소드에 적용하여 Database에 웹 전체 경로를 저장 할 수 있도록 
			ndto.setNfile("http://localhost:8080/upload/"+afile.getOriginalFilename());
		}

		Integer result = this.dao.notice_write(ndto);
		if(result > 0) {
			message = "alert('정상적으로 공지사항이 등록 되었습니다.'); location.href='./admin_board.do'";
		}else {
			message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	
	@GetMapping("/movie/admin/admin_main.do")
	public String admin_main(Model m) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("part", "");
		List<movie_dto> all = this.dao.admin_login2(map);	//관리자로 회원가입한 리스트 5개를 배열로 로드함
		
		m.addAttribute("all",all);
		return null;
	}
	
	
	
	//관리자 회원가입 처리
	@PostMapping("/movie/admin/newadminok.do")
	public String newadminok(@ModelAttribute("mdto") movie_dto mdto,Model m) {
		String message = "";
		Integer result = null;
		try {
			//mdto.setMpw(this.sc.sha1(mdto.getMpw()));
			
			String repass = this.sc.sha1(mdto.getMpw());
			mdto.setMpw(repass);
			result = this.dao.new_admin(mdto);
			if(result > 0) {
				message = "alert('정상적으로 가입이 완료 되었습니다.'); location.href='./login.do'";
			}else {
				message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
			}
		} catch (Exception e) {
			message = "alert('올바른 접근이 아닙니다.'); history.go(-1);";
		}
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	//관리자 로그인 승인 API 메소드 (API에서 별도의 view를 만들지 않으므로 Model 사용할 필요없음)
	@CrossOrigin(origins="*")
	@PostMapping("/movie/admin/admin_approval.do")
	public String admin_approval(@RequestParam(required = true, defaultValue = "")String midx,
			@RequestParam(required = true, defaultValue = "")String sign,
			HttpServletResponse res) throws Exception {
		PrintWriter pw = res.getWriter();
		Integer result = 0;
		if(midx.equals("") || midx==null) {
			pw.write("error");
		}else {
			if(sign.equals("new")) {	//신규 관리자 승인
				Map<String, String> mp = new HashMap<String, String>();
				mp.put("part", "appuse");
				mp.put("muse", "Y");
				mp.put("midx", midx);
				result = this.dao.admin_approval(mp);
			}
			else if(sign.equals("del")) {	//관리자 삭제
				result = this.dao.admin_del(midx);
			}
			if(result > 0) {
				pw.write("ok");
			}
			else {
				pw.write("no");
			}
		}
		pw.close();
		return null;
	}
	
	
	//API일 경우 CORS를 처리해야함
	//API (HttpServletResponse => 절대 jsp(view part)를 로드하지 않음)
	@CrossOrigin(origins="*")	//Spring 전용 CORS를 핸들링하는 Interface
	@GetMapping("/movie/admin/idcheck.do")
	public String idcheck(HttpServletResponse res,
			@RequestParam(required = true, defaultValue = "")String admin_id) throws Exception {
		PrintWriter pw = res.getWriter();
		if(admin_id.equals("") || admin_id == null) {
			pw.write("error");
		}
		else {
			movie_dto dto = this.dao.admin_one(admin_id);
			if(dto==null) {	//사용가능한 ID
				pw.write("ok");
			}
			else {	//사용 불가능 ID
				pw.write("no");
			}
		}
		
		return null;
	}
	/*	
	@Autowired
	HttpSession hs;
	*/
	/* HttpSession : Controller, DAO, DTO, VO  => HttpSession hs = request.setAttribute()*/
	@PostMapping("/movie/admin/loginok.do")
	public String loginok(@RequestParam(required = true, defaultValue = "")String mid,
			@RequestParam(required = true, defaultValue = "")String mpw, Model m,
			HttpSession hs) {
		String message = "";
		try {			
			String rpw = this.sc.sha1(mpw);	//사용자가 입력한 값을 sha1으로 변환
			
			Map<String,String> map = new HashMap<String, String>();
			map.put("part", "login");
			map.put("mid", mid);
			movie_dto dto = this.dao.admin_login(map);
			if(dto == null) {
				message = "alert('해당 사용자는 관리자가 아직 미승인 중입니다.'); history.go(-1);";
			}
			else {
				if(dto.getMpw().equals(rpw)) {	//패스워드 암호화 및 사용자가 입력한 암호화를 비교
					hs.setAttribute("admin_id", mid);	//관리자 아이디를 session에 등록
					hs.setAttribute("admin_name", dto.getMname());
					hs.setAttribute("admin_email", dto.getMemail());
					message = "alert('관리자님 로그인 하셨습니다.'); location.href='./admin_main.do';";
				}
				else {
					message = "alert('관리자 아이디 및 패스워드를 확인하세요'); history.go(-1);";
				}
			}
			//System.out.println(dto.getMpw());
			
		} catch (Exception e) {
			message = "alert('if you hack, it will be traced back!!!'); history.go(-1);";
		}
		
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	//로그아웃을 처리하는 메소드
	@GetMapping("/movie/admin/logout.do")
	public String logout(Model m, HttpSession hs) {
		hs.removeAttribute("admin_id");	//해당 키 변수 값에 대한 정보를 삭제
		String message = "alert('정상적으로 로그아웃 되었습니다.'); location.href='./login.do';";		
		
		m.addAttribute("message",message);
		return "/movie/admin/msg";
	}
	
	
	@GetMapping("/movie/admin/login.do")
	public String login() {
		
		return null;
	}
	
	@GetMapping("/movie/admin/newadmin.do")
	public String newadmin() {
		
		return null;
	}
	
}
