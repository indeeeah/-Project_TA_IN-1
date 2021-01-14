package com.project.tain.membermanage.model.service;

import java.util.List;

import com.project.tain.membermanage.model.vo.mFollowInfoVO;
import com.project.tain.membermanage.model.vo.mFollowVO;

public interface mFollowService {
	public List<mFollowInfoVO> showFollowing(String m_id);
	public List<mFollowInfoVO> showFollower(String m_id);
}
