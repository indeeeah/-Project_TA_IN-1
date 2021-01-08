package com.project.tain.membermanage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.membermanage.model.service.mMemberServiceImpl;
import com.project.tain.membermanage.model.vo.mMemberVO;

@Controller
public class mMangeController {
	@Autowired
	private mMemberServiceImpl mMemberServiceImpl;

	@RequestMapping(value = "/mManage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberManage(ModelAndView mv) {
		String m_id = "Master";
		try {
			mv.addObject("profile", mMemberServiceImpl.showProfile(m_id));
			mv.setViewName("mManage");
		} catch (Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/updateProfile.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void updateProfile(mMemberVO mvo, @RequestParam(name = "emailcheck") String chk, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			mMemberServiceImpl.updateProfile(mvo);
			pw.println("<script>alert('회원정보가 수정되었습니다.'); location.href='/tain/mManage.do'; </script>");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkEmail.do", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json; charset=utf-8")
	public String checkEmail(mMemberVO mvo, @RequestParam String email, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println(email);
		String result;
		if (mMemberServiceImpl.checkEmail(email) != null) {
			result = "{\"check\":\"" + "F" + "\"}";
			System.out.println(result);
			System.out.println("F");
		} else {
			result = "{\"check\":\"" + "T" + "\"}";
			System.out.println(result);
			System.out.println("T");
		}
		return result;
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
