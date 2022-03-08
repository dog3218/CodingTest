package com.hanul.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import app_member.MemberDAO_GW;
import app_member.MemberPage;
import app_member.MemberVO;

@Controller
public class Web_TestController {
	@Autowired private MemberPage page;
	 @Autowired private MemberDAO_GW service;
	
	//어떤 객체를 연결하려면 @RequestMapping을 선언하면
	//메소드 호출 시 first 요청이 있으면 아래 메소드를 동작시킴
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
		System.out.println("file : "+vo.getPicture());
		System.out.println("name : "+vo.getName());
		System.out.println("hire : "+vo.getSalary_type());
		service.member_regist(vo);
		
		return "index";
	}
	
	@RequestMapping(value="modify_save")
	public String modify_save(Locale locale, Model model, MemberVO vo, MultipartFile file, HttpSession session, String attach) {
		System.out.println("name"+vo.getName());
		System.out.println("hire"+vo.getSalary_type());
		
		MemberVO auth = service.member_select(vo.getId());
		String uuid = session.getServletContext().getRealPath("resource") + "/" + vo.getPicture();

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
				vo.setPicture(vo.getPicture());
			}
		} else {
			// 파일을 첨부한 경우
			vo.setPicture(vo.getPicture());

			// 원래 첨부 되어 있는 파일이 있다면 서버의 물리적 영역에서 삭제
			if (vo.getPicture() != null) {
				File f = new File(uuid);
				if (f.exists())
					f.delete(); // 파일이 존재하면 파일 삭제
			}

		}
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
		model.addAttribute("vo", service.member_select(id)); 
		return "member_modify";
	}
	
	@RequestMapping(value="member_delete")
	public String member_delete(Locale locale, Model model, MemberVO vo) {
		System.out.println("id값 : "+ vo.getId());
		int succ = service.member_delete(vo);
		if(succ ==1) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("삭제 안됨");
		}
		return "redirect:index";
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

