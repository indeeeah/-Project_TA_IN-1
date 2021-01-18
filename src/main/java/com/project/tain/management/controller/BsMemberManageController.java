package com.project.tain.management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.management.model.domain.BsMemberManage;
import com.project.tain.management.model.service.BsMemberManageService;

@Controller
public class BsMemberManageController {
	
	@Autowired
	private BsMemberManageService bsmmService;
	
	public static final int LIMIT = 10;
	
	@RequestMapping(value = "bsmemberManagelist.do", method = RequestMethod.GET)
	public ModelAndView memberManageList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = bsmmService.totalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("list", bsmmService.searchList(keyword));
			else
				mv.addObject("list", bsmmService.selectList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("management/bsmemberManagelist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "bsmemberManageDetali.do", method = RequestMethod.GET)
	public ModelAndView bsmemberDetail(@RequestParam(name = "m_id") String m_id,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			mv.addObject("BsMemberManage", bsmmService.selectOne(m_id));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("management/bsmemberManageDetali");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "bsmemberManageRenew.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberDetail(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			mv.addObject("BsMemberManage", bsmmService.selectOne(m_id));
			mv.setViewName("management/bsmemberManageRenew");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "bsmemberManageUpdate.do", method = RequestMethod.POST)
	public ModelAndView memberUpdate(BsMemberManage bsm, ModelAndView mv) {
		try {
			mv.addObject("m_id", bsmmService.updateBsMmanage(bsm).getM_id());
			mv.setViewName("redirect:bsmemberManageDetali.do");
			System.out.println("성공");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "bsmember2ManageUpdate.do", method = RequestMethod.GET)
	public ModelAndView updateApproval(BsMemberManage bsm, ModelAndView mv) {
		try {
			mv.addObject("m_id", bsmmService.updateUsage(bsm).getM_id());
			mv.addObject("m_id", bsmmService.updateApproval(bsm).getM_id());
			mv.setViewName("redirect:bsmemberManageDetali.do");
			System.out.println("성공");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

}
