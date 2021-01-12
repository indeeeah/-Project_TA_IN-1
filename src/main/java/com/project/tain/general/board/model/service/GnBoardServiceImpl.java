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
}
