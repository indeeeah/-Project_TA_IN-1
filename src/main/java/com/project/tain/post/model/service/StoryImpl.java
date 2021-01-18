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

	@Override
	public Story showAllStory(String m_id) {
		return sDao.showAllStory(m_id);
	}
	@Override
	public Story showAllAStory() {
		return sDao.showAllAStory();
	}

	@Override
	public List<Story> storyResult(Story st) {
		return sDao.storyResult(st);
	}
	
	@Override
	public List<Story> eachStory(String id) {
		return sDao.eachStory(id);
	}

	@Override
	public int insertHighlight(Story st) {
		return sDao.insertHighlight(st);
	}

	@Override
	public List<Story> selectHighlight(String my_name) {
		return sDao.selectHighlight(my_name);
	}

	@Override
	public int deleteHname(Story st) {
		return sDao.deleteHname(st);
	}

	@Override
	public int deleteh(Story st) {
		return sDao.deleteh(st);
	}

	@Override
	public List<Story> selectEachHighlight(Story st) {
		return sDao.selectEachHighlight(st);
	}

}
