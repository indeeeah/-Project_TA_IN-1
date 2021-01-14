package com.project.tain.membermanage.model.dao;


import java.util.HashMap;
import java.util.Map;

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

	public int updateProfileImg(String m_id, String m_img) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_img", m_img);
		return sqlSession.update("mMemberVO.updateProfileImg", map);
	}
	
	public int changepw(String m_id, String m_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		return sqlSession.update("mMemberVO.changepw", map);
	}
}
