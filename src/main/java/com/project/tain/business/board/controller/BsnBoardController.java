package com.project.tain.business.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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

//import com.project.tain.business.board.model.dao.MediaUtils;
//import com.project.tain.business.board.model.dao.UploadFileUtils;
import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.service.BsnBoardService;

@Controller
public class BsnBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BsnBoardController.class);
	
	@Autowired
	private BsnBoardService bbService;
	
	public static final int LIMIT=10;
	
	// 게시물 목록
	@RequestMapping(value="/bbList.do", method = RequestMethod.GET)
	public ModelAndView bbListService(
			ModelAndView mv) {
		
		String m_id= "aaaa";	// 로그인 대체
		
		try {
			mv.addObject("listCount", bbService.listCount(m_id));	//게시물카운트
			mv.addObject("list", bbService.selectListAll(m_id));	// 게시물 텍스트정보
			mv.setViewName("business/bsnMain");
//			mv.setViewName("business/bsnMain_backup");	//추후 삭제
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
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
		} catch(Exception e) {
			e.printStackTrace();
			result.put("ack", -1);
		} finally {
			
		}
		return result;
	}
	
	// 게시물 작성 페이지
	@RequestMapping(value="/bbWriteForm.do", method = RequestMethod.GET)
	public String bbInsertForm(ModelAndView mv) {
		return "business/bbWriteForm";
	}
	
	// 작성한 게시물 인서트
	@RequestMapping(value="/bbInsert.do", method = RequestMethod.POST)
	public ModelAndView boardInsert(BsnBoard bb, 
			MultipartHttpServletRequest request, ModelAndView mv) {
		System.out.println("게시물 등록 컨트롤러" + bb);
		System.out.println("게시물 등록 컨트롤러" + request);
		String[] bbImgList = {bb.getBb_img1(), bb.getBb_img2(), bb.getBb_img3(), bb.getBb_img4(), bb.getBb_img5(), bb.getBb_img6(), bb.getBb_img7(), bb.getBb_img8(), bb.getBb_img9(), bb.getBb_img10()};
		try {
			if(request!=null && !request.equals("")) {
				uploadFiles(request);
			}
			System.out.println("게시물 등록 파일저장성공");
			List<MultipartFile> fileList = request.getFiles("file");
			for(int i = 0 ; i < fileList.size(); i++) {
				bbImgList[i] = fileList.get(i).getOriginalFilename();
				System.out.println(bbImgList[i]);
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
			bbService.insertBsnBoard(bb);
			mv.setViewName("redirect:bbList.do");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	// 이미지 파일 저장
	public void uploadFiles(MultipartHttpServletRequest request) {
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println("fileSize : " + fileList.size());
		String root = request.getSession().getServletContext().getRealPath("resources");
		String path= root + "\\uploadFiles";
		File folder = new File(path);
		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = null;
		for(MultipartFile mf : fileList) {
//			 String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//			 String safeFile = path + System.currentTimeMillis() + originFileName;
	         System.out.println("originFileName : " + mf.getOriginalFilename());
	         filePath = folder + "\\" + System.currentTimeMillis() +mf.getOriginalFilename(); 
	         System.out.println("파일 경로 : " + filePath);      
			try {
				mf.transferTo(new File(filePath));
			}  catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
		}
	}
	
	//인서트 맵<> 사용 x
//	@RequestMapping(value="/bbInsert.do", method = RequestMethod.POST)
//	public ModelAndView bsnBoardInsert(BsnBoard bb, BsnBoardAdd bba,
//			@RequestParam(name="imgfile", required=false) MultipartFile report,
//			HttpServletRequest request, ModelAndView mv) {
//		try {
//			if(report!=null && !report.equals("")) {
//				saveFile(report, request);
//			}
//			bba.setBb_img1(report.getOriginalFilename());
//			System.out.println("aaa1");
//			bbService.insertBsnBoard(bb, bba);
//			System.out.println("인서트완료");
//			mv.setViewName("redirect:bbList.do");
//		} catch(Exception e) {
//			mv.addObject("errorMsg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}

	
	// 게시물 수정 페이지
	@RequestMapping(value="/bbRenew.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam(name="bb_id") String bb_id, ModelAndView mv) {
		try {
			mv.addObject("bbRenew", bbService.selectOne(bb_id));
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
			@RequestParam(name="imgfile") MultipartFile report, HttpServletRequest request, ModelAndView mv) {
		System.out.println("업데이트 돌입");
		try {
			if(report!=null && !report.getOriginalFilename().equals("")) {
				System.out.println("업데이트 이미지 이프");
				removeFile(bb.getBb_img1(), request);
				System.out.println("업데이트 이미지 삭제");
//				saveFile(report, request);
				System.out.println("업데이트 이미지 저장");
				bb.setBb_img1(report.getOriginalFilename());
				System.out.println("업데이트 이미지 셋");
			}
//			bbService.updateBsnBoard(bb, bba);
			if(bbService.updateBsnBoard(bb)!=null) {
				System.out.println("업데이트 이프");
				mv.addObject("board_num", bbService.updateBsnBoard(bb));
				System.out.println("업데이트 애드");
//				mv.addObject("board_num", b.getBoard_num());	// 선생님 추천 코드
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
			removeFile(bb.getBb_img1(), request);
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
	
	// 게시물 상세를 에이작스로 하려고 했을 때 쓴 코드
//	@ResponseBody
//	@RequestMapping(value="/bbImg.do", method = RequestMethod.POST)
//	public String bsnBoardImg(BsnBoard bb,
//			@RequestParam(name="bb_id", required=false) String bb_id,
//			HttpServletRequest request, ModelAndView mv) {
//		JSONObject job = new JSONObject();
//		try {
//			
//		} catch(Exception e) {
//			mv.addObject("errorMsg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return job.toJSONString();
//	}
	
	// 교재(추후삭제)
	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String path = root + "\\uploadFiles";
		File folder = new File(path);

		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = null;

		try	{         
		    System.out.println(report.getOriginalFilename() + "을 저장합니다.");         
		    System.out.println("저장 경로 : " + path);
		    	 
		    filePath = folder + "\\" + report.getOriginalFilename(); 
		    	 
		    report.transferTo(new File(filePath)); 
		    System.out.println("파일 명 : " + report.getOriginalFilename());         
		    System.out.println("파일 경로 : " + filePath);         
		    System.out.println("파일 전송이 완료되었습니다.");      
		} catch (Exception e) {         
			System.out.println("파일 전송 에러 : " + e.getMessage());      
		}   
	}
	
	//교재(추후삭제)
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
}
