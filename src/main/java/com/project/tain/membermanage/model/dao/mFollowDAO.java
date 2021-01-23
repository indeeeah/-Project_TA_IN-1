package com.project.tain.membermanage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.membermanage.model.vo.mFollowVO;

@Repository("mFollowDAO")
public class mFollowDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<mFollowVO> showFollowing(String m_id1, String m_id2) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id1", m_id1);
		map.put("m_id2", m_id2+"%");
		return sqlSession.selectList("mFollowVO.showFollowing", map);
	}
}
