package com.project.tain.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.tain.common.model.service.EmailService;
import com.project.tain.member.model.service.MemberRegServicelmpl;
import com.project.tain.member.model.vo.BusinessMemberVO;
import com.project.tain.member.model.vo.MemberRegVO;

@Controller
@RequestMapping("/member")
public class MemberRegController {
	@Autowired
	private MemberRegServicelmpl service;
	@Autowired
	private EmailService emailService;

	// 회원가입 페이지
	@RequestMapping("/joinPage")
	public String JoinPage() throws Exception {
		return "/member/join"; // jsp
	}

	// 회원 인증
	@RequestMapping(value = "/approval_member.do", method = RequestMethod.POST)
	public ModelAndView approval_member(@ModelAttribute MemberRegVO vo, ModelAndView mv) {
		int result = 0;
		try {
			result = service.approval_member(vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (result == 1) { // 정상적인 경우
				mv.setViewName("redirect:/member/loginPage");
			} else if (result == 0) { // 비정상적인 경우
				mv.addObject("msg", "메일 인증에 실패했습니다");
				mv.setViewName("redirect:/errorPage");
			} else {
				mv.addObject("msg", "인증에 실패했습니다");
				mv.setViewName("redirect:/errorPage");
			}
		}
		return mv;
	}

	// 로그인 폼 이동
	@RequestMapping(value = "/loginPage")
	public String loginPage(HttpSession session) throws Exception {
		if (session.getAttribute("my_name") != null) { // 로그인 되어 있음.
			System.out.println("loginPage > go > timeLine");
			return "redirect:/timeLine";
		} else {
			System.out.println("loginPage > go > timeLine");
			return "/member/login";
		}
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public String login(@ModelAttribute MemberRegVO vo, HttpSession session) {
		try {
			System.out.println("vo.getM_id(): " + vo.getM_id());
			if (service.check_id(vo.getM_id()) == 0) { // 등록된 아이디가 없으면
				System.out.println("alert('등록된 아이디가 없습니다.');");
				return "-1";
			} else {
				String m_pw = vo.getM_pw();
				MemberRegVO voReturn = service.login(vo);
				if (!voReturn.getM_pw().equals(m_pw)) { // 비밀번호가 다를 경우
					System.out.println("alert('비밀번호가 다릅니다.');");
					return "-2";
				} else if (!voReturn.getApproval_status().equals("true ")) { // 이메일 인증을 하지 않은 경우
					System.out.println("alert('이메일 인증 후 로그인 하세요.');");
					return "-3";
				} else { // 로그인 성공 // 로그인 일자 업데이트 및 회원정보 리턴
					int updateResult = service.update_log(vo);
					if (updateResult == 0) {
						System.out.println("로그인 후 최종 접속시간 업데이트 실패했습니다.");
						return "-4";
					} else {
						System.out.println("로그인 성공!!! 세션 등록 my_name에 " + vo.getM_id() + " 등록함.");
						// session.setAttribute("myInfo", vo);
						session.setAttribute("my_name", vo.getM_id());
						System.out.println("voReturn.getM_status()! "+ voReturn.getM_status());
						
						// 임시 비밀번로로 들어온 경우 return 2
						if(voReturn.getM_status() == 2) {
							System.out.println("voReturn.getM_status()! "+ voReturn.getM_status());
							return "2";
						} else if(voReturn.getM_id().equals("admin")) {
							System.out.println("voReturn.getM_id()! "+ voReturn.getM_id());
							return "3";
						} else  { // 보통의 로그인 경우 return 1
							return "1";
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예기치 못한 오류 발생하였습니다. 다시 로그인 시도해주세요.");
			return "0";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", produces = "application/json; charset=utf8")
	public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		try {
			PrintWriter out = response.getWriter();
			// 등록된 아이디가 없으면
			if (session.getAttribute("my_name") == null) {
				System.out.println("alert('이미 로그아웃된 상태입니다.');");
				out.append("이미 로그아웃된 상태입니다.");
			} else {
				session.removeAttribute("my_name");
				out.append("로그아웃 되었습니다. Tain을 사용하려면 다시 로그인하셔야 합니다.");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	// 회원 가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberRegVO vo, RedirectAttributes redirectAttributes,
			HttpServletResponse response) throws Exception {
		int result = 0;
		try {
//			rttr.addFlashAttribute("result", service.join(vo, response));

			vo.setApproval_key(create_key());
			vo.setApproval_status("false");
			result = service.join(vo);
			if (result == -1) {
				// 오류 상황 처리
				// return "";
			} else if (result == -2) {
				// 오류 상황 처리
				// return "";
			} else if (result == 1) {
				// 정상 가입 상황 처리
				send_mail(vo, "join");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/errorPage";
		}
		return "redirect:/member/loginPage";
	}

	// 비즈니스 회원 가입
	@RequestMapping(value = "/businessjoin.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> businessjoin(@ModelAttribute BusinessMemberVO vo) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = service.businessJoin(vo);
			resultMap.put("code", result);
			if (result == -1) {
				// 오류 상황 처리
				resultMap.put("msg", "일반회원이 아닙니다. 일반회원 가입 후 사용할 수 있습니다.");
				// return "";
			} else if (result == -2) {
				// 오류 상황 처리
				resultMap.put("msg", "일반회원이 인증이 되지 않았습니다. 메일 확인 후 사용할 수 있습니다.");
				// return "";
			} else if (result == -3) {
				// 오류 상황 처리
				resultMap.put("msg", "이미 등록된 비즈니스 회원입니다. 로그인 후 사용하세요.");
				// return "";
			} else if (result == -4) {
				// 오류 상황 처리
				resultMap.put("msg", "비즈니스 회원 가입신청 중입니다.관리자 승인 후  사용가능합니다. 이메일 확인해주세요.");
				// return "";
			} else if (result == 0) {
				// 오류 상황 처리
				resultMap.put("msg", "가입 신청 중 오류가 발생하였습니다. 다시 가입 시도해 주세요.");
				// return "";
			} else if (result == 1) {
				// 정상 가입 상황 처리
				// 관리자 승인 후 메일 전송 후 사용가능함.
				resultMap.put("msg", "비즈니스 회원이 가입신청 되었습니다. 관리자 승인 후 사용가능합니다. 이메일 확인해주세요.");
				// send_mail(vo, "join");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("msg", "오류~");
			// return "redirect:/errorPage";
		}
		// return "redirect:/member/loginPage";
		return resultMap;
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
	@ResponseBody
	public String check_id(@RequestParam("m_id") String m_id, HttpServletResponse response) throws Exception {
		int result = 0;
		try {
			System.out.println("ctrl check_id() m_id" + m_id);
			result = service.check_id(m_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}

	// 이메일 중복 검사
	@RequestMapping(value = "/check_email.do", method = RequestMethod.POST)
	@ResponseBody
	public String check_email(@RequestParam("m_email") String m_email, HttpServletResponse response) throws Exception {
		int result = 0;
		try {
			System.out.println("ctrl check_email() m_email" + m_email);
			result = service.check_email(m_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}

	// 아이디 찾기 폼
	@RequestMapping("/memberFindId.do")
	public String memberFindId() throws Exception {
		return "/member/findmember";
	}
	// 아이디 찾기 폼
	@RequestMapping("/findId")
	public ModelAndView findId(@RequestParam("m_id") String m_id, ModelAndView mv) throws Exception {
		mv.addObject("m_id", m_id);
		mv.setViewName("/member/find_Id");
		return mv;
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_Id.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> find_id(@RequestParam("m_email") String m_email, @RequestParam("m_name") String m_name,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {
		HashMap<String, Object> voMap = new HashMap<String, Object>();
		try {
			voMap.put("m_email", m_email);
			voMap.put("m_name", m_name);
			String m_id = service.find_id(voMap);
			if (m_id == null) {
				System.out.println("가입된 이메일이 없습니다.");
				voMap.put("m_id", "");
				voMap.put("code", -1);
			} else {
				voMap.put("m_id", m_id);
				voMap.put("code", 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			voMap.put("m_id", "");
			voMap.put("code", 0);
		}
		return voMap;
	}

	// 비밀번호 찾기 폼
	@RequestMapping("/memberFindPw.do")
	public String memberFindPw() throws Exception {
		return "/member/findmember";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	@ResponseBody
	public String find_pw(@ModelAttribute MemberRegVO vo) throws Exception {
		try {
			// 아이디가 없으면
			if (service.check_id(vo.getM_id()) == 0) {
				System.out.println("아이디가 없습니다. 다시 확인하고 시도해 주세요.");
				return "-1";
			}
			// 가입에 사용한 이메일이 아니면
			else if (!vo.getM_email().equals(service.login(vo).getM_email())) {
				System.out.println("잘못된 이메일 입니다. 다시 확인하고 시도해 주세요.");
				return "-2";
			} else {
				// 임시 비밀번호 생성
				String m_pw = create_key();
				vo.setM_pw(m_pw);
				vo.setM_status(2);
				// 비밀번호 변경
				int updateResult = service.update_pw(vo);

				if (updateResult == 0) {
					System.out.println("새로운 패스워드 업데이트 실패했습니다.");
					return "-3";
				} else {
					// 비밀번호 변경 메일 발송
					send_mail(vo, "find_pw");
					System.out.println("이메일로 임시 비밀번호를 발송하였습니다.");
					return "1";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}

	}

	// 인증키 생성
	private String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 10; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	// 이메일 발송
	private void send_mail(MemberRegVO vo, String div) throws Exception {
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "zx6160@naver.com";
		String subject = "";
		String msg = "";
		System.out.println("vo.getApproval_key(): " + vo.getApproval_key());
		System.out.println("vo.getM_pw(): " + vo.getM_pw());

		if (div.equals("join")) {
			subject = "Spring Homepage 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_id() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8090/tain/member/approval_member.do'>";
			msg += "<input type='hidden' name='m_email' value='" + vo.getM_email() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + vo.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		} else if (div.equals("find_pw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getM_pw() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = vo.getM_email();
		try {
			emailService.mailSend(fromEmail, mail, subject, msg);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일발송 실패 : " + e);
		}
	}
}
