package com.project.tain.membermanage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.membermanage.model.dao.mFollowDAO;
import com.project.tain.membermanage.model.vo.mFollowInfoVO;
import com.project.tain.membermanage.model.vo.mFollowVO;

@Service("fService")
public class mFollowServiceImpl implements mFollowService {
	@Autowired
	private mFollowDAO mfollowDao;

	@Override
	public List<mFollowInfoVO> showFollowing(String m_id) {
		return mfollowDao.showFollowing(m_id);
	}

	@Override
	public List<mFollowInfoVO> showFollower(String m_id) {
		return mfollowDao.showFollower(m_id);
	}
}
