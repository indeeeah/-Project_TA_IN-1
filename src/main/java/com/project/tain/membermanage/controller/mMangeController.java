package com.project.tain.membermanage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.businessmembermanage.model.service.bMemberServiceImpl;
import com.project.tain.businessmembermanage.model.vo.bMemberVO;
import com.project.tain.membermanage.model.service.mCartServiceImpl;
import com.project.tain.membermanage.model.service.mLikeServiceImpl;
import com.project.tain.membermanage.model.service.mMemberServiceImpl;
import com.project.tain.membermanage.model.service.mOrderServiceImpl;
import com.project.tain.membermanage.model.vo.mCartVO;
import com.project.tain.membermanage.model.vo.mMemberVO;
import com.project.tain.membermanage.model.vo.mOrderVO;

@Controller
public class mMangeController {
	@Autowired
	private mMemberServiceImpl mMemberServiceImpl;
	@Autowired
	private mCartServiceImpl mCartServiceImpl;
	@Autowired
	private mLikeServiceImpl mLikeServiceImpl;
	@Autowired
	private mOrderServiceImpl mOrderServiceImpl;
	@Autowired
	private bMemberServiceImpl bMemberServiceImpl;

	@ResponseBody
	@RequestMapping(value = "/mManage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberManage(ModelAndView mv) {
		String m_id = "Master";
		try {
			mv.addObject("profile", mMemberServiceImpl.showProfile(m_id));
			mv.setViewName("Gmember/mManage");
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

	@RequestMapping(value = "/updateProfileImg.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void updateProfileImg(mMemberVO mvo, @RequestParam(name = "upfile") MultipartFile report,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String m_id = "Master";
		try {
			if (report != null || !report.getOriginalFilename().equals("")) {
				removeFile(mvo.getM_img(), request);
				saveFile(report, request);
			}
			PrintWriter pw = response.getWriter();
			mMemberServiceImpl.updateProfileImg(m_id, report.getOriginalFilename());
			pw.println("<script>alert('프로필 사진이 수정되었습니다.'); location.href='/tain/mManage.do'; </script>");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/deleteProfileImg.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteProfileImg(mMemberVO mvo, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String m_id = "Master";
		try {
			removeFile(mvo.getM_img(), request);
			PrintWriter pw = response.getWriter();
			mMemberServiceImpl.updateProfileImg(m_id, "");
			pw.println("<script>alert('프로필 사진이 삭제되었습니다.'); location.href='/tain/mManage.do'; </script>");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath = null;
		try {
			filePath = folder + "\\" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}

	private void removeFile(String m_img, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		String filePath = savePath + "\\" + m_img;
		try {
			File delFile = new File(filePath);
			delFile.delete();
		} catch (Exception e) {
			System.out.println("파일 삭제 에러: " + e.getMessage());
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkEmail.do", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json; charset=utf-8")
	public String checkEmail(mMemberVO mvo, @RequestParam String email, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String result;
		if (mMemberServiceImpl.checkEmail(email) != null) {
			result = "{\"check\":\"" + "F" + "\"}";
		} else {
			result = "{\"check\":\"" + "T" + "\"}";
		}
		return result;
	}

	@RequestMapping(value = "/mChangepw.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberChangepw(ModelAndView mv) {
		String m_id = "Master";
		try {
			mv.addObject("profile", mMemberServiceImpl.showProfile(m_id));
			mv.setViewName("Gmember/mChangepw");
		} catch (Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/changepw.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void changepw(@RequestParam(name = "newpw") String newpw, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String m_id = "Master";
		try {
			PrintWriter pw = response.getWriter();
			mMemberServiceImpl.changepw(m_id, newpw);
			pw.println("<script>alert('비밀번호가 변경되었습니다.'); location.href='/tain/mManage.do'; </script>");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/mCart.do", method = RequestMethod.GET)
	public ModelAndView showCart(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String m_id = "Master";
		try {
			int price = 0;
			for (int i = 0; i < mCartServiceImpl.showCart(m_id).size(); i++) {
				price += mCartServiceImpl.showCart(m_id).get(i).getBb_price();
			}
			mv.addObject("productprice", price);
			mv.addObject("allprice", price + 3000);
			mv.addObject("cartlist", mCartServiceImpl.showCart(m_id));
			mv.setViewName("Gmember/mCart");
		} catch (Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/mDeleteCart.do", method = RequestMethod.GET)
	public void deleteCart(@RequestParam("bb_id") String bb_id, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			mCartServiceImpl.deleteCart(bb_id);
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('삭제 되었습니다.'); location.href='/tain/mCart.do'; </script>");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/mDeleteCartList.do", method = RequestMethod.GET)
	public void deleteCartlist(@RequestParam("bb_id") String bb_id, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String[] arr = bb_id.split("/");
		for(int i = 0; i < arr.length; i++) {
			String bid = arr[i];
			mCartServiceImpl.deleteCart(bid);
		}
		PrintWriter pw = response.getWriter();
		pw.println("<script>alert('모두 삭제 되었습니다.'); location.href='/tain/mCart.do'; </script>");
		pw.flush();
	}

	@RequestMapping(value = "/mBuy.do", method = RequestMethod.GET)
	public ModelAndView memberBuy(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String m_id = "Master";

		String[] p = request.getParameterValues("bb_id");
		String[] bb_id = p[0].split(",");
		String[] m = request.getParameterValues("od_amount");
		String[] od_amount = m[0].split(",");
		String[] r = request.getParameterValues("presult");
		String[] presult = r[0].split(",");
		String[] realval = r[0].split(",|원");
		try {
			List<mCartVO> list = new ArrayList<>();
			for (int i = 0; i < bb_id.length; i++) {
				list.add(mCartServiceImpl.showOrder(m_id, bb_id[i]));
			}
			mv.addObject("realval", realval);
			mv.addObject("profile", mMemberServiceImpl.showProfile(m_id));
			mv.addObject("presult", presult);
			mv.addObject("amount", od_amount);
			mv.addObject("orderlist", list);
			mv.setViewName("Gmember/mBuy");
		} catch (Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/mOrder.do", method = RequestMethod.GET)
	public void memberOrder(mOrderVO ovo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String[] arr = request.getParameter("param").split("/");
		String m_id = "Master";
		for(int i = 0; i < arr.length; i++) {
			String[] insert = arr[i].split(",");
			ovo.setBb_id(insert[0]);
			ovo.setM_id(m_id);
			ovo.setOd_size(insert[1]);
			ovo.setOd_amount(Integer.parseInt(insert[2]));
			ovo.setOd_options(insert[3]);
			ovo.setOd_price(Integer.parseInt(insert[4]));
			ovo.setOd_name(insert[5]);
			ovo.setOd_phone(insert[6]);
			ovo.setOd_addr1(Integer.parseInt(insert[7]));
			ovo.setOd_addr2(insert[8]);
			ovo.setOd_addr3(insert[9]);
			mOrderServiceImpl.insertOrder(ovo);
		}
		PrintWriter pw = response.getWriter();
		pw.println("<script>alert('주문이 완료되었습니다. 구매목록에서 확인하실 수 있습니다.'); location.href='/tain/mBuylist.do'; </script>");
		pw.flush();
	}

	@RequestMapping(value = "/mBuylist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberOrderList(ModelAndView mv){
		String m_id = "Master";
		Map<String, String> map = new HashMap<String, String>();
		for(int i = 0; i < mOrderServiceImpl.showOrderList(m_id).size(); i++) {
			map.put("bb_img", mCartServiceImpl.showOrderImg(mOrderServiceImpl.showOrderList(m_id).get(i).getBb_id()));
		}
		
		mv.addObject("orderimg", map);
		mv.addObject("orderlist", mOrderServiceImpl.showOrderList(m_id));
		mv.setViewName("Gmember/mBuylist");
		return mv;
	}

	@RequestMapping(value = "/mLikelist.do", method = RequestMethod.GET)
	public ModelAndView memberLikelist(ModelAndView mv) {
		String m_id = "Master";
		mv.addObject("likelist", mLikeServiceImpl.showLike(m_id));
		mv.setViewName("Gmember/mLikelist");
		return mv;
	}

	@RequestMapping(value = "/mLikelistboard.do", method = RequestMethod.GET)
	public ModelAndView memberLikelistboard(ModelAndView mv) {
		String m_id = "Master";
		mv.addObject("likelist", mLikeServiceImpl.showLike(m_id));
		mv.setViewName("Gmember/mLikelistboard");
		return mv;
	}

	@RequestMapping(value = "/mLikelistbboard.do", method = RequestMethod.GET)
	public ModelAndView memberLikelistbboard(ModelAndView mv) {
		String m_id = "Master";
		mv.addObject("likelist", mLikeServiceImpl.showLike(m_id));
		mv.setViewName("Gmember/mLikelistbboard");
		return mv;
	}

	@RequestMapping(value = "/mBusiness.do", method = RequestMethod.GET)
	public ModelAndView mBusiness(ModelAndView mv) {
		String m_id ="Master";
		if(bMemberServiceImpl.showbMember(m_id) != null) {
			mv.addObject("bMemAddr", bMemberServiceImpl.showbMember(m_id).getBm_addr().split("/"));
		}
		mv.addObject("bMember", bMemberServiceImpl.showbMember(m_id));
		mv.setViewName("Gmember/mBusiness");
		return mv;
	}
	
	@RequestMapping(value = "/insertbMember.do", method = RequestMethod.POST)
	public void insertbMember(bMemberVO bvo, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println("<script>alert('비즈니스 전환 신청되었습니다. 관리자 승인이 되어야 전환 됩니다.'); location.href='/tain/mManage.do'; </script>");
		pw.flush();
		bMemberServiceImpl.insertbMember(bvo);
	}
	
	@RequestMapping(value = "/updatebMember.do", method = RequestMethod.POST)
	public void updatebMember(bMemberVO bvo, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println("<script>alert('비즈니스 정보가 수정되었습니다.'); location.href='/tain/mBusiness.do'; </script>");
		pw.flush();
		bMemberServiceImpl.updatebMember(bvo);
	}
	
	@RequestMapping(value = "/bOut.do", method = RequestMethod.GET)
	public ModelAndView bOut(ModelAndView mv) {
		mv.setViewName("Bmember/bOut");
		return mv;
	}
	
	@RequestMapping(value = "/bDelete.do", method = RequestMethod.GET)
	public void bDelete(HttpServletResponse response) throws IOException {
		String m_id = "Master";
		bMemberServiceImpl.deletebMember(m_id);
		response.sendRedirect("mBusiness.do");
	}
	
	@RequestMapping(value = "/bCategory.do", method = RequestMethod.GET)
	public ModelAndView bCategory(ModelAndView mv) {
		
		mv.setViewName("Bmember/bCategory");
		return mv;
	}
	
	@RequestMapping(value = "/bAD.do", method = RequestMethod.GET)
	public ModelAndView bAD(ModelAndView mv) {
		
		mv.setViewName("Bmember/bAD");
		return mv;
	}

	@RequestMapping(value = "/bOrder.do", method = RequestMethod.GET)
	public ModelAndView bOrder(ModelAndView mv) {
		
		mv.setViewName("Bmember/bOrder");
		return mv;
	}
}
