package com.project.tain.general.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.general.board.model.service.GnBoardService;

@Controller
public class GnBoardController {
	@Autowired
	private GnBoardService gService;

	@RequestMapping(value = "/gnMain", method = RequestMethod.GET)
	public ModelAndView writeStory(HttpServletRequest request,@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			mv.addObject("id_img_fwr", gService.showp_one(m_id));
			mv.addObject("fw", gService.showp_two(m_id));
			mv.addObject("gboard", gService.showp_three(m_id));
			mv.addObject("bboard", gService.showp_four(m_id));
			mv.addObject("storychk", gService.storychk(m_id));
			mv.addObject("showpost", gService.showpost(m_id));
			mv.setViewName("general/gnMain");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
}
