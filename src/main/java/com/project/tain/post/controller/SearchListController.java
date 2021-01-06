package com.project.tain.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.post.model.service.SearchListService;
import com.project.tain.post.model.service.TimeLineService;

@Controller
public class SearchListController {
	@Autowired
	private TimeLineService tService;
	
	@Autowired
	private SearchListService sService;

	@RequestMapping(value = "/explore")
	public ModelAndView SearchList(@RequestParam(name = "m_id", required = false) String m_id,
			@RequestParam(name = "hashtag") String hashtag, ModelAndView mv) {
		try {
			mv.addObject("myProfile", tService.showMyProf(m_id));
			mv.addObject("searchResult", sService.showHashTag(hashtag));
			mv.setViewName("post/searchList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
}
