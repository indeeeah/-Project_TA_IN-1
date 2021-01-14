package com.project.tain.memberdetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.membermanage.model.service.mFollowServiceImpl;
import com.project.tain.membermanage.model.service.mMemberServiceImpl;

@Controller
public class mDetailController {
	@Autowired
	private mMemberServiceImpl mMemberServiceImpl;
	
	@Autowired
	private mFollowServiceImpl mFollowServiceImpl;
	
	@RequestMapping(value = "/mDetail.do", method = RequestMethod.GET)
	public ModelAndView mShowProfile(ModelAndView mv) {
		String m_id="Master";
		try {
			int countfollower = mFollowServiceImpl.showFollower(m_id).size();
			int countfollowing = mFollowServiceImpl.showFollowing(m_id).size();
			
			mv.addObject("profile", mMemberServiceImpl.showProfile(m_id));
			mv.addObject("follower", mFollowServiceImpl.showFollower(m_id));
			mv.addObject("following", mFollowServiceImpl.showFollowing(m_id));
			mv.addObject("countfollower", countfollower);
			mv.addObject("countfollowing", countfollowing);
			mv.setViewName("mDetail");
		} catch(Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/mfollowerlist.do", method = RequestMethod.GET)
	public ModelAndView mShowFollow(ModelAndView mv) {
		String m_id="Master";
		try {
			mv.addObject("follower", mFollowServiceImpl.showFollower(m_id));
			mv.setViewName("mDetail");
		} catch(Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
}
