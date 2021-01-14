package com.project.tain.management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.management.model.service.BoardAllManageService;

@Controller
public class BoardAllManageController {
	@Autowired
	private BoardAllManageService bAllmService;

	public static final int LIMIT = 10;

	@RequestMapping(value = "boardManagelist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bManageList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = bAllmService.btotalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("list", bAllmService.bmSearchList(keyword));
			else
				mv.addObject("list", bAllmService.bmSelectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("management/boardManagelist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "bManageDelete.do", method = RequestMethod.GET)
	public ModelAndView deleteBManage(@RequestParam(name = "b_id") String b_id, ModelAndView mv) {
		try {
			bAllmService.deleteBManage(b_id);
			mv.setViewName("redirect:boardManagelist.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "bsboardManagelist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bsbManageList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = bAllmService.bstotalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("list", bAllmService.bsbmSearchList(keyword));
			else
				mv.addObject("list", bAllmService.bsbmSelectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("management/bsBoardManagelist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "bsbManageDelete.do", method = RequestMethod.GET)
	public ModelAndView deleteBsnBoard(@RequestParam(name = "bb_id") String bb_id, ModelAndView mv) {
		try {
			bAllmService.deleteBsbManage(bb_id);
			mv.setViewName("redirect:bsboardManagelist.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

}
