package com.project.tain.management.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.management.model.domain.MemberManage;
import com.project.tain.management.model.service.MemberManageService;

@Controller
public class MemberManageController {
	@Autowired
	private MemberManageService mmService;

	public static final int LIMIT = 10;
	
//	//테스트 로그인
//	@RequestMapping(value = "/test.do")
//	public String testForm(ModelAndView mv) {
//		return "test";
//	}
//	
	@RequestMapping(value = "/managementMain.do")
	public ModelAndView testSession(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String my_name = (String) session.getAttribute("my_name");
		System.out.println(my_name);
		session.setAttribute("my_name", my_name);
		mv.setViewName("management/managementMain");
		return mv;
	}
	
	@RequestMapping(value = "membermanagelist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberManageList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = mmService.totalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals("")) 
				mv.addObject("list", mmService.searchList(keyword));
			else 
				mv.addObject("list", mmService.selectList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("management/membermanagelist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberManageDetail.do", method = RequestMethod.GET)
	public ModelAndView memberDetail(@RequestParam(name = "m_id") String m_id,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			mv.addObject("MemberManage", mmService.selectOne(m_id));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("management/memberManageDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberManageRenew.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberDetail(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			mv.addObject("MemberManage", mmService.selectOne(m_id));
			mv.setViewName("management/memberManageRenew");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberManageUpdate.do", method = RequestMethod.POST)
	public ModelAndView memberUpdate(MemberManage m, ModelAndView mv) {
		try {
			mv.addObject("m_id", mmService.updateMmanage(m).getM_id());
			mv.setViewName("redirect:memberManageDetail.do");
			System.out.println("성공");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberManageDelete.do", method = RequestMethod.GET)
	public ModelAndView memberDelete(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			mmService.insertOutManage(m_id);
			mmService.deleteMmanage(m_id);
			mv.setViewName("redirect:membermanagelist.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberOutlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView outSelectList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = mmService.outtotalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals("")) 
				mv.addObject("list", mmService.outsearchList(keyword));
			else 
				mv.addObject("list", mmService.outSelect(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("management/memberOutlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

}
