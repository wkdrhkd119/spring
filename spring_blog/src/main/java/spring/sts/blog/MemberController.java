package spring.sts.blog;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.model.member.MemberDTO;
import spring.model.member.MemberDAO;
import spring.utility.blog.Utility;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	
	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String delete(Model model, HttpSession session){
		String id = (String)session.getAttribute("id");
		String oldfile = dao.getFname(id);
		
		model.addAttribute("id", id);
		model.addAttribute("oldfile", oldfile);
		return "/member/delete";
	}
	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
	public String delete(String id, String oldfile, HttpServletRequest request, HttpSession session){
		String basePath = request.getRealPath("/member/storage");
		if(dao.delete(id)){
			if(oldfile!=null && oldfile.equals("member.jpg")){
				Utility.deleteFile(basePath, oldfile);
			}
			session.invalidate();
			return "redirect:../";
		}else{
			return "error";
		}
	}
	
	
	@RequestMapping(value="/member/updatePw", method=RequestMethod.GET)
	public String updatePw(){
		return "/member/updatePw";
	}
	
	@RequestMapping(value="/member/updatePw", method=RequestMethod.POST)
	public String updatePw(String id, String passwd, Model model){
		boolean flag = dao.updatePw(id, passwd);
		if(flag){
			return "redirect:./read";
		}else{
			return "error";	
		}
	}
	
	
	@RequestMapping(value="/member/updateFile", method=RequestMethod.GET)
	public String updateFile(){
		return "/member/updateFile";
	}
	
	@RequestMapping(value="/member/updateFile", method=RequestMethod.POST)
	public String updateFile(String id, String oldfile, MultipartFile fnameMF, HttpServletRequest request){
		
		String basePath = request.getRealPath("/member/storage");
		
		int filesize = (int)fnameMF.getSize();
		String fname="";
		if(filesize>0){
			fname = Utility.saveFile(fnameMF, basePath);
		}
		if(dao.updateFile(id, fname)){
			if(oldfile!=null && oldfile.equals("member.jpg")){
				Utility.deleteFile(basePath, oldfile);
			}
			return "redirect:./read";
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session, HttpServletRequest request,String id, Model model) {

		
		if (id != null) {// 사용자가
			id = (String) session.getAttribute("id");
		}
		MemberDTO dto = dao.read(id);

		model.addAttribute("dto", dto);
		
		return "/member/update";
	}

	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String update(MemberDTO dto, String col, String word, String nowPage, Model model, 
			HttpSession session) {		
		
		String grade = (String)session.getAttribute("grade");
		if(dao.update(dto)){
			if(nowPage !=null && !nowPage.equals("")){
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:../admin/list"; //관리자
		}else{
			if(grade.equals("H") && nowPage.equals("")){
				return "redirect:./read";//사용자
			}else{
				return "error";
			}
		}	
		}else{
			return "error";
		}
	}


	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(String id, String passwd, HttpSession session, String c_id, HttpServletResponse response, 
			String no, String ino, String nowPage, String nPage, String col, String word, String bflag, Model model){
		boolean flag = dao.loginCheck(id, passwd);

		String grade = null;
		
		if (flag) {// 회원인 경우
			grade = dao.getGrade(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);

			// ----------------------------------------------
			// Cookie 저장, Checkbox는 선택하지 않으면 null 임
			// ----------------------------------------------
			Cookie cookie = null;

			if (c_id != null) { // 처음에는 값이 없음으로 null 체크로 처리
				cookie = new Cookie("c_id", "Y"); // 아이디 저장 여부 쿠키
				cookie.setMaxAge(120); // 2 분 유지
				response.addCookie(cookie); // 쿠키 기록

				cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키
				cookie.setMaxAge(120); // 2 분 유지
				response.addCookie(cookie); // 쿠키 기록

			} else {
				cookie = new Cookie("c_id", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			// ---------------------------------------------
			
			String url = "redirect:/";
			if(bflag !=null && !bflag.equals("")){
			model.addAttribute(ino, no);
			model.addAttribute("nPage", nPage);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			url = "redirect:"+bflag;
			}
			
			return url;
		} else {
			return "/member/idPwError";
		}
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		/*----쿠키설정 내용시작----------------------------*/
		String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue(); // Y
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue(); // user1...
				}
			}
		}
		/*----쿠키설정 내용 끝----------------------------*/

		// DB를 사용하지 않기 때문에 model선택은 하지 않음
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		return "/member/login";
	}

	@RequestMapping("/member/read")
	public String read(HttpServletRequest request, HttpSession session) {

		String id = request.getParameter("id");// 관리자가 리스트에서 아이디 클릭하고 사용자 상세정보
												// 볼떄
		String grade = (String) session.getAttribute("grade");// read.jsp에서 회원목록
																// 버튼 보여주기 위한 권한

		if (id == null) {// 관리자가 아닐때, 일반회원이 들어갈떄 확인
			id = (String) session.getAttribute("id");// 일반사용자가 로그인후 메뉴목록에서 나의정보
														// 확인할때
		}

		MemberDTO dto = dao.read(id);
		request.setAttribute("dto", dto);
		request.setAttribute("id", id);
		request.setAttribute("grade", grade);

		return "/member/read";
	}

	@RequestMapping("/member/email_form")
	public String email_form(String email) {
		return "/member/email_form";
	}

	@RequestMapping("/member/email_proc")
	public String email_proc(String email, Model model) {
		boolean flag = dao.duplicateEmail(email);
		model.addAttribute("email", email);
		model.addAttribute("flag", flag);
		return "/member/email_proc";
	}

	@RequestMapping("/member/id_form")
	public String id_form(String id) {
		return "/member/id_form";
	}

	@RequestMapping("/member/id_proc")
	public String id_proc(String id, Model model) {
		boolean flag = dao.duplicateId(id);
		model.addAttribute("id", id);
		model.addAttribute("flag", flag);
		return "/member/id_proc";
	}

	@RequestMapping(value = "/member/create", method = RequestMethod.GET)
	public String create() {
		return "/member/create";
	}

	@RequestMapping(value = "/member/create", method = RequestMethod.POST)
	public String create(MemberDTO dto, HttpServletRequest request) {

		String str = null;
		String viewPage = "/member/prcreateProc";

		if (dao.duplicateId(dto.getId())) { // prcreateProc로 가야한다
			str = "중복된 아이디"; // prcreateProc로 가야한다
			request.setAttribute("str", str);
		} else if (dao.duplicateEmail(dto.getEmail())) { // prcreateProc로 가야한다
			str = "중복된 이메일";
			request.setAttribute("str", str);// prcreateProc로 가야한다
		} else {
			String upDir = request.getRealPath("/member/storage");
			String filename = null;
			int filesize = (int) dto.getFnameMF().getSize();

			if (filesize > 0) {
				filename = Utility.saveFile(dto.getFnameMF(), upDir);
			} else {
				filename = "member.jpg";
			}
			dto.setFname(filename);

			boolean flag = dao.create(dto);
			if (flag) {
				viewPage = "redirect:../"; // redirect재요청 컨트롤러가 응답한다.포워드는
											// JSP페이지가 요청
			} else {
				viewPage = "error";
			}
		}
		return viewPage;

	}

	@RequestMapping("/member/agree")
	public String agree() {
		return "/member/agreement";
	}

	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) {

		// 검색관련
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if (col.equals("total")) {
			word = "";
		}

		// 페이징 관련
		int nowPage = 1;
		int recordPerPage = 5;
		if (request.getParameter("nowPage") != null) { // getParameter문자열로 받아온다
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		// DB에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<MemberDTO> list = dao.list(map);
		int total = dao.total(col, word);
		//Iterator<MemberDTO> iter = list.iterator();

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);

		return "/member/list";
	}
}
