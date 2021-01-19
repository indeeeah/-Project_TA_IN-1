package com.project.tain.businessmembermanage.model.service;

import com.project.tain.businessmembermanage.model.vo.bMemberVO;

public interface bMemberService {
	public bMemberVO showbMember(String m_id);
	public int updatebMember(bMemberVO bvo);
	public int insertbMember(bMemberVO bvo);
	public int deletebMember(String m_id);
}
