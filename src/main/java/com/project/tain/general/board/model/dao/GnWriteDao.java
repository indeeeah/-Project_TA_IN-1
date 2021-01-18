package com.project.tain.general.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.general.board.model.domain.GnWrite;

@Repository("gwDao")
public class GnWriteDao {

	@Autowired
	private SqlSession sqlSession;

	public int chkseq() {
		return sqlSession.selectOne("GnWrite.chkseq");
	}

	public int insertboard(GnWrite gw) {
		return sqlSession.insert("GnWrite.insertboard", gw);
	}

	public int insertboardimg(GnWrite gw) {
		return sqlSession.insert("GnWrite.insertboardimg", gw);
	}

	public int insertboardhashtag(GnWrite gw) {
		return sqlSession.insert("GnWrite.insertboardhashtag", gw);
	}
}
