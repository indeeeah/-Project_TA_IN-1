package com.project.tain.businessmembermanage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.businessmembermanage.model.vo.bMemberVO;

@Repository("bMemberDAO")
public class bMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public bMemberVO showbMember(String m_id) {
		return sqlSession.selectOne("bMemberVO.showbMember", m_id);
	}
	
	public int updatebMember(bMemberVO bvo) {
		return sqlSession.update("bMemberVO.updatebMember", bvo);
	}
	
	public int insertbMember(bMemberVO bvo) {
		return sqlSession.insert("bMemberVO.insertbMember", bvo);
	}

	public int deletebMember(String m_id) {
		return sqlSession.update("bMemberVO.deletebMember", m_id);
	}
}
