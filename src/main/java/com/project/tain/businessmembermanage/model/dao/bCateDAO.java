package com.project.tain.businessmembermanage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.businessmembermanage.model.vo.bCateVO;

@Repository("bCateDAO")
public class bCateDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<bCateVO> showbCate(String m_id){
		return sqlSession.selectList("bCateVO.showbCate",m_id);
	}
	
	public int insertbCate(bCateVO bvo) {
		return sqlSession.insert("bCateVO.insertbCate", bvo);
	}
	
	public int deletebCate(bCateVO bvo) {
		return sqlSession.delete("bCateVO.deletebCate", bvo);
	}
}
