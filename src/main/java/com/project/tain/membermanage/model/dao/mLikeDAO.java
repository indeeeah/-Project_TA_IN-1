package com.project.tain.membermanage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.membermanage.model.vo.mLikeVO;

@Repository("mLikeDAO")
public class mLikeDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<mLikeVO> showLike(String m_id) {
		return sqlSession.selectList("mLikeVO.showLike", m_id);
	}
}
