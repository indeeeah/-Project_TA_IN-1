package com.project.tain.management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.management.model.service.ReportAllManageService;
import com.project.tain.membermanage.model.service.mMessageServiceImpl;

@Controller
public class ReportAllManageController {
	@Autowired
	private ReportAllManageService reAllmService;
	
	@Autowired
	private mMessageServiceImpl mMessageServiceImpl;
	
	public static final int LIMIT = 10;
	
	@RequestMapping(value = "reportmemberManagelist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reportmemberManagelist(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = reAllmService.totalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("list", reAllmService.searchList(keyword));
			else
				mv.addObject("list", reAllmService.selectList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.addObject("messagecheck", mMessageServiceImpl.readcheck("admin"));
				mv.setViewName("management/reportmemberManagelist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "reportBoardManagelist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reportBoardManagelist(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int rblistCount = reAllmService.rbtotalCount();
			int maxPage = (int) ((double) rblistCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("rblist", reAllmService.rbsearchList(keyword));
			else
				mv.addObject("rblist", reAllmService.rbselectList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("rblistCount", rblistCount);
				mv.addObject("messagecheck", mMessageServiceImpl.readcheck("admin"));
				mv.setViewName("management/reportBoardManagelist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "reportBsboardManagelist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reportBsboardManagelist(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int rbblistCount = reAllmService.rbbtotalCount();
			int maxPage = (int) ((double) rbblistCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("rbblist", reAllmService.rbbsearchList(keyword));
			else
				mv.addObject("rbblist", reAllmService.rbbselectList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("rbblistCount", rbblistCount);
				mv.addObject("messagecheck", mMessageServiceImpl.readcheck("admin"));
				mv.setViewName("management/reportBsboardManagelist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "boardManageDelete.do", method = RequestMethod.GET)
	public ModelAndView deleteBoardManage(@RequestParam(name = "b_id") String b_id, ModelAndView mv) {
		try {
			reAllmService.deleteBoardManage(b_id);
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck("admin"));
			mv.setViewName("redirect:reportBoardManagelist.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "boardBsManageDelete.do", method = RequestMethod.GET)
	public ModelAndView deleteBsboardManage(@RequestParam(name = "bb_id") String bb_id, ModelAndView mv) {
		try {
			reAllmService.deleteBsboardManage(bb_id);
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck("admin"));
			mv.setViewName("redirect:reportBsboardManagelist.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
}
