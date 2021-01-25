package com.project.tain.general.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.business.board.model.service.BsnBoardService;
import com.project.tain.general.board.model.domain.GnBoard;
import com.project.tain.general.board.model.service.GnBoardService;
import com.project.tain.post.model.domain.TimeLine;
import com.project.tain.post.model.service.SearchListService;
import com.project.tain.post.model.service.TimeLineService;

@Controller
public class GnBoardController {

	@Autowired
	private GnBoardService gService;

	@Autowired
	private TimeLineService tService;

	@Autowired
	private BsnBoardService bbService;
	
	public static final int LIMIT = 6;

	@RequestMapping(value = "/gnMain", method = RequestMethod.GET)
	public ModelAndView gnMain(@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request,
			@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		int currentPage = page;
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			String result = gService.userType(m_id);
			System.out.println("usertype:" + result);
			if (result.equals("G")) {
				mv.addObject("chkfollow", tService.chkfollow(my_name));
				mv.addObject("id_img_fwr", gService.showp_one(m_id));
				mv.addObject("fw", gService.showp_two(m_id));
				mv.addObject("gboard", gService.showp_three(m_id));
				mv.addObject("bboard", gService.showp_four(m_id));
				mv.addObject("storychk", gService.storychk(m_id));
				//mv.addObject("showpost", gService.showpost(m_id));
				mv.addObject("showpost", gService.showpostPage(m_id, currentPage, LIMIT));
				mv.addObject("highlight", gService.highlight(m_id));
				mv.addObject("followchk", gService.followchk(my_name, m_id));
				mv.addObject("recomFow", gService.recomFow(my_name, m_id));
				mv.addObject("selectFollow", gService.selectFollow(m_id));
				mv.addObject("selectFollower", gService.selectFollower(m_id));
				mv.addObject("showpostCount", gService.showpostCount(m_id));
				mv.addObject("alarmcheck", tService.alarmcheck(my_name));
				mv.addObject("shownotice", tService.shownotice(my_name));
				mv.setViewName("general/gnMain");
			} else if (result.equals("B")) {
				mv.addObject("chkfollow", tService.chkfollow(my_name));
				mv.addObject("id_img_fwr", gService.showp_one(m_id));
				mv.addObject("fw", gService.showp_two(m_id));
				mv.addObject("gboard", gService.showp_three(m_id));
				mv.addObject("bboard", gService.showp_four(m_id));
				mv.addObject("storychk", gService.storychk(m_id));
				mv.addObject("showpost", gService.showpost(m_id));
				mv.addObject("highlight", gService.highlight(m_id));
				mv.addObject("followchk", gService.followchk(my_name, m_id));
				mv.addObject("recomFow", gService.recomFow(my_name, m_id));
				mv.addObject("selectFollow", gService.selectFollow(m_id));
				mv.addObject("selectFollower", gService.selectFollower(m_id));
				mv.addObject("showpostCount", gService.showpostCount(m_id));
				mv.addObject("bsnInfo", bbService.bsnInfo(m_id));
				mv.addObject("bsnInfoFollow", bbService.bsnInfoFollow(m_id));
				mv.addObject("bsnInfoFollower", bbService.bsnInfoFollower(m_id));
				mv.addObject("listCount", bbService.listCount(m_id));	// 게시물카운트
				mv.addObject("category", bbService.selectCategory(m_id));//카테고리 목록
				mv.addObject("list", bbService.selectListPage(m_id, currentPage, LIMIT));	// 게시물 텍스트정보
				mv.setViewName("business/bsnMain");
			} else if (result.equals("M")) {
				mv.setViewName("management/managementMain");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	// 게시물 스크롤 페이징
	@ResponseBody
	@RequestMapping(value = "/gnMainScroll.do", method = RequestMethod.POST)
	public HashMap<String, Object> gnMainScroll(Model model, HttpServletRequest request,
			@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "m_id") String m_id) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int currentPage = page;
		int listCount = gService.showpostCount(m_id);
		int maxPage = (int) ((double) listCount / LIMIT + 0.9);
		List<GnBoard> logList = gService.showpostPage(m_id, currentPage, LIMIT);
		result.put("count", gService.showpostCount(m_id)); // 게시물카운트
		result.put("currentPage", currentPage); // 현재 페이지
		result.put("maxPage", maxPage); // 최대 페이지
		result.put("list", logList); // 게시물 텍스트정보
		System.out.println("list:" + logList);
		return result;
	}

	@RequestMapping(value = "/gnEachPage", method = RequestMethod.GET)
	public ModelAndView gnEachPage(HttpServletRequest request, String m_id, String b_id, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			System.out.println("boardType : " + b_id);
			if (b_id.startsWith("BO")) {
				mv.addObject("chkfollow", tService.chkfollow(my_name));
				mv.addObject("selectEachPost", gService.selectEachPost(b_id));
				mv.addObject("selectEachPostComments", gService.selectEachPostComments(b_id));
				mv.addObject("selectEachPostPhotos", gService.selectEachPostPhotos(b_id));
				System.out.println(gService.selectEachPostPhotos(b_id));
				mv.addObject("hashtag", tService.showHashTag(b_id));
				System.out.println(tService.showHashTag(b_id));
				mv.addObject("alarmcheck", tService.alarmcheck(my_name));
				mv.addObject("shownotice", tService.shownotice(my_name));
				mv.setViewName("general/gnEachPage");
			} else if (b_id.startsWith("BB")) {
				System.out.println("bbDetail:"+bbService.selectOne(b_id));
				mv.addObject("bbDetail", bbService.selectOne(b_id));	// 게시물 상세
				System.out.println("bbTags:"+bbService.selectOneTags(b_id));
				mv.addObject("bbTags", bbService.selectOneTags(b_id));	// 게시물 상세 태그
				mv.addObject("category", bbService.selectCategory(m_id));//카테고리 목록
				mv.setViewName("business/bsnEachPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/showeachpost.do", method = RequestMethod.POST)
	public HashMap<String, Object> showeachpost(@RequestParam(name = "b_id") String b_id, ModelAndView mv) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("showeachpost", gService.showeachpost(b_id));
		} catch (Exception e) {
			e.printStackTrace();
			result.put("ack", -1);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "chkReportMember.do", method = RequestMethod.POST)
	public int chkReportMember(GnBoard gb) {
		int result = gService.chkReportMember(gb);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "insertReportMember.do", method = RequestMethod.POST)
	public String insertReportMember(GnBoard gb) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", gService.insertReportMember(gb));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "followchkf.do", method = RequestMethod.POST)
	public GnBoard followchkf(String my_name, String m_id) {

		GnBoard result = gService.followchk(my_name, m_id);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
