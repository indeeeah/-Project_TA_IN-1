package com.project.tain.post.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.tain.post.model.domain.TimeLine;
import com.project.tain.post.model.service.TimeLineService;

@Controller
public class TimeLineController {

	@Autowired
	private TimeLineService tService;
	
	public static final int LIMIT=3;

	@RequestMapping(value = "/test.do")
	public String testForm(ModelAndView mv) {
		return "test";
	}
	
	@RequestMapping(value = "/websockettest.do")
	public String websockettest(ModelAndView mv) {
		return "post/websockettest";
	}
	@RequestMapping(value = "/chartTest.do")
	public String chartTest(ModelAndView mv) {
		//mv.addObject("forRegChart", tService.forRegChart());
		return "chartTest";
	}
	@ResponseBody
	@RequestMapping(value = "/forchartTest.do", method = RequestMethod.POST)
	public Object forchartTest(ModelAndView mv, TimeLine tl) {
			List<TimeLine> chart = tService.forRegChart(tl);
			List<TimeLine> chartl = tService.forLikeChart(tl);
			System.out.println(tService.forRegChart(tl));
		return chart;
	}
	
	@RequestMapping(value = "/testSession.do")
	public ModelAndView testSession(ModelAndView mv, @RequestParam(name="m_id") String m_id, @RequestParam(name="lan") String lan, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String my_name = request.getParameter("m_id");
		String my_lan = request.getParameter("lan");
		System.out.println(my_name);
		System.out.println(my_lan);
		session.setAttribute("my_name", my_name);
		session.setAttribute("my_lan", my_lan);
		
		mv.setViewName("redirect:/timeLine");
		return mv;
	}

	// TimeLine Page
	@RequestMapping(value = "/timeLine", method = RequestMethod.GET)
	public ModelAndView timeLineList(@RequestParam(name="page", defaultValue = "1") int page,HttpServletRequest request, ModelAndView mv) {
		int currentPage = page;
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			System.out.println("==============================");
			System.out.println("세션에 저장 돼 있는 변수 : "+my_name);
			System.out.println("==============================");
			mv.addObject("myProfile", tService.showMyProf(my_name));
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("storyList", tService.showStoryList(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));

			//mv.addObject("timeLineList", tService.showTimeLineList(my_name));
			mv.addObject("count", tService.timeLineListCount(my_name));
			mv.addObject("timeLineList", tService.showTimeLineListPage(my_name, currentPage, LIMIT));
			mv.addObject("recomFollow", tService.recomFollow(my_name));
			
			//알람 체크 부분//
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.setViewName("post/timeline");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	
	// 게시물 스크롤 페이징
		@ResponseBody
		@RequestMapping(value="/timeLineScroll.do", method = RequestMethod.POST)
		public HashMap<String, Object> timeLineScroll(Model model, HttpServletRequest request,
				@RequestParam(name="page", defaultValue = "1") int page) {
			HashMap<String, Object> result = new HashMap <String,Object>();
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			int currentPage=page;
			int listCount=tService.timeLineListCount(my_name);
			int maxPage=(int)((double)listCount/LIMIT+0.9);
			List<TimeLine> logList = tService.showTimeLineListPage(my_name, currentPage, LIMIT);
			result.put("count", tService.timeLineListCount(my_name));	// 게시물카운트
			result.put("currentPage", currentPage);				// 현재 페이지
			result.put("maxPage", maxPage);						// 최대 페이지
			result.put("list", logList);	// 게시물 텍스트정보
			System.out.println("list:"+ logList);
			return result;
		}
	
	// 고객센터
	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public ModelAndView aboutUs(HttpServletRequest request, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.setViewName("serviceCenter/aboutUs");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	// 고객센터
	@RequestMapping(value = "/serviceCenter", method = RequestMethod.GET)
	public ModelAndView serviceCenter(HttpServletRequest request, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.setViewName("serviceCenter/serviceCenter");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	// 탈퇴
	@RequestMapping(value = "/out", method = RequestMethod.GET)
	public ModelAndView out(HttpServletRequest request, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.setViewName("serviceCenter/out");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
	// 탈퇴
	@RequestMapping(value = "/outmember", method = RequestMethod.POST)
	public ModelAndView outmember(HttpServletRequest request, ModelAndView mv, TimeLine tl) {
		try {
			tService.outmember(tl);
			tService.deletemember(tl);
			mv.setViewName("redirect:/member/loginPage");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	// Insert Comment
	@ResponseBody
	@RequestMapping(value = "coInsert.do", method = RequestMethod.POST)
	public String insertTimeLineComment(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.insertTimeLineComment(tl));
			job.put("ack", tService.alertLikecowrite(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "coInsertB.do", method = RequestMethod.POST)
	public String insertTimeLineCommentB(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.insertTimeLineCommentB(tl));
			job.put("ack", tService.alertLikecowrite(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "hiddenShowAllCo.do", method = RequestMethod.POST)
	public String hiddenShowAllCo(@RequestParam(name = "t_id") String t_id, ModelAndView mv) {
		JsonObject job = new JsonObject();
		try {
			List<TimeLine> hComment = tService.hiddenShowAllCo(t_id);
			if (CollectionUtils.isEmpty(hComment) == false) {
				JsonArray jsonArr = new Gson().toJsonTree(hComment).getAsJsonArray();
				job.add("hComment", jsonArr);
			} else {
				System.out.println("empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return job.toString();
	}

	@ResponseBody
	@RequestMapping(value = "hiddenShowLike.do", method = RequestMethod.POST)
	public int hiddenShowLike(TimeLine tl) {
		int result = tService.hiddenShowLike(tl);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "pressLike.do", method = RequestMethod.POST)
	public String pressLike(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.pressLike(tl));
			job.put("ack", tService.alertLike(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "pressLikeB.do", method = RequestMethod.POST)
	public String pressLikeB(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.pressLikeB(tl));
			job.put("ack", tService.alertLike(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}
	@ResponseBody
	@RequestMapping(value = "pressLikeco.do", method = RequestMethod.POST)
	public String pressLikeco(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.pressLike(tl));
			job.put("ack", tService.alertLikeco(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "pressLikeBco.do", method = RequestMethod.POST)
	public String pressLikeBco(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.pressLikeB(tl));
			job.put("ack", tService.alertLikeco(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "pressUnLike.do", method = RequestMethod.POST)
	public String pressUnLike(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.pressUnLike(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "pressUnLikeB.do", method = RequestMethod.POST)
	public String pressUnLikeB(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.pressUnLikeB(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "insertFollow.do", method = RequestMethod.POST)
	public String insertFollow(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.insertFollow(tl));
			job.put("ack", tService.alertFollow(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteComment.do", method = RequestMethod.POST)
	public String deleteComment(String b_id) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack3", tService.deleteComment(b_id));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteCommentB.do", method = RequestMethod.POST)
	public String deleteCommentB(String b_id) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack3", tService.deleteCommentB(b_id));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "insertReplyComment.do", method = RequestMethod.POST)
	public String insertReplyComment(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.insertReplyComment(tl));
			job.put("ack", tService.alertLikecowrite(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "insertReplyCommentB.do", method = RequestMethod.POST)
	public String insertReplyCommentB(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.insertReplyCommentB(tl));
			job.put("ack", tService.alertLikecowrite(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "updateComment.do", method = RequestMethod.POST)
	public String updateComment(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.updateComment(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "updateCommentB.do", method = RequestMethod.POST)
	public String updateCommentB(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.updateCommentB(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "countLike.do", method = RequestMethod.POST)
	public int countLike(TimeLine tl) {
		int result = tService.countLike(tl);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "insertReport.do", method = RequestMethod.POST)
	public String insertReport(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.insertReport(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}
	@ResponseBody
	@RequestMapping(value = "insertReportB.do", method = RequestMethod.POST)
	public String insertReportB(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.insertReportB(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "reportchk.do", method = RequestMethod.POST)
	public int reportchk(TimeLine tl) {
		int result = tService.reportchk(tl);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "unfollow.do", method = RequestMethod.POST)
	public String unfollow(TimeLine tl) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.unfollow(tl));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "autocomplete.do", method = RequestMethod.POST)
	public Object autocomplete(@RequestParam(name = "word") String word, ModelAndView mv) {
			List<TimeLine> autoword = new ArrayList<TimeLine>();
			autoword = tService.autocomplete(word);
			
		return autoword;
	}
	
	@ResponseBody
	@RequestMapping(value = "showHashTag.do", method = RequestMethod.POST)
	public String showHashTag(@RequestParam(name = "t_id") String t_id, ModelAndView mv) {
		JsonObject job = new JsonObject();
		try {
			List<TimeLine> hashtag = tService.showHashTag(t_id);
			if (CollectionUtils.isEmpty(hashtag) == false) {
				JsonArray jsonArr = new Gson().toJsonTree(hashtag).getAsJsonArray();
				job.add("hashtag", jsonArr);
			} else {
				System.out.println("empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return job.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "showMemberType.do", method = RequestMethod.POST)
	public String showMemberType(String m_id) {
		String result = tService.showMemberType(m_id);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "chkpwd.do", method = RequestMethod.POST)
	public int chkpwd(TimeLine tl) {
		int result = tService.chkpwd(tl);
		try {
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "turny.do", method = RequestMethod.POST)
	public String turny(String m_id) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", tService.turny(m_id));
			System.out.println("turny 아이디는 : "+m_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}
	
}
