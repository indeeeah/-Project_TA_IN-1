package com.project.tain.membermanage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.membermanage.model.dao.mMemberDAO;
import com.project.tain.membermanage.model.vo.mMemberVO;

@Service("mService")
public class mMemberServiceImpl implements mMemberService {
	@Autowired
	private mMemberDAO mMemberDao;

	@Override
	public mMemberVO showProfile(String m_id) {
		return mMemberDao.showProfile(m_id);
	}

	@Override
	public int updateProfile(mMemberVO mvo) {
		return mMemberDao.updateProfile(mvo);
	}

	@Override
	public mMemberVO checkEmail(String m_email) {
		return mMemberDao.checkEmail(m_email);
	}
}
