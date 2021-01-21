package com.project.tain.businessmembermanage.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.businessmembermanage.model.vo.bOrderVO;

@Repository("bOrderDAO")
public class bOrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<bOrderVO> manageOrderList(String m_id, Date startdate, Date enddate){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		return sqlSession.selectList("bOrderVO.manageOrderList", map);
	}
	
	public int updateOrderStatus(String od_status, String od_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("od_status", od_status);
		map.put("od_id", od_id);
		return sqlSession.update("bOrderVO.updateOrderStatus", map);
	}
}
