package com.project.tain.business.board.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.project.tain.general.board.model.service.GnBoardService;
import com.project.tain.post.model.service.TimeLineService;
import com.project.tain.util.Utils;


@Controller
public class BsnBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BsnBoardController.class);
	
	@Autowired
	private BsnBoardService bbService;
	
	@Autowired
	private GnBoardService gService;
	
	@Autowired
	private TimeLineService tService;
	
	@Autowired
	private com.project.tain.membermanage.model.service.mMessageServiceImpl mMessageServiceImpl;
	
	public static final int LIMIT=9;
	
	// 게시물 목록
	
	@RequestMapping(value="/bbList.do", method = RequestMethod.GET)
	public ModelAndView bbListService(@RequestParam(name="page", defaultValue = "1") int page, 
			@RequestParam(name="m_id") String m_id, 
			ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String my_name=(String) session.getAttribute("my_name");
		String result=gService.userType(m_id);
		int currentPage=page;
		try {
			if(result.equals("G")) {
				mv.addObject("chkfollow", tService.chkfollow(my_name));
				mv.addObject("id_img_fwr", gService.showp_one(m_id));
				mv.addObject("fw", gService.showp_two(m_id));
				mv.addObject("gboard", gService.showp_three(m_id));
				mv.addObject("bboard", gService.showp_four(m_id));
				mv.addObject("storychk", gService.storychk(m_id));
				//mv.addObject("showpost", gService.showpost(m_id));
				mv.addObject("showpost", gService.showpostPage(m_id, currentPage, LIMIT));
				mv.addObject("highlight", gService.highlight(m_id));
				mv.addObject("followchk", gService.followchk(my_name, m_id));
				mv.addObject("recomFow", gService.recomFow(my_name, m_id));
				mv.addObject("selectFollow", gService.selectFollow(m_id));
				mv.addObject("selectFollower", gService.selectFollower(m_id));
				mv.addObject("showpostCount", gService.showpostCount(m_id));
				mv.addObject("alarmcheck", tService.alarmcheck(my_name));
				mv.addObject("shownotice", tService.shownotice(my_name));
				mv.setViewName("general/gnMain");
			} else if (result.equals("B")) {
				mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
				mv.addObject("shownotice", tService.shownotice(my_name));
				mv.addObject("alarmcheck", tService.alarmcheck(my_name));
				mv.addObject("chkfollow", tService.chkfollow(my_name));
				mv.addObject("id_img_fwr", gService.showp_one(m_id));
				mv.addObject("fw", gService.showp_two(m_id));
				mv.addObject("gboard", gService.showp_three(m_id));
				mv.addObject("bboard", gService.showp_four(m_id));
				mv.addObject("storychk", gService.storychk(m_id));
				mv.addObject("showpost", gService.showpost(m_id));
				mv.addObject("highlight", gService.highlight(m_id));
				mv.addObject("followchk", gService.followchk(my_name, m_id));
				mv.addObject("recomFow", gService.recomFow(my_name, m_id));
				mv.addObject("selectFollow", gService.selectFollow(m_id));
				mv.addObject("selectFollower", gService.selectFollower(m_id));
				mv.addObject("showpostCount", gService.showpostCount(m_id));
				mv.addObject("bsnInfo", bbService.bsnInfo(m_id));
				mv.addObject("bsnInfoFollow", bbService.bsnInfoFollow(m_id));
				mv.addObject("bsnInfoFollower", bbService.bsnInfoFollower(m_id));
				mv.addObject("listCount", bbService.listCount(m_id));	// 게시물카운트
				mv.addObject("category", bbService.selectCategory(m_id));//카테고리 목록
				mv.addObject("list", bbService.selectListPage(m_id, currentPage, LIMIT));	// 게시물 텍스트정보
				mv.setViewName("business/bsnMain");
			}
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	
	// 게시물 스크롤 페이징
	@ResponseBody
	@RequestMapping(value="/bbListA", method = RequestMethod.POST)
	public HashMap<String, Object> bbListAjax(Model model, HttpServletRequest request,
			@RequestParam(name="m_id") String m_id, 
			@RequestParam(name="page", defaultValue = "1") int page) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		System.out.println("스크롤 페이징 m_id:"+ m_id);
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
			
			System.out.println("bbDetail:"+bbService.selectOne(bb.getBb_id()));
			result.put("bbDetail", bbService.selectOne(bb.getBb_id()));	// 게시물 상세
			System.out.println("bbTags:"+bbService.selectOneTags(bb.getBb_id()));
			result.put("bbTags", bbService.selectOneTags(bb.getBb_id()));	// 게시물 상세
		} catch(Exception e) {
			e.printStackTrace();
			result.put("ack", -1);
		} finally {
			
		}
		return result;
	}
	
	// 게시물 작성 페이지
	@RequestMapping(value="/bbWriteForm.do", method = RequestMethod.GET)
	public ModelAndView bbInsertForm(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id=(String) session.getAttribute("my_name");
		String my_name=(String) session.getAttribute("my_name");
		try {
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("shownotice", tService.shownotice(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.addObject("m_id", m_id);
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
		System.out.println("게시물 등록 컨트롤러" + bb.getM_id());
		HttpSession session = request.getSession();
		String my_name=(String) session.getAttribute("my_name");
		bb.setMy_name(bb.getM_id());
		String m_id = bb.getM_id();
		try {
			if(request!=null && !request.equals("")) {
				uploadFiles(bb, request);
			}
			System.out.println("게시물 등록 파일저장성공");
			bbService.insertBsnBoard(bb);
			System.out.println("게시물 등록 인서트성공");
			List<String> tagList = Utils.tagParser(tags);
			System.out.println("tagList"+tagList);
			for(String h_tag : tagList) {
				bb.setH_tag(h_tag);
				System.out.println("H_tag : "+bb.getH_tag());
				bbService.saveBsnTag(bb);
			}
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("shownotice", tService.shownotice(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.addObject("m_id", m_id);
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
	public ModelAndView boardDetail(@RequestParam(name="bb_id") String bb_id, ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id=(String) session.getAttribute("my_name");
		String my_name=(String) session.getAttribute("my_name");
		try {
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("shownotice", tService.shownotice(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.addObject("m_id", m_id);
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
		HttpSession session = request.getSession();
		String m_id=(String) session.getAttribute("my_name");
		String my_name=(String) session.getAttribute("my_name");
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
			System.out.println("업데이트 어디감?"+bbService.updateBsnBoard(bb));
			if(bbService.updateBsnBoard(bb)!=null) {
				System.out.println("업데이트 이프");
//				mv.addObject("bbUpdate", bbService.updateBsnBoard(bb));
				bbService.updateBsnBoard(bb);
				System.out.println("업데이트 애드 m_id"+m_id);
				mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
				mv.addObject("chkfollow", tService.chkfollow(my_name));
				mv.addObject("shownotice", tService.shownotice(my_name));
				mv.addObject("alarmcheck", tService.alarmcheck(my_name));
				mv.addObject("m_id", m_id);
				mv.setViewName("redirect:bbList.do");
			}
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	// 게시물 삭제
	@RequestMapping(value="/bbDelete.do")
	public ModelAndView boardDelete(@RequestParam(name="bb_id") String bb_id, 
			@RequestParam(name="m_id") String m_id, 
			HttpServletRequest request, ModelAndView mv) {
			System.out.println("삭제컨입"+m_id);
		try {
			System.out.println("삭제컨입");
			BsnBoard bb = bbService.selectOneImg(bb_id);
			System.out.println("삭제셀원이");
//			removeFile(bb.getBb_img1(), request);
			System.out.println("삭제리파");
			
			bbService.deleteBsnBoard(bb_id);
			System.out.println("삭제완료");
			mv.addObject("m_id", m_id);
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
	public String cartInsert(BsnBoard bb, HttpServletRequest request) {
		System.out.println("카트담기 컨트롤러");
		JSONObject job = new JSONObject();
		HttpSession session = request.getSession();
		String m_id=(String) session.getAttribute("my_name");
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
	
	// 좋아요 체크
	@ResponseBody
	@RequestMapping(value="/bb_like_chk", method = RequestMethod.POST)
	public HashMap<String, Object> bbLikeChk(BsnBoard bb, Model model, HttpServletRequest request,
			@RequestParam(name="bb_id") String bb_id ) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		HttpSession session = request.getSession();
		String m_id=(String) session.getAttribute("my_name");
		bb.setM_id(m_id);
		System.out.println("좋아요 체크 게시물:"+bb.getBb_id());
		System.out.println("좋아요 체크 아이디:"+bb.getM_id());
		System.out.println("좋아요 체크:"+ bbService.checkBb_like(bb));
		if(bbService.checkBb_like(bb)==null) {
			result.put("bbLikeChk", "0");	
		} else {
			result.put("bbLikeChk", "1");	
		}
		return result;
	}
	
	
	// 팔로우 체크
	@ResponseBody
	@RequestMapping(value="/bb_follow_chk", method = RequestMethod.POST)
	public HashMap<String, Object> bbfollowchk(BsnBoard bb, Model model, HttpServletRequest request,
			@RequestParam(name="m_id") String m_id ) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		HttpSession session = request.getSession();
		String my_name=(String) session.getAttribute("my_name");
		bb.setM_id(m_id);
		bb.setMy_name(my_name);
		System.out.println("팔로우 내 아이디:"+bb.getMy_name());
		System.out.println("팔로우 체크 아이디:"+bb.getM_id());
		System.out.println("팔로우 체크:"+ bbService.checkFollow(bb));
		if(bbService.checkFollow(bb)==null) {
			result.put("bbFollowChk", "0");	
		} else {
			result.put("bbFollowChk", "1");	
		}
		return result;
	}
	
	// 계정 팔로우
	@ResponseBody
	@RequestMapping(value="/bbFollow", method = RequestMethod.POST)
	public HashMap<String, Object> bbFollow(BsnBoard bb, Model model, HttpServletRequest request,
			@RequestParam(name="m_id") String m_id, @RequestParam(name="my_name") String my_name ) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		System.out.println("팔로우 내 아이디:"+my_name);
		System.out.println("팔로우 아이디:"+m_id);
		System.out.println("팔로우 :"+ bbService.follow(bb));
		if(bbService.checkFollow(bb)==null) {
			result.put("bbFollow", "0");	
		} else {
			result.put("bbFollow", "1");	
		}
		return result;
	}
	
	// 계정 언팔로우
	@ResponseBody
	@RequestMapping(value="/bbUnFollow", method = RequestMethod.POST)
	public HashMap<String, Object> bbUnFollow(BsnBoard bb, Model model, HttpServletRequest request,
			@RequestParam(name="m_id") String m_id, @RequestParam(name="my_name") String my_name ) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		System.out.println("언팔로우 내 아이디:"+my_name);
		System.out.println("언팔로우  아이디:"+m_id);
		System.out.println("언팔로우 :"+ bbService.unFollow(bb));
		if(bbService.checkFollow(bb)==null) {
			result.put("bbUnFollow", "0");	
		} else {
			result.put("bbUnFollow", "1");	
		}
		return result;
	}
	
}
