package com.project.tain.general.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.general.board.model.domain.GnBoard;

@Repository("gDao")
public class GnBoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public GnBoard showp_one(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_one", m_id);
	}
	public GnBoard showp_two(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_two", m_id);
	}
	public GnBoard showp_three(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_three", m_id);
	}
	public GnBoard showp_four(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_four", m_id);
	}
	public GnBoard storychk(String m_id) {
		return sqlSession.selectOne("GnBoard.storychk", m_id);
	}
	
	public List<GnBoard> showpost(String m_id){
		return sqlSession.selectList("GnBoard.showpost", m_id);
	}
}
