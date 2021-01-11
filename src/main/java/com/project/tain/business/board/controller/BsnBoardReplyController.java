package com.project.tain.business.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.domain.BsnBoardReply;
import com.project.tain.business.board.model.service.BsnBoardReplyService;
import com.project.tain.business.board.model.service.BsnBoardService;

@Controller
public class BsnBoardReplyController {
	
	@Autowired
	private BsnBoardReplyService bbrService;
	
	@Autowired
	private BsnBoardReply bbr;
	
	// 댓글 목록
	@ResponseBody
	@RequestMapping(value="/bbrList", method = RequestMethod.POST)
	public HashMap <String, Object> bbrListService(Locale locale, Model model, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		String bb_id = request.getParameter("bb_id");
		BsnBoardReply bbr = new BsnBoardReply();
		bbr.setBb_id(bb_id);;
		List<BsnBoardReply> logList = bbrService.bbrList(bb_id);
		if ( logList.isEmpty() ) {
			String Msg = "이력이 없습니다.";
			String Code = "1";
			result.put("Msg", Msg);
			result.put("Code", Code);
			return result;
		} else {
			String Msg = "성공";
			String Code = "0";
			result.put("Msg", Msg);
			result.put("Code", Code);
			result.put("data", logList);
			return result;
		}
	}

	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="/bbrInsert", method = RequestMethod.POST)
	public HashMap <String, Object> bbrInsert(BsnBoardReply bbr, Locale locale, Model model, HttpServletRequest request) {
		System.out.println("댓글등록 컨트롤러");
		HashMap<String, Object> result = new HashMap <String,Object>();
		String m_id= "aaaa";
		bbr.setM_id(m_id);
		System.out.println("댓글등록 아이디"+bbr.getM_id());
		System.out.println("댓글등록 상위글"+bbr.getBb_topid());
		System.out.println("댓글등록 내용"+bbr.getBb_info());
		try {
			result.put("ack", bbrService.insertBbr(bbr));
			System.out.println("댓글인서트완료");
			List<BsnBoardReply> logList = bbrService.bbrList(bbr.getBb_topid());
			System.out.println("댓글인서트 리스트:"+logList);
			result.put("data", logList);
		} catch(Exception e) {
			e.printStackTrace();
			result.put("ack", -1);
		} finally {
			
		}
		
		return result;
	}
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/bbrDelete", method = RequestMethod.POST)
	public HashMap <String, Object> bbrDelete(BsnBoardReply bbr, Locale locale, Model model, HttpServletRequest request) {
		System.out.println("댓글등록 컨트롤러");
		HashMap<String, Object> result = new HashMap <String,Object>();
		System.out.println("댓글등록 글번호"+bbr.getBb_id());
		try {
			result.put("ack", bbrService.deleteBbr(bbr.getBb_id()));
			System.out.println("댓글삭제완료");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("ack", -1);
		} finally {
			
		}
		
		return result;
	}
	
//	// 게시물 삭제
//	@ResponseBody
//	@RequestMapping(value="/bbrDelete", method = RequestMethod.POST)
//	public HashMap <String, Object> bbrDelete(BsnBoardReply bbr, Locale locale, Model model, HttpServletRequest request) {
//		System.out.println("댓글삭제 컨트롤러");
//		HashMap<String, Object> result = new HashMap <String,Object>();
//		System.out.println("댓글삭제 글번호"+bbr.getBb_id());
////		System.out.println("댓글삭제 상위글번호1:"+bb_topid);
//		
//		try {
//			result.put("data", bbrService.deleteBbr(bbr.getBb_id()));
//			System.out.println("댓글삭제완료");
////			System.out.println("댓글삭제 상위글번호2:"+bbr.getBb_topid());
////			List<BsnBoardReply> logList = bbrService.bbrList(bbr.getBb_topid());
////			System.out.println("댓글삭제 후 리스트:"+logList);
////			result.put("data", logList);
//		} catch(Exception e) {
//			System.out.println("댓글삭제 catch");
//			e.printStackTrace();
//			result.put("ack", -1);
//		} finally {
//			
//		}
//		
//		return result;
//	}
}
