package com.project.tain.membermanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mMangeController {
	@RequestMapping(value = "/mManage.do", method = RequestMethod.GET)
	public String memberManageFrom() {
		return "mManage";
	}
	@RequestMapping(value = "/mChangepw.do", method = RequestMethod.GET)
	public String memberChangepw() {
		return "mChangepw";
	}
	@RequestMapping(value = "/mCart.do", method = RequestMethod.GET)
	public String memberCart() {
		return "mCart";
	}
	@RequestMapping(value = "/mBuylist.do", method = RequestMethod.GET)
	public String memberBuylist() {
		return "mBuylist";
	}
	@RequestMapping(value = "/mLikelist.do", method = RequestMethod.GET)
	public String memberLikelist() {
		return "mLikelist";
	}
	@RequestMapping(value = "/mBusiness.do", method = RequestMethod.GET)
	public String memberBusiness() {
		return "mBusiness";
	}
	
}
