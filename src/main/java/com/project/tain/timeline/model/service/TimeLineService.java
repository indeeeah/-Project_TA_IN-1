package com.project.tain.timeline.model.service;

import java.util.List;

import com.project.tain.timeline.model.domain.TimeLine;

public interface TimeLineService {

	TimeLine showMyProf(String m_id);

	List<TimeLine> showStoryList(String m_id);

	List<TimeLine> showTimeLineList(String m_id);

	int insertTimeLineComment(TimeLine tl);

	int insertTimeLineCommentB(TimeLine tl);

	List<TimeLine> hiddenShowAllCo(String t_id);

	List<TimeLine> hiddenShowAllCoB(String t_id);

	int hiddenShowLike(TimeLine tl);

	int hiddenShowLikeB(TimeLine tl);

	int pressLike(TimeLine tl);

	int pressLikeB(TimeLine tl);

	int pressUnLike(TimeLine tl);

	int pressUnLikeB(TimeLine tl);

	int hiddenCShowLike(TimeLine tl);

	int hiddenCShowLikeB(TimeLine tl);

	List<TimeLine> recomFollow(String m_id);

	int insertFollow(TimeLine tl);

	int deleteComment(String b_id);

	int deleteCommentl(String b_id);

	int deleteCommentt(String b_id);

	int deleteCommentB(String b_id);

	int deleteCommentlB(String b_id);

	int deleteCommenttB(String b_id);

	int insertReplyComment(TimeLine tl);

	int insertReplyCommentB(TimeLine tl);

	int updateComment(TimeLine tl);

	int updateCommentB(TimeLine tl);
	
	int countLike(TimeLine tl);
	int countLikeB(TimeLine tl);


}
