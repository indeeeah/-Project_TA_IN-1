package com.project.tain.membermanage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.membermanage.model.vo.mFollowInfoVO;
import com.project.tain.membermanage.model.vo.mFollowVO;

@Repository("mFollowDAO")
public class mFollowDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<mFollowInfoVO> showFollowing(String m_id) {
		return sqlSession.selectList("mFollowVO.showFollowing", m_id);
	}
	
	public List<mFollowInfoVO> showFollower(String m_id) {
		return sqlSession.selectList("mFollowVO.showFollower", m_id);
	}
}
