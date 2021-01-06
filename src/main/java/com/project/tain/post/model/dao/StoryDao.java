package com.project.tain.post.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.post.model.domain.Story;

@Repository("yDao")
public class StoryDao {
	@Autowired
	private SqlSession sqlSession;

	public int storyInsert(Story st) {
		return sqlSession.insert("Story.storyInsert", st);
	}
	
	public List<Story> showMyStory(String m_id){
		return sqlSession.selectList("Story.showMyStory", m_id);
	}
	
	public int deleteStory(Story st) {
		return sqlSession.delete("Story.deleteStory", st);
	}

}
