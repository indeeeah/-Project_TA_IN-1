package com.project.tain.timeline.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.timeline.model.domain.TimeLine;

@Repository("tDao")
public class TimeLineDao {

	@Autowired
	private SqlSession sqlSession;

	public TimeLine showMyProf(String m_id) {
		return sqlSession.selectOne("TimeLine.showMyProf", m_id);
	}

	public List<TimeLine> showStoryList(String m_id) {
		return sqlSession.selectList("TimeLine.showStoryList", m_id);
	}

	public List<TimeLine> showTimeLineList(String m_id) {
		return sqlSession.selectList("TimeLine.showTimeLineList", m_id);
	}

	public int insertTimeLineComment(TimeLine tl) {
		System.out.println(tl);
		return sqlSession.insert("TimeLine.insertTimeLineComment", tl);
	}

	public int insertTimeLineCommentB(TimeLine tl) {
		System.out.println(tl);
		return sqlSession.insert("TimeLine.insertTimeLineCommentB", tl);
	}

	public List<TimeLine> hiddenShowAllCo(String t_id) {
		return sqlSession.selectList("TimeLine.hiddenShowAllCo", t_id);
	}

	public List<TimeLine> hiddenShowAllCoB(String t_id) {
		return sqlSession.selectList("TimeLine.hiddenShowAllCoB", t_id);
	}

	public int hiddenShowLike(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.hiddenShowLike", tl);
	}

	public int hiddenShowLikeB(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.hiddenShowLikeB", tl);
	}

	public int pressLike(TimeLine tl) {
		return sqlSession.insert("TimeLine.pressLike", tl);
	}

	public int pressLikeB(TimeLine tl) {
		return sqlSession.insert("TimeLine.pressLikeB", tl);
	}

	public int pressUnLike(TimeLine tl) {
		return sqlSession.delete("TimeLine.pressUnLike", tl);
	}

	public int pressUnLikeB(TimeLine tl) {
		return sqlSession.delete("TimeLine.pressUnLikeB", tl);
	}

	public int hiddenCShowLike(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.hiddenCShowLike", tl);
	}

	public int hiddenCShowLikeB(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.hiddenCShowLikeB", tl);
	}

	public List<TimeLine> recomFollow(String m_id) {
		return sqlSession.selectList("TimeLine.recomFollow", m_id);
	}

	public int insertFollow(TimeLine tl) {
		return sqlSession.insert("TimeLine.insertFollow", tl);
	}

	public int deleteComment(String b_id) {
		return sqlSession.delete("TimeLine.deleteComment", b_id);
	}

	public int deleteCommentl(String b_id) {
		return sqlSession.delete("TimeLine.deleteCommentl", b_id);
	}

	public int deleteCommentt(String b_id) {
		return sqlSession.delete("TimeLine.deleteCommentt", b_id);
	}

	public int deleteCommentB(String b_id) {
		return sqlSession.delete("TimeLine.deleteCommentB", b_id);
	}

	public int deleteCommentlB(String b_id) {
		return sqlSession.delete("TimeLine.deleteCommentlB", b_id);
	}

	public int deleteCommenttB(String b_id) {
		return sqlSession.delete("TimeLine.deleteCommenttB", b_id);
	}

	public int insertReplyComment(TimeLine tl) {
		System.out.println(tl);
		return sqlSession.insert("TimeLine.insertReplyComment", tl);
	}

	public int insertReplyCommentB(TimeLine tl) {
		System.out.println(tl);
		return sqlSession.insert("TimeLine.insertReplyCommentB", tl);
	}

	public int updateComment(TimeLine tl) {
		System.out.println(tl);
		return sqlSession.insert("TimeLine.updateComment", tl);
	}

	public int updateCommentB(TimeLine tl) {
		System.out.println(tl);
		return sqlSession.insert("TimeLine.updateCommentB", tl);
	}
	
	public int countLike(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.countLike", tl);
	}
	public int countLikeB(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.countLikeB", tl);
	}

}
