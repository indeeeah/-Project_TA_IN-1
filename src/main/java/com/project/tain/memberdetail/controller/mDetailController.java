package com.project.tain.memberdetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.member.model.service.mMemberService;
import com.project.tain.member.model.service.mMemberServiceImpl;

@Controller
public class mDetailController {
	@Autowired
	private mMemberServiceImpl mMemberServiceImpl;
	@RequestMapping(value = "/mDetail.do", method = RequestMethod.GET)
	public ModelAndView mShowProfile(ModelAndView mv) {
		String m_id="Master";
		try {
			mv.addObject("profile", mMemberServiceImpl.showProfile(m_id));
			mv.setViewName("mDetail");
		} catch(Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
}
