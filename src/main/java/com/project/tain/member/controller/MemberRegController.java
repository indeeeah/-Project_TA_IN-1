package com.project.tain.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.member.model.service.MemberRegService;
import com.project.tain.member.model.vo.MemberRegVO;

@Controller
public class MemberRegController {
	@Autowired
	private MemberRegService service;

	// 로그인 페이지
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "/member/login";
	}

	// 로그인
	@RequestMapping("/login")
	public ModelAndView login(@ModelAttribute MemberRegVO vo, HttpSession session) throws Exception {
		boolean result = service.login(vo, session); // 로그인 db 확인
		ModelAndView mav = new ModelAndView();
		if (result == true) {
			mav.setViewName("redirect:/timeline.do"); // 로그인후 메인페이지 경로
		} else {
			mav.setViewName("/member/login");
		}
		return mav;
	}

	// 회원가입 페이지
	@RequestMapping("/joinPage")
	public String JoinPage() {
		return "/member/join"; // jsp
	}

	// 회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView join(MemberRegVO vo, HttpServletRequest req, ModelAndView mv) {
//		System.out.println(req.getParameter("m_addr1") + ", getM_addr1");
//		System.out.println(req.getParameter("m_birth") + ", getM_birth");
//		vo.setM_addr1(Integer.parseInt(req.getParameter("m_addr1")));
		System.out.println("들어왔당!");
		try {
//			System.out.println(vo.getM_addr1() + ", getM_addr1");
//			System.out.println(vo.getM_birth() + ", getM_birth");
			service.join(vo); // db갔다옴
			mv.setViewName("redirect:/member/loginPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(String m_id) throws Exception {
		int result = service.idcheck(m_id);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) throws Exception {
		service.memberLogout(session);
		return "redirect:/member/loginPage";
	}

	// 아이디 찾기 페이지
	@RequestMapping("/findIdPage")
	public String memberFindIdPage() {
		return "/member/memberFindId";
	}

	// 비밀번호 찾기 페이지
	@RequestMapping("/findPwPage")
	public String memberFindPwPage() {
		return "/member/memberFindPw";
	}

	// 아이디 찾기
	@RequestMapping("/findId")
	public ModelAndView userFindId(@ModelAttribute MemberRegVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<MemberRegVO> memberList = service.memberFindId(vo);
		System.out.println(memberList);
		mav.setViewName("/member/memberId");
		mav.addObject("memberFindId", memberList);
		return mav;
	}

	// 비밀번호 찾기
	@RequestMapping("/findPw")
	public ModelAndView userFindPw(@ModelAttribute MemberRegVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String pw = service.memberFindPw(vo);
		mav.setViewName("/member/memberPw");
		mav.addObject("memberFindPw", pw);
		return mav;
	}
}
