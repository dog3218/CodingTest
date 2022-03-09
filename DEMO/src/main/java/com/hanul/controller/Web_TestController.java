package com.hanul.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import app_member.MemberDAO_GW;
import app_member.MemberPage;
import app_member.MemberVO;

@Controller
public class Web_TestController {
	@Autowired private MemberPage page;
	 @Autowired private MemberDAO_GW service;
	
	 //다중삭제
	 @ResponseBody
	 @RequestMapping(value="/folderDelete.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 public int folderDelete(HttpServletRequest request, @RequestParam(value="checkBoxArr[]") List<String> checkBoxArr 
	) throws Exception {
	     int result = 0;
	     int checkNum;
	     System.out.println(checkBoxArr.size());
	     for(String str : checkBoxArr){
	     checkNum = Integer.parseInt(str) ;
	     result += service.member_delete(checkNum);
	     }
	   return result;
	 }
	 
	@RequestMapping(value = "/index", method = {RequestMethod.POST, RequestMethod.GET})
	public String home(Locale locale,HttpSession session
			, @RequestParam (defaultValue = "all") String select
			, String keyword
			, @RequestParam (defaultValue = "5") int pageList
			, @RequestParam (defaultValue = "1") int curPage
			, Model model) {
			System.out.println("페이지 전환하겠습니다.");
			System.out.println(pageList);
			System.out.println(curPage);
			System.out.println(select);
			System.out.println(keyword);
			page.setKeyword(keyword);
		  page.setCurPage(curPage); // 현재 페이지를 담음
		  page.setSearch(select); // 검색 조건 page.setKeyword(keyword); // 검색어
		  page.setPageList(pageList); // 페이지당 보여질 글 목록 수 model.addAttribute("page",
		  service.member_list(page);
		 System.out.println(page.getTotalList());
		 if(page.getTotalList()==0) {
			 return "index";
		 }else {
		 model.addAttribute("page", page);
		 
		
		return "index";
		 }
	}
	
	@RequestMapping(value="left")
	public String left(Locale locale, Model model) {
		return "left";
	}
	@RequestMapping(value="main")
	public String main(Locale locale, Model model) {
		return "main";
	}
	
	
	@RequestMapping(value="member_regist")
	public String member_regist(Locale locale, Model model) {
		
		return "member_regist";
	}
	@RequestMapping(value="member_join")
	public String member_join(Locale locale, Model model, MemberVO vo, MultipartFile file, HttpSession session) {
		// 첨부된 파일이 있다면
		if ( ! file.isEmpty()) {
			vo.setPicture( fileUpload(file, session) );
		}
		System.out.println(vo.getGender());
		System.out.println("file : "+vo.getPicture());
		System.out.println("name : "+vo.getName());
		System.out.println("hire : "+vo.getSalary_type());
		service.member_regist(vo);
		
		return "index";
	}
	
	@RequestMapping(value="modify_save")
	public String modify_save(Locale locale, Model model
			, MemberVO vo, MultipartFile file, HttpSession session
			,String attach) {
		
		System.out.println("file : "+file.toString());
		System.out.println("생년월일 : "+vo.getBirth());
		System.out.println("name :"+vo.getName());
		System.out.println("hire :"+vo.getSalary_type());
		System.out.println("gender :"+vo.getGender());
		
		MemberVO vo1 = service.member_select(vo.getId());
		String uuid = session.getServletContext().getRealPath("resource") + "/" + vo1.getPicture();

		// 파일을 첨부하지 않은 경우
		if (file.isEmpty()) {
			// 원래부터 첨부된 파일이 없는 경우
			
			// 원래 첨부된 파일이 있었는데 삭제한 경우
			if (attach.isEmpty()) {
				// 원래 첨부되어 있는 파일이 있다면 서버의 물리적 영역에서 삭제
				if (vo.getPicture() != null) {
					File f = new File(uuid);
					if (f.exists())
						f.delete(); // 파일이 존재하면 파일 삭제
				}
			} else {
				// 원래 첨부된 파일을 그대로 사용하는 경우
				vo.setPicture(vo1.getPicture());
			}
		} else {
			// 파일을 첨부한 경우
			vo.setPicture( fileUpload(file, session) );

			// 원래 첨부 되어 있는 파일이 있다면 서버의 물리적 영역에서 삭제
			if (vo1.getPicture() != null) {
				File f = new File(uuid);
				if (f.exists())
					f.delete(); // 파일이 존재하면 파일 삭제
			}
		}
		System.out.println("이미지"+vo.getPicture());
		int succ = service.member_modify(vo);
		if(succ ==1) {
			System.out.println("수정 완료");
		}else {
			System.out.println("수정 안됨");
		}
		return "index";
	}
	
	@RequestMapping(value="member_modify")
	public String member_modify(Locale locale, Model model, int id) {
		MemberVO vo = service.member_select(id);
		HashMap<String, String> data = new HashMap<String, String>();
		if(vo.getIdnum() != null) {
		String idnum1 = vo.getIdnum().substring(0, vo.getIdnum().indexOf('-'));
		String idnum2 = vo.getIdnum().substring( vo.getIdnum().indexOf('-')+1);
		data.put("idnum1", idnum1);
		data.put("idnum2", idnum2);
		
		}
		if(vo.getContact() != null) {
		String contact1= vo.getContact().substring(0, vo.getContact().indexOf('-'));
		String contact2= vo.getContact().substring(vo.getContact().indexOf('-')+1, vo.getContact().lastIndexOf('-'));
		String contact3= vo.getContact().substring(vo.getContact().lastIndexOf('-')+1);
		data.put("contact1", contact1);
		data.put("contact2", contact2);
		data.put("contact3", contact3);
		
		}
		if(vo.getBirth() != null) {
		if(vo.getBirth().length() == 10) {
			String birth1=vo.getBirth().substring(0,4);
			String birth2=vo.getBirth().substring(4,6);
			String birth3=vo.getBirth().substring(6,8);
			String birth4=vo.getBirth().substring(8);
			data.put("birth1", birth1);
			data.put("birth2", birth2);
			data.put("birth3", birth3);
			data.put("birth4", birth4);
		}
		}
		if(vo.getPicture() == null) {
			System.out.println("기본이미지로 교체");
			vo.setPicture("	http://localhost/hello/image/default.png");
		}
		
		
		model.addAttribute("vo", vo );
		model.addAttribute("data", data );
		
		return "member_modify";
	}
	
	@RequestMapping(value="member_delete")
	public String member_delete(Locale locale, Model model, MemberVO vo) {
		System.out.println("id값 : "+ vo.getId());
		int succ = service.member_delete(vo.getId());
		if(succ ==1) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("삭제 안됨");
		}
		return "redirect:index";
	}
	//주민번호 중복체크
	@RequestMapping(value="idnum_check")
	@ResponseBody
	public boolean idnum_check(Locale locale, Model model, HttpServletRequest request) {
			String idnum= request.getParameter("idnum");
			System.out.println(idnum);
			System.out.println("ajax 통신됨");
			boolean result = service.member_idnum_check(idnum);
			System.out.println(result);
		return result;
	}
	// 파일 업로드 처리
			public String fileUpload( MultipartFile file, HttpSession session) {
				// 업로드 할 위치
				String resources = session.getServletContext().getRealPath("resources");
		// D:\Study_Spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\iot\resources
				// upload/notice/2021/10/27/OOOOOOOO_123.png
				System.out.println(resources);
				String folder = resources + "/image/";
				String uuid =  UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
				
				File dir = new File ( folder );
				
				if (! dir.exists() ) dir.mkdir();
					try {
						file.transferTo(new File( folder, uuid ));
					} catch (Exception e) {
						e.printStackTrace();
					}
				// upload/notice/2021/10/27/OOOOOOOO_123.png
				return folder.substring(resources.length() + 1) + "/" + uuid;	
			}
}

