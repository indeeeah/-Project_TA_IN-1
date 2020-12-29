package com.project.tain.timeline.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.timeline.model.dao.TimeLineDao;
import com.project.tain.timeline.model.domain.TimeLine;

@Service("tService")
public class TimeLineServiceImpl implements TimeLineService {

	@Autowired
	private TimeLineDao tDao;

	@Override
	public TimeLine showMyProf(String m_id) {
		return tDao.showMyProf(m_id);
	}

	@Override
	public List<TimeLine> showStoryList(String m_id) {
		return tDao.showStoryList(m_id);
	}

	@Override
	public List<TimeLine> showTimeLineList(String m_id) {
		return tDao.showTimeLineList(m_id);
	}

	@Override
	public int insertTimeLineComment(TimeLine tl) {
		return tDao.insertTimeLineComment(tl);
	}

	@Override
	public int insertTimeLineCommentB(TimeLine tl) {
		return tDao.insertTimeLineCommentB(tl);
	}

	@Override
	public List<TimeLine> hiddenShowAllCo(String t_id) {
		return tDao.hiddenShowAllCo(t_id);
	}

	@Override
	public List<TimeLine> hiddenShowAllCoB(String t_id) {
		return tDao.hiddenShowAllCoB(t_id);
	}

	@Override
	public int hiddenShowLike(TimeLine tl) {
		return tDao.hiddenShowLike(tl);
	}

	@Override
	public int hiddenShowLikeB(TimeLine tl) {
		return tDao.hiddenShowLikeB(tl);
	}

	@Override
	public int pressLike(TimeLine tl) {
		return tDao.pressLike(tl);
	}
	@Override
	public int pressLikeB(TimeLine tl) {
		return tDao.pressLikeB(tl);
	}

	@Override
	public int pressUnLike(TimeLine tl) {
		return tDao.pressUnLike(tl);
	}

	@Override
	public int pressUnLikeB(TimeLine tl) {
		return tDao.pressUnLikeB(tl);
	}

	@Override
	public int hiddenCShowLike(TimeLine tl) {
		return tDao.hiddenCShowLike(tl);
	}

	@Override
	public int hiddenCShowLikeB(TimeLine tl) {
		return tDao.hiddenCShowLikeB(tl);
	}

	@Override
	public List<TimeLine> recomFollow(String m_id) {
		return tDao.recomFollow(m_id);
	}

	@Override
	public int insertFollow(TimeLine tl) {
		return tDao.insertFollow(tl);
	}

	@Override
	public int deleteComment(String b_id) {
		return tDao.deleteComment(b_id);
	}
	@Override
	public int deleteCommentl(String b_id) {
		return tDao.deleteCommentl(b_id);
	}
	@Override
	public int deleteCommentt(String b_id) {
		return tDao.deleteCommentt(b_id);
	}
	
}
