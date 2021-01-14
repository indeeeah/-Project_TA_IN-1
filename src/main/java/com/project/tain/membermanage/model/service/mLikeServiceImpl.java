package com.project.tain.membermanage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.membermanage.model.dao.mLikeDAO;
import com.project.tain.membermanage.model.vo.mLikeVO;

@Service("lService")
public class mLikeServiceImpl implements mLikeService {
	@Autowired
	private mLikeDAO mLikeDao;
	
	@Override
	public List<mLikeVO> showLike(String m_id) {
		return mLikeDao.showLike(m_id);
	}

}
