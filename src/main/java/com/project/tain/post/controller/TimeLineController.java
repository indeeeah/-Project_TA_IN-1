package com.project.tain.post.controller;

import java.util.ArrayList;
import java.util.List;


import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(value = "/test.do")
	public String testForm(ModelAndView mv) {
		return "test";
	}
	
	

	// TimeLine Page
	@RequestMapping(value = "/timeLine", method = RequestMethod.GET)
	public ModelAndView TimeLineList(@RequestParam(name = "m_id", required = false) String m_id, ModelAndView mv) {
		try {
			mv.addObject("myProfile", tService.showMyProf(m_id));
			mv.addObject("storyList", tService.showStoryList(m_id));
			mv.addObject("timeLineList", tService.showTimeLineList(m_id));
			mv.addObject("recomFollow", tService.recomFollow(m_id));
			mv.setViewName("post/timeline");
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
			job.put("ack", tService.deleteCommentl(b_id));
			job.put("ack2", tService.deleteCommentt(b_id));
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
			job.put("ack", tService.deleteCommentlB(b_id));
			job.put("ack2", tService.deleteCommenttB(b_id));
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
}
