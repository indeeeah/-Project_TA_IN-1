package com.project.tain.membermanage.model.service;

import com.project.tain.membermanage.model.vo.mMemberVO;

public interface mMemberService {
	public mMemberVO showProfile(String m_id);
	public mMemberVO checkEmail(String m_email);
	public int updateProfile(mMemberVO mvo);
	public int updateProfileImg(String m_id, String m_img);
	public int changepw(String m_id, String m_pw);
}
