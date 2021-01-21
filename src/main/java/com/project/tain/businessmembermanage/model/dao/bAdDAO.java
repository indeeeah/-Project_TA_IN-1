package com.project.tain.businessmembermanage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.businessmembermanage.model.vo.bAdVO;

@Repository("bAdDAO")
public class bAdDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<bAdVO> showbAd(String m_id) {
		return sqlSession.selectList("bAdVO.showbAd", m_id);
	}
	
	public int insertbAd(bAdVO bvo) {
		return sqlSession.insert("bAdVO.insertbAd", bvo);
	}
	
	public int deletebAd(String s_id) {
		return sqlSession.delete("bAdVO.deletebAd", s_id);
	}
}
