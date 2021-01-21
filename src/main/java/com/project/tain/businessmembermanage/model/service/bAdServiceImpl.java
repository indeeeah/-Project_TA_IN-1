package com.project.tain.businessmembermanage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.businessmembermanage.model.dao.bAdDAO;
import com.project.tain.businessmembermanage.model.vo.bAdVO;

@Service("bAbService")
public class bAdServiceImpl implements bAdService{
	@Autowired
	bAdDAO bAdDao;
	
	@Override
	public List<bAdVO> showbAd(String m_id) {
		return bAdDao.showbAd(m_id);
	}

	@Override
	public int insertbAd(bAdVO bvo) {
		return bAdDao.insertbAd(bvo);
	}

	@Override
	public int deletebAd(String s_id) {
		return bAdDao.deletebAd(s_id);
	}

}
