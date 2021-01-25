package com.project.tain.post.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.post.model.domain.TimeLine;

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

	public int hiddenShowLike(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.hiddenShowLike", tl);
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

	public List<TimeLine> recomFollow(String m_id) {
		return sqlSession.selectList("TimeLine.recomFollow", m_id);
	}

	public int insertFollow(TimeLine tl) {
		return sqlSession.insert("TimeLine.insertFollow", tl);
	}

	public int deleteComment(String b_id) {
		return sqlSession.delete("TimeLine.deleteComment", b_id);
	}

	public int deleteCommentB(String b_id) {
		return sqlSession.delete("TimeLine.deleteCommentB", b_id);
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

	public int insertReport(TimeLine tl) {
		return sqlSession.insert("TimeLine.insertReport", tl);
	}

	public int insertReportB(TimeLine tl) {
		return sqlSession.insert("TimeLine.insertReportB", tl);
	}

	public int reportchk(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.reportchk", tl);
	}

	public int unfollow(TimeLine tl) {
		return sqlSession.delete("TimeLine.unfollow", tl);
	}

	public List<TimeLine> autocomplete(String word) {
		return sqlSession.selectList("TimeLine.autocomplete", word);
	}

	public List<TimeLine> showHashTag(String t_id) {
		return sqlSession.selectList("TimeLine.showHashTag", t_id);
	}

	public List<TimeLine> chkfollow(String m_id) {
		return sqlSession.selectList("TimeLine.chkfollow", m_id);
	}

	public String showMemberType(String m_id) {
		return sqlSession.selectOne("TimeLine.showMemberType", m_id);
	}

	public int chkpwd(TimeLine tl) {
		return sqlSession.selectOne("TimeLine.chkpwd", tl);
	}

	public int outmember(TimeLine tl) {
		return sqlSession.delete("TimeLine.outmember", tl);
	}

	public int deletemember(TimeLine tl) {
		return sqlSession.delete("TimeLine.deletemember", tl);
	}

	public List<TimeLine> showTimeLineListPage(String m_id, int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("TimeLine.showTimeLineList", m_id, row);
	}

	public int timeLineListCount(String my_name) {
		return sqlSession.selectOne("TimeLine.timeLineListCount", my_name);
	}

	public int alertLike(TimeLine tl) {
		return sqlSession.insert("TimeLine.alertLike", tl);
	}

	public int alertLikeco(TimeLine tl) {
		return sqlSession.insert("TimeLine.alertLikeco", tl);
	}

	public int alertLikecowrite(TimeLine tl) {
		return sqlSession.insert("TimeLine.alertLikecowrite", tl);
	}

	public int alertFollow(TimeLine tl) {
		return sqlSession.insert("TimeLine.alertFollow", tl);
	}

	public List<TimeLine> forRegChart(TimeLine tl) {
		System.out.println(sqlSession.selectList("TimeLine.forRegChart", tl));
		return sqlSession.selectList("TimeLine.forRegChart", tl);
	}

	public List<TimeLine> forLikeChart(TimeLine tl) {
		return sqlSession.selectList("TimeLine.forLikeChart", tl);
	}

	public int alarmcheck(String my_name) {
		return sqlSession.selectOne("TimeLine.alarmcheck", my_name);
	}

	public int turny(String m_id) {
		return sqlSession.update("TimeLine.turny", m_id);
	}

	public List<TimeLine> shownotice(String my_name) {
		return sqlSession.selectList("TimeLine.shownotice", my_name);
	}

}
