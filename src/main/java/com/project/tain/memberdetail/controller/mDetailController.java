package com.project.tain.memberdetail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mDetailController {
	@RequestMapping(value = "/mDetail.do", method = RequestMethod.GET)
	public String BoardInsertForm() {
		return "mDetail";
	}
}
