package com.project.tain.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.post.model.dao.StoryDao;
import com.project.tain.post.model.domain.Story;

@Service("yService")
public class StoryImpl implements StoryService {
	@Autowired
	private StoryDao sDao;

	@Override
	public void storyInsert(Story st) {
		sDao.storyInsert(st);
	}

	@Override
	public List<Story> showMyStory(String m_id) {
		return sDao.showMyStory(m_id);
	}

	@Override
	public int deleteStory(Story st) {
		return sDao.deleteStory(st);
	}

}
