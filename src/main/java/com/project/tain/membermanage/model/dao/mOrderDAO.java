package com.project.tain.membermanage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.membermanage.model.vo.mOrderVO;

@Repository("mOrderDAO")
public class mOrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<mOrderVO> showOrderList(String m_id){
		return sqlSession.selectList("mOrderVO.showOrderList", m_id);
	}
	
	public int insertOrder(mOrderVO ovo) {
		return sqlSession.insert("mOrderVO.insertOrder", ovo);
	}
}
