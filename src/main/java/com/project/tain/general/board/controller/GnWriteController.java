package com.project.tain.general.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.tain.general.board.model.domain.GnWrite;
import com.project.tain.general.board.model.service.GnWriteService;

@Controller
public class GnWriteController {

	@Autowired
	private GnWriteService gwService;
	
	@RequestMapping(value = "/gnWrite", method = RequestMethod.GET)
	public ModelAndView gnWrite(HttpServletRequest request, ModelAndView mv) {
		try {
			mv.addObject("chkseq", gwService.chkseq());
			mv.setViewName("general/gnWrite");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value="/insertboard.do", method= RequestMethod.POST)
	public ModelAndView insertboard(GnWrite gw, @RequestParam(name = "upfile") MultipartFile report,
			MultipartHttpServletRequest request, ModelAndView mv, @RequestParam(name="h_tag") String h_tag, @RequestParam(name="seq") int seq) {
		
		String[] bImgList = {gw.getB_img1(),gw.getB_img2(),gw.getB_img3(),gw.getB_img4(),gw.getB_img5(),gw.getB_img6(),gw.getB_img7(),gw.getB_img8(),gw.getB_img9(),gw.getB_img10()};
		try {
			if(request!=null && !request.equals("")) {
				uploadFiles(request);
			}
			System.out.println("게시물 등록 파일저장성공");
			List<MultipartFile> fileList = request.getFiles("upfile");
			for(int i = 0 ; i < fileList.size(); i++) {
				bImgList[i] = fileList.get(i).getOriginalFilename();
				System.out.println(bImgList[i]);
			}
			System.out.println(h_tag);
			gw.setB_img1(bImgList[0]);
			gw.setB_img2(bImgList[1]);
			gw.setB_img3(bImgList[2]);
			gw.setB_img4(bImgList[3]);
			gw.setB_img5(bImgList[4]);
			gw.setB_img6(bImgList[5]);
			gw.setB_img7(bImgList[6]);
			gw.setB_img8(bImgList[7]);
			gw.setB_img9(bImgList[8]);
			gw.setB_img10(bImgList[9]);
			System.out.println(seq);
			gwService.insertboard(gw);
			gwService.insertboardimg(gw);
			String[] array = h_tag.split(",");
			for(int i = 0; i<array.length;i++) {
				gw.setH_tag(array[i]);
				System.out.println(array[i]);
				gwService.insertboardhashtag(gw);
			}
			mv.setViewName("redirect:/timeLine");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	public void uploadFiles(MultipartHttpServletRequest request) {
		List<MultipartFile> fileList = request.getFiles("upfile");
		System.out.println(fileList);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = null;
		for(MultipartFile mf : fileList) {
			
//			 String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//			 String safeFile = path + System.currentTimeMillis() + originFileName;
	         System.out.println("originFileName : " + mf.getOriginalFilename());
	         filePath = folder + "/" + mf.getOriginalFilename(); 
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
	
	
}
