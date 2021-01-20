package com.project.tain.general.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping(value = "/gnMain", method = RequestMethod.GET)
	public ModelAndView gnMain(HttpServletRequest request, @RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			String result = gService.userType(m_id);
			System.out.println("usertype:" + result);
			if (result.equals("G")) {
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
				mv.setViewName("general/gnMain");
			} else if (result.equals("B")) {
					
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/gnEachPage", method = RequestMethod.GET)
	public ModelAndView gnEachPage(HttpServletRequest request, String m_id, String b_id, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			System.out.println("boardType : " + b_id);
			if (b_id.startsWith("BO")) {
				mv.addObject("selectEachPost", gService.selectEachPost(b_id));
				mv.addObject("selectEachPostComments", gService.selectEachPostComments(b_id));
				mv.addObject("selectEachPostPhotos", gService.selectEachPostPhotos(b_id));
				System.out.println(gService.selectEachPostPhotos(b_id));
				mv.addObject("hashtag", tService.showHashTag(b_id));
				mv.setViewName("general/gnEachPage");
			} else if (b_id.startsWith("BB")) {

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
