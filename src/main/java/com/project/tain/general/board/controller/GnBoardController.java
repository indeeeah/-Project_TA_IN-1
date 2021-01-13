package com.project.tain.general.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.general.board.model.service.GnBoardService;

@Controller
public class GnBoardController {
	@Autowired
	private GnBoardService gService;

	@RequestMapping(value = "/gnMain", method = RequestMethod.GET)
	public ModelAndView gnMain(HttpServletRequest request,@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("id_img_fwr", gService.showp_one(m_id));
			mv.addObject("fw", gService.showp_two(m_id));
			mv.addObject("gboard", gService.showp_three(m_id));
			mv.addObject("bboard", gService.showp_four(m_id));
			mv.addObject("storychk", gService.storychk(m_id));
			mv.addObject("showpost", gService.showpost(m_id));
			mv.addObject("highlight", gService.highlight(m_id));
			mv.addObject("followchk", gService.followchk(my_name, m_id));
			mv.addObject("recomFow", gService.recomFow(my_name, m_id));
			mv.setViewName("general/gnMain");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/showeachpost.do", method = RequestMethod.POST)
	public HashMap <String, Object> showeachpost(@RequestParam(name = "b_id") String b_id, ModelAndView mv) {
		HashMap<String, Object> result = new HashMap <String,Object>();	
		try {
			result.put("showeachpost", gService.showeachpost(b_id));
		} catch (Exception e) {
			e.printStackTrace();
			result.put("ack", -1);
		}
		return result;
	}
	
}
