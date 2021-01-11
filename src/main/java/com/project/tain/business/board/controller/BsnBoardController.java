package com.project.tain.business.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

//import com.project.tain.business.board.model.dao.MediaUtils;
//import com.project.tain.business.board.model.dao.UploadFileUtils;
import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.service.BsnBoardReplyService;
import com.project.tain.business.board.model.service.BsnBoardService;

@Controller
public class BsnBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BsnBoardController.class);
	
	@Autowired
	private BsnBoardService bbService;
	@Autowired
	private BsnBoardReplyService bbrService;
	
	public static final int LIMIT=10;
	
	// 게시물 목록
	@RequestMapping(value="/bbList.do", method = RequestMethod.GET)
	public ModelAndView bbListService(
			ModelAndView mv) {
		
		String m_id= "aaaa";	// 로그인 대체
		
		String bb_id= "BB210104066";	// 게시물아이디 대체
		try {
			mv.addObject("listCount", bbService.listCount(m_id));	//게시물카운트
			mv.addObject("list", bbService.selectListAll(m_id));	// 게시물 텍스트정보
			mv.addObject("bbDetail", bbService.selectOne(m_id));	// 게시물 상세
			mv.addObject("listImg", bbService.selectOneImg(m_id));	// 리스트이미지
//			mv.addObject("bbrList", bbrService.bbrList(bb_id));	// 댓글 리스트
			mv.setViewName("business/bsnMain");
		} catch(Exception e) {
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
//	public ModelAndView bbListService(@RequestParam(name="m_id") String m_id, ModelAndView mv) {
//		try {
//			if(m_id!=null&&!m_id.equals(""))
//				mv.addObject("list", bbService.selectList(m_id));
//			mv.setViewName("business/bsnMain");
//		} catch(Exception e) {
//			mv.addObject("errorMsg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
	
	// 게시물 작성 페이지
	@RequestMapping(value="/bbWriteForm.do", method = RequestMethod.GET)
	public String bbInsertForm(ModelAndView mv) {
		return "business/bbWriteForm";
	}
	
	// 작성한 게시물 인서트
	@RequestMapping(value="/bbInsert.do", method = RequestMethod.POST)
	public ModelAndView bsnBoardInsert(BsnBoard bb,
			@RequestParam Map<String, MultipartFile> fileMap,
			MultipartHttpServletRequest request, ModelAndView mv) {
		
		System.out.println(fileMap.size());
		System.out.println(request.getParameter("file"));
		try {
			Iterator itr = request.getFileNames();
			
			
//			if(fileMap!=null && !fileMap.equals("")) {
//				saveFile(fileMap, request);
//			}
//			for(int i =0; i<fileMap.size(); i++) {
//				bba.setBb_imgi(fileMap.get(bb_imgi).va)
//			}
//			bba.setBb_img1(fileMap.getOriginalFilename());
			System.out.println("aaa1");
			bbService.insertBsnBoard(bb);
			System.out.println("인서트완료");
			mv.setViewName("redirect:bbList.do");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
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
	
	private void saveFile(MultipartFile report, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = null;

		try	{         
		    System.out.println(report.getOriginalFilename() + "을 저장합니다.");         
		    System.out.println("저장 경로 : " + savePath);
		    	 
		    filePath = folder + "\\" + report.getOriginalFilename(); 
		    	 
		    report.transferTo(new File(filePath)); 
		    System.out.println("파일 명 : " + report.getOriginalFilename());         
		    System.out.println("파일 경로 : " + filePath);         
		    System.out.println("파일 전송이 완료되었습니다.");      
		} catch (Exception e) {         
			System.out.println("파일 전송 에러 : " + e.getMessage());      
		}   
	}
	
	private void removeFile(String imgfile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		String filePath = savePath+"\\" + imgfile;
		try {
			System.out.println(imgfile + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + savePath);
			File delFile = new File(filePath);
			delFile.delete();
		} catch(Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}
	

//	@Resource(name = "uploadPath")
//	private String uploadPath;
//
//	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
//	public void uploadForm() throws Exception {
//	}
//
//	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
//	public String uploadForm(MultipartFile file, Model model) throws Exception {
//
//		logger.info("originalName: " + file.getOriginalFilename());
//		logger.info("size: " + file.getSize());
//		logger.info("contentType: " + file.getContentType());
//
//		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//
//		model.addAttribute("savedName", savedName);
//
//		return "uploadResult";
//	}
//
//	private String uploadFile(String originalName, byte[] fileData) throws Exception {
//
//		UUID uid = UUID.randomUUID();
//		String savedName = uid.toString() + "_" + originalName;
//		File target = new File(uploadPath, savedName);
//		FileCopyUtils.copy(fileData, target);
//		return savedName;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
//	public String uploadAjax(MultipartFile file, String str, HttpSession session,
//			HttpServletRequest request, Model model) throws Exception {
//
//		logger.info("originalName: " + file.getOriginalFilename());
//
//			ResponseEntity<String> img_path = new ResponseEntity<>(
//					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
//					HttpStatus.CREATED);
//			String user_imgPath = (String) img_path.getBody();
//
//			logger.info(user_imgPath);
//			BsnBoard vo = new BsnBoard();
//			vo.setBb_img1(user_imgPath);
//			BsnBoard id = (BsnBoard) session.getAttribute("login");
//			System.out.println(id.getM_id());
//			vo.setM_id(id.getM_id());
//			logger.info("file name : " + user_imgPath);
//
//			return user_imgPath;
//	}
//
//	@ResponseBody
//	@RequestMapping("/displayFile")
//	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
//
//		InputStream in = null;
//		ResponseEntity<byte[]> entity = null;
//
//		logger.info("FILE NAME: " + fileName);
//
//		try {
//
//			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
//
//			MediaType mType = MediaUtils.getMediaType(formatName);
//
//			HttpHeaders headers = new HttpHeaders();
//
//			in = new FileInputStream(uploadPath + fileName);
//
//			if (mType != null) {
//				headers.setContentType(mType);
//			} else {
//
//				fileName = fileName.substring(fileName.indexOf("_") + 1);
//				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//				headers.add("Content-Disposition",
//						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
//			}
//
//			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
//		} finally {
//			in.close();
//		}
//		return entity;
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
//	public ResponseEntity<String> deleteFile(String fileName) {
//
//		logger.info("delete file: " + fileName);
//
//		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
//
//		MediaType mType = MediaUtils.getMediaType(formatName);
//
//		if (mType != null) {
//
//			String front = fileName.substring(0, 12);
//			String end = fileName.substring(14);
//			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
//		}
//
//		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
//
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);
//	}
}
