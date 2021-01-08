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
	
	// 댓글 목록
	@ResponseBody
	@RequestMapping(value="/bbrList", method = RequestMethod.POST)
	public HashMap <String, Object> bbrListService(Locale locale, Model model, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		String bb_id = request.getParameter("bb_id");
		BsnBoardReply bbr = new BsnBoardReply();
		bbr.setBb_id(bb_id);;
		List<BsnBoardReply> logList = bbrService.bbrList(bb_id);
		System.out.println("좋아요:"+bbrService.bbrList(bb_id).get(1));
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
//	@ResponseBody
//	@RequestMapping(value="/bbrList", method = RequestMethod.POST)
//	public String bbrListService(BsnBoardReply bbr, 
//			@RequestParam("bb_id") String bb_id){
//		HashMap<String , String> result = new HashMap<String, String>();
//		// 로그인 대체
//		String m_id= "aaaa";
//		JSONObject job = new JSONObject();
//		try {
//			System.out.println("bbrlist 시작");
//			job.put("ack", bbrService.bbrList(bb_id));
//			
//			System.out.println("bbrlist 완료");
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("bbrlist error");
//			job.put("ack", -1);
//		}
//		return job.toJSONString();
//	}
	
	@ResponseBody
	@RequestMapping(value="/bbrInsert.do", method = RequestMethod.POST)
	public String bsnBoardInsert(BsnBoardReply bbr) {
		
		String m_id= "aaaa";
		JSONObject job = new JSONObject();
		try {
			System.out.println("댓글 컨트롤러");
			job.put("ack", bbrService.insertBbr(bbr));
			System.out.println("인서트완료");
		} catch(Exception e) {
			job.put("ack", -1);
		} finally {
			
		}
		
		return job.toJSONString();
	}
	
	// 시험
//	@RequestMapping(value="/bbrInsert.do", method = RequestMethod.GET)
//	public ModelAndView bsnBoardInsert(BsnBoardReply bbr, ModelAndView mv,
//			@RequestParam(name="m_id") String m_id) {
//		
//		m_id= "aaaa";
//		try {
//			
//			System.out.println("댓글 컨트롤러");
//			bbrService.insertBbr(bbr);
//			System.out.println("인서트완료");
//			mv.setViewName("redirect:bbList.do");
//		} catch(Exception e) {
//			mv.addObject("errorMsg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
	
//	// 수정한 게시물 업데이트
//		@RequestMapping(value="/bbrUpdate.do", method = RequestMethod.POST)
//		public ModelAndView boardUpdate(BsnBoard bb, HttpServletRequest request, ModelAndView mv) {
//			System.out.println("업데이트 돌입");
//			try {
//				
//				bbService.updateBsnBoard(bb);
//				if(bbService.updateBsnBoard(bb)!=null) {
//					System.out.println("업데이트 이프");
//					mv.addObject("board_num", bbService.updateBsnBoard(bb));
//					System.out.println("업데이트 애드");
//					mv.addObject("bb_id", bb.getBb_id());	// 선생님 추천 코드
//					mv.setViewName("redirect:bbList.do");
//				}
//			} catch(Exception e) {
//				mv.addObject("msg", e.getMessage());
//				mv.setViewName("errorPage");
//			}
//			return mv;
//		}
//		
//		// 게시물 삭제
//		@RequestMapping(value="/bbrDelete.do")
//		public ModelAndView boardDelete(@RequestParam(name="bb_id") String bb_id, 
//				HttpServletRequest request, ModelAndView mv) {
//			try {
//				System.out.println("bbr삭제컨입");
//				BsnBoard bb = bbService.selectOneImg(bb_id);
//				System.out.println("bbr삭제셀원이");
//				
//				bbService.deleteBsnBoard(bb_id);
//				System.out.println("bbr삭제완료");
//				
//				mv.setViewName("redirect:bbList.do");
//			} catch(Exception e) {
//				mv.addObject("msg", e.getMessage());
//				mv.setViewName("errorPage");
//			}
//			return mv;
//		}
}
