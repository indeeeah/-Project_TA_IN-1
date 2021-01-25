package com.project.tain.post.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.post.model.domain.SearchList;
import com.project.tain.post.model.service.SearchListService;
import com.project.tain.post.model.service.TimeLineService;

@Controller
public class SearchListController {
	@Autowired
	private TimeLineService tService;
	
	@Autowired
	private SearchListService sService;
	
	public static final int LIMIT = 6;


	@RequestMapping(value = "/explore")
	public ModelAndView SearchList(@RequestParam(name = "page", defaultValue = "1") int page,HttpServletRequest request,
			@RequestParam(name = "hashtag") String hashtag, ModelAndView mv) {
		int currentPage = page;
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("myProfile", tService.showMyProf(my_name));
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("showHashTagCount", sService.showHashTagCount(hashtag));
			mv.addObject("searchResult", sService.showHashTag(hashtag));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			//mv.addObject("searchResult", sService.showHashTagPage(hashtag, currentPage, LIMIT));
			mv.setViewName("post/searchList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	
	// 게시물 스크롤 페이징
		@ResponseBody
		@RequestMapping(value = "/exploreScroll.do", method = RequestMethod.POST)
		public HashMap<String, Object> gnMainScroll(Model model, HttpServletRequest request,
				@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "hashtag") String hashtag) {
			System.out.println("들어가나?");
			HashMap<String, Object> result = new HashMap<String, Object>();
			System.out.println("해시태그는"+hashtag);
			int currentPage = page;
			int listCount = sService.showHashTagCount(hashtag);
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			List<SearchList> logList = sService.showHashTagPage(hashtag, currentPage, LIMIT);
			result.put("count",sService.showHashTagCount(hashtag)); // 게시물카운트
			result.put("currentPage", currentPage); // 현재 페이지
			result.put("maxPage", maxPage); // 최대 페이지
			result.put("list", logList); // 게시물 텍스트정보
			System.out.println("list:" + logList);
			return result;
		}
}
