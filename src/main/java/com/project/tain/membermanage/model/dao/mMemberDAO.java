package com.project.tain.membermanage.model.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.membermanage.model.vo.mMemberVO;

@Repository("mMemberDAO")
public class mMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public mMemberVO showProfile(String m_id){
		return sqlSession.selectOne("mMemberVO.showProfile", m_id);
	}
	
	public mMemberVO checkEmail(String m_email){
		return sqlSession.selectOne("mMemberVO.checkEmail", m_email);
	}
	
	public int updateProfile(mMemberVO mvo) {
		return sqlSession.update("mMemberVO.updateProfile", mvo);
	}
}
