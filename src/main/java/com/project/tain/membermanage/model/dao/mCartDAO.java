package com.project.tain.membermanage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.membermanage.model.vo.mCartVO;

@Repository("mCartDAO")
public class mCartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<mCartVO> showCart(String m_id) {
		return sqlSession.selectList("mCartVO.showCart", m_id);
	}
	public mCartVO showOrder(String m_id, String bb_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("bb_id", bb_id);
		return sqlSession.selectOne("mCartVO.showOrder", map);
	}
	
	public int deleteCart(String bb_id) {
		return sqlSession.delete("mCartVO.deleteCart", bb_id);
	}
}
