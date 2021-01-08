package com.project.tain.membermanage.model.service;

import java.util.List;

import com.project.tain.membermanage.model.vo.mMemberVO;

public interface mMemberService {
	public mMemberVO showProfile(String m_id);
	public mMemberVO checkEmail(String m_email);
	public int updateProfile(mMemberVO mvo);
}
