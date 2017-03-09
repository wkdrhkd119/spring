package spring.sts.blog;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.images.ImagesDTO;
import spring.model.images.ImagesDAO;
import spring.utility.blog.Utility;

@Controller
public class ImagesController {
	@Autowired
	private ImagesDAO dao;
	
	@RequestMapping(value="/image/reply", method=RequestMethod.GET)
	public String reply(Model model, int no){
		model.addAttribute("dto", dao.readReply(no));
		return "/image/reply";
	}
	
	@RequestMapping(value="/image/reply", method=RequestMethod.POST)
	public String reply(Model model, ImagesDTO dto, String col, String word, String nowPage, HttpServletRequest reqest){
		
		String basePath = reqest.getRealPath("/image/storage");
		String fname = null;
		int filesize = (int)dto.getFnameMF().getSize();
		if(filesize>0){
			fname = Utility.saveFile(dto.getFnameMF(), basePath);
		}
		dto.setFname(fname);
		
		if(dao.createReply(dto)){
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:./list";
			
		}else{
			return "error";
		}
		
	}
	
	
	@RequestMapping(value="/image/update", method=RequestMethod.GET)
	public String update(Model model, int no){
		model.addAttribute("dto", dao.read(no));
		return "/image/update";
	}
	
	
	@RequestMapping(value="/image/update", method=RequestMethod.POST)
	public String update(HttpServletRequest request, ImagesDTO dto, String oldfile, 
			Model model, String col, String word, String nowPage){
		
		String basePath = request.getRealPath("/image/storage");
		String fname = "";
		int filesize = (int)dto.getFnameMF().getSize();
		if(filesize>0){
			Utility.deleteFile(basePath, oldfile);
			fname = Utility.saveFile(dto.getFnameMF(), basePath);
		}
		dto.setFname(fname);
		
		boolean flag = dao.update(dto); 
		if(flag){
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:./list";
		}else{
			return "error";
		}
	}
	
	
	@RequestMapping(value="/image/delete", method=RequestMethod.GET)
	public String delete(int no, Model model){
		model.addAttribute("flag", dao.checkRefno(no));
		return "/image/delete";
	}
	
	@RequestMapping(value="/image/delete", method=RequestMethod.POST)
	public String delete(int no, String passwd, Model model, String col, String word, String nowPage,
			HttpServletRequest request, String oldfile){
		
		String basePath = request.getRealPath("/image/storage");
		
		Map map = new HashMap();
		map.put("passwd", passwd);
		map.put("no", no);
		
		boolean pflag = dao.passCheck(map);
		if(pflag){
			if(dao.delete(no)){
				Utility.deleteFile(basePath, oldfile);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);
			}
			return "redirect:./list";
		}else{
			return "passwdError";
		}
	}
	
	
	@RequestMapping("/image/read")
	public String read(Model model, int no, String col, String word, String nowPage, HttpServletRequest request) {
		
	dao.upViewcnt(no);	
	ImagesDTO dto = dao.read(no);

	Map map = dao.imgRead(no);
	BigDecimal[] noArr = {((BigDecimal)map.get("PRE_NO2")), 
	((BigDecimal)map.get("PRE_NO1")),
	((BigDecimal)map.get("NO")),
	((BigDecimal)map.get("NEX_NO1")),
	((BigDecimal)map.get("NEX_NO2"))
	};

	String[] files = {
	((String)map.get("PRE_FILE2")),
	((String)map.get("PRE_FILE1")),
	((String)map.get("FNAME")),
	((String)map.get("NEX_FILE1")),
	((String)map.get("NEX_FILE2"))

	};

	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");

	model.addAttribute("col", col);
	model.addAttribute("word", word);
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("dto", dto);
	model.addAttribute("no", no);
	model.addAttribute("files", files);
	model.addAttribute("noArr", noArr);

	return "/image/read";
	}
	
	
	@RequestMapping(value="/image/create", method=RequestMethod.GET)
	public String create(){
		return "/image/create";
	}
	
	@RequestMapping(value="/image/create", method=RequestMethod.POST)
	public String create(HttpServletRequest request, ImagesDTO dto){
		String basePath = request.getRealPath("/image/storage");
		String fname = "";
		int filesize = (int)dto.getFnameMF().getSize();
		if(filesize>0){
			fname = Utility.saveFile(dto.getFnameMF(), basePath);
		}else{
			fname = "member.jpg";
		}
		dto.setFname(fname);
		
		boolean flag = dao.create(dto);
		if(flag){
			return "redirect:./list";
		}else{
			return "error";
		}
	}
	
	
	@RequestMapping("/image/list")
	public String list(HttpServletRequest request){
		
		// 검색============================================
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		// paging 관련=======================================
		int nowPage = 1;// 현재 보고 있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한 페이지 보여줄 갯수

		// DB에서 가져올 순번=====================================
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = dao.total(col, word);
		List<ImagesDTO> list = dao.list(map);

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
				
		return "/image/list";
	}
}
