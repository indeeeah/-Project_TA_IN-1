package com.project.tain.general.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.general.board.model.dao.GnBoardDao;
import com.project.tain.general.board.model.domain.GnBoard;

@Service("gService")
public class GnBoardServiceImpl implements GnBoardService {

	@Autowired
	private GnBoardDao gDao;

	@Override
	public GnBoard showp_one(String m_id) {
		return gDao.showp_one(m_id);
	}

	@Override
	public GnBoard showp_two(String m_id) {
		// TODO Auto-generated method stub
		return gDao.showp_two(m_id);
	}

	@Override
	public GnBoard showp_three(String m_id) {
		// TODO Auto-generated method stub
		return gDao.showp_three(m_id);
	}

	@Override
	public GnBoard showp_four(String m_id) {
		return gDao.showp_four(m_id);
	}

	@Override
	public GnBoard storychk(String m_id) {
		return gDao.storychk(m_id);
	}

	@Override
	public List<GnBoard> showpost(String m_id) {
		return gDao.showpost(m_id);
	}

	@Override
	public List<GnBoard> highlight(String m_id) {
		return gDao.highlight(m_id);
	}

	@Override
	public GnBoard followchk(String my_name, String m_id) {
		return gDao.followchk(my_name, m_id);
	}

	@Override
	public GnBoard showeachpost(String b_id) {
		return gDao.showeachpost(b_id);
	}

	@Override
	public List<GnBoard> recomFow(String my_name, String m_id) {
		return gDao.recomFow(my_name, m_id);
	}

	@Override
	public int chkReportMember(GnBoard gb) {
		return gDao.chkReportMember(gb);
	}

	@Override
	public int insertReportMember(GnBoard gb) {
		return gDao.insertReportMember(gb);
	}

	@Override
	public String userType(String m_id) {
		return gDao.userType(m_id);
	}

	@Override
	public List<GnBoard> selectFollow(String m_id) {
		return gDao.selectFollow(m_id);
	}

	@Override
	public List<GnBoard> selectFollower(String m_id) {
		return gDao.selectFollower(m_id);
	}

	@Override
	public GnBoard selectEachPost(String b_id) {
		return gDao.selectEachPost(b_id);
	}

	@Override
	public List<GnBoard> selectEachPostComments(String b_id) {
		return gDao.selectEachPostComments(b_id);
	}

	@Override
	public String selectEachPostPhotos(String b_id) {
		return gDao.selectEachPostPhotos(b_id);
	}

	@Override
	public int showpostCount(String m_id) {
		return gDao.showpostCount(m_id);
	}

	@Override
	public List<GnBoard> showpostPage(String m_id, int startPage, int limit) {
		return gDao.showpostPage(m_id, startPage, limit);
	}

}
