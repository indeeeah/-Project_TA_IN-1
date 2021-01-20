package com.project.tain.post.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.post.model.domain.SearchList;

@Repository("sDao")
public class SearchListDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<SearchList> showHashTag(String hashtag){
		return sqlSession.selectList("SearchList.showHashTag", hashtag);
	}

	public int showHashTagCount(String hashtag) {
		return sqlSession.selectOne("SearchList.showHashTagCount", hashtag);
	}

	public List<SearchList> showHashTagPage(String hashtag, int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("SearchList.showHashTag", hashtag, row);
	}
}
