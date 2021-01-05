package com.project.tain.management.controller;

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
	
	@RequestMapping(value = "memberDetail.do", method = RequestMethod.POST)
	public ModelAndView memberDetail(@RequestParam(name = "m_id") String m_id,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			mv.addObject("MemberManage", mmService.selectOne(m_id));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("management/memberDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberRenew.do", method = RequestMethod.POST)
	public ModelAndView memberDetail(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			mv.addObject("MemberManage", mmService.selectOne(m_id));
			mv.setViewName("management/memberRenew");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberUpdate.do", method = RequestMethod.POST)
	public ModelAndView memberUpdate(MemberManage m, @RequestParam(name = "page", defaultValue = "1") int page,
			 ModelAndView mv) {
		try {
			mv.addObject("m_id", mmService.updateMmanage(m).getM_id());
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:memberDetail.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	
}
