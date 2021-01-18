package com.project.tain.business.board.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.service.BsnBoardService;
import com.project.tain.util.Utils;

@Controller
public class BsnBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BsnBoardController.class);
	
	@Autowired
	private BsnBoardService bbService;
	
	public static final int LIMIT=9;
	
	// 게시물 목록
	@RequestMapping(value="/bbList.do", method = RequestMethod.GET)
	public ModelAndView bbListService(@RequestParam(name="page", defaultValue = "1") int page, 
			ModelAndView mv) {
		
		String m_id= "aaaa";	// 로그인 대체
		int currentPage=page;
		try {
			mv.addObject("listCount", bbService.listCount(m_id));	// 게시물카운트
			mv.addObject("category", bbService.selectCategory(m_id));//카테고리 목록
			mv.addObject("list", bbService.selectListAll(m_id));	// 게시물 텍스트정보
			mv.addObject("list", bbService.selectListPage(m_id, currentPage, LIMIT));	// 게시물 텍스트정보
			mv.setViewName("business/bsnMain");
//			mv.setViewName("business/bsnMain_backup");	//추후 삭제
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	// 게시물 스크롤 페이징
	@ResponseBody
	@RequestMapping(value="/bbListA", method = RequestMethod.POST)
	public HashMap<String, Object> bbListAjax(Model model, HttpServletRequest request,
			@RequestParam(name="page", defaultValue = "1") int page) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		String m_id= "aaaa";	// 로그인 대체
		int currentPage=page;
		int listCount=bbService.listCount(m_id);
		int maxPage=(int)((double)listCount/LIMIT+0.9);
		List<BsnBoard> logList = bbService.selectListPage(m_id, currentPage, LIMIT);
		result.put("listCount", bbService.listCount(m_id));	// 게시물카운트
		result.put("currentPage", currentPage);				// 현재 페이지
		result.put("maxPage", maxPage);						// 최대 페이지
		result.put("category", bbService.selectCategory(m_id));//카테고리 목록
		result.put("list", logList);	// 게시물 텍스트정보
		System.out.println("list:"+ logList);
		return result;
	}
	
	// 게시물 상세
	@ResponseBody
	@RequestMapping(value="/bbDetail", method = RequestMethod.POST)
	public HashMap <String, Object> bbDetailService(BsnBoard bb,
			Locale locale, Model model, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap <String,Object>();	
		
		try {
			result.put("bbDetail", bbService.selectOne(bb.getBb_id()));	// 게시물 상세
			System.out.println(bbService.selectOne(bb.getBb_id()));
			result.put("bbTags", bbService.selectOneTags(bb.getBb_id()));	// 게시물 상세
			System.out.println(bbService.selectOneTags(bb.getBb_id()));
		} catch(Exception e) {
			e.printStackTrace();
			result.put("ack", -1);
		} finally {
			
		}
		return result;
	}
	
	// 게시물 작성 페이지
	@RequestMapping(value="/bbWriteForm.do", method = RequestMethod.GET)
	public ModelAndView bbInsertForm(ModelAndView mv) {
		String m_id = "aaaa";
		try {
			mv.addObject("category", bbService.selectCategory(m_id));
			System.out.println("category: "+bbService.selectCategory(m_id));
			mv.setViewName("business/bbWriteForm");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	// 작성한 게시물 인서트
	@RequestMapping(value="/bbInsert.do", method = RequestMethod.POST)
	public ModelAndView boardInsert(BsnBoard bb, @RequestParam("tags") String tags,
			MultipartHttpServletRequest request, ModelAndView mv) {
		System.out.println("게시물 등록 컨트롤러" + bb);
		System.out.println("게시물 등록 컨트롤러" + request);
		try {
			if(request!=null && !request.equals("")) {
				uploadFiles(bb, request);
			}
			System.out.println("게시물 등록 파일저장성공");
			bbService.insertBsnBoard(bb);
			System.out.println("게시물 등록 인서트성공");
			List<String> tagList = Utils.tagParser(tags);
			System.out.println("tagList");
			for(String h_tag : tagList) {
				bb.setH_tag(h_tag);
				System.out.println("H_tag : "+bb.getH_tag());
				bbService.saveBsnTag(bb);
			}
			mv.setViewName("redirect:bbList.do");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	// 이미지 파일 저장
	public void uploadFiles(BsnBoard bb, MultipartHttpServletRequest request) {
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println("fileSize : " + fileList.size());
		String root = request.getSession().getServletContext().getRealPath("resources");
		String path= root + "\\uploadFiles";
		System.out.println("path : " + path);
		File folder = new File(path);
		String[] bbImgList = {bb.getBb_img1(), bb.getBb_img2(), bb.getBb_img3(), bb.getBb_img4(), bb.getBb_img5(), bb.getBb_img6(), bb.getBb_img7(), bb.getBb_img8(), bb.getBb_img9(), bb.getBb_img10()};
		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = null;
		String fileName = null;
		MultipartFile mf = null;
		for(int i =0; i<fileList.size();i++) {
			mf = fileList.get(i);
			fileName = System.currentTimeMillis() + fileList.get(i).getOriginalFilename();
			bbImgList[i] = fileName;
			filePath = folder + "\\" + fileName;
			try {
				mf.transferTo(new File(filePath));
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		bb.setBb_img1(bbImgList[0]);
		bb.setBb_img2(bbImgList[1]);
		bb.setBb_img3(bbImgList[2]);
		bb.setBb_img4(bbImgList[3]);
		bb.setBb_img5(bbImgList[4]);
		bb.setBb_img6(bbImgList[5]);
		bb.setBb_img7(bbImgList[6]);
		bb.setBb_img8(bbImgList[7]);
		bb.setBb_img9(bbImgList[8]);
		bb.setBb_img10(bbImgList[9]);
	}
	
	// 게시물 수정 페이지
	@RequestMapping(value="/bbRenew.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam(name="bb_id") String bb_id, ModelAndView mv) {
		String m_id = "aaaa";
		try {
			mv.addObject("bbRenew", bbService.selectOne(bb_id));
			mv.addObject("bbTags", bbService.selectOneTags(bb_id));
			mv.addObject("category", bbService.selectCategory(m_id));
			System.out.println("bbTags:"+bbService.selectOneTags(bb_id));
			mv.setViewName("business/bbRenew");
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}	
		return mv;
	}
	
	// 수정한 게시물 업데이트
	@RequestMapping(value="/bbUpdate.do", method = RequestMethod.POST)
	public ModelAndView boardUpdate(BsnBoard bb,
			MultipartHttpServletRequest request, ModelAndView mv) {
		System.out.println("게시물 업데이트 컨트롤러 : "+ bb);
		System.out.println("게시물 업데이트 컨트롤러 : "+ request);
		try {
			if(request!=null && !request.equals("")) {
				System.out.println("업데이트 이미지 이프");
//				removeFile(bb.getBb_img1(), request);
//				System.out.println("업데이트 이미지 삭제");
				uploadFiles(bb, request);
				System.out.println("업데이트 이미지 저장");
			}
			if(bbService.updateBsnBoard(bb)!=null) {
				System.out.println("업데이트 이프");
//				mv.addObject("bbUpdate", bbService.updateBsnBoard(bb));
				bbService.updateBsnBoard(bb);
				System.out.println("업데이트 애드");
				mv.setViewName("redirect:bbList.do");
			}
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	// 게시물 삭제
	@RequestMapping(value="/bbDelete.do")
	public ModelAndView boardDelete(@RequestParam(name="bb_id") String bb_id, 
			HttpServletRequest request, ModelAndView mv) {
		try {
			System.out.println("삭제컨입");
			BsnBoard bb = bbService.selectOneImg(bb_id);
			System.out.println("삭제셀원이");
//			removeFile(bb.getBb_img1(), request);
			System.out.println("삭제리파");
			
			bbService.deleteBsnBoard(bb_id);
			System.out.println("삭제완료");
			
			mv.setViewName("redirect:bbList.do");
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	// 파일 삭제(교재)
	private void removeFile(String imgfile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String path = root + "\\uploadFiles";
		String filePath = path+"\\" + imgfile;
		try {
			System.out.println(imgfile + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + path);
			File delFile = new File(filePath);
			delFile.delete();
		} catch(Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}
	
	// 장바구니 담기
	@ResponseBody
	@RequestMapping(value="/cartInsert", method = RequestMethod.POST)
	public String cartInsert(BsnBoard bb) {
		System.out.println("카트담기 컨트롤러");
		JSONObject job = new JSONObject();
		String m_id= "aaaa";
		bb.setM_id(m_id);
		System.out.println("카트담기 아이디"+bb.getM_id());
		System.out.println("카트담기 글번호"+bb.getBb_id());
		try {
			job.put("ack", bbService.addToCart(bb));
			System.out.println("카트담기 완료");
		} catch(Exception e) {
			e.printStackTrace();
			job.put("ack", -1);
		} finally {
			
		}
		return job.toJSONString();
	}
}
