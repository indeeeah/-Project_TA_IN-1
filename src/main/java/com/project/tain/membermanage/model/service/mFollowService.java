package com.project.tain.membermanage.model.service;

import java.util.List;

import com.project.tain.membermanage.model.vo.mFollowInfoVO;
import com.project.tain.membermanage.model.vo.mFollowVO;

public interface mFollowService {
	public List<mFollowVO> showFollowing(String m_id, String m_id2);
}
