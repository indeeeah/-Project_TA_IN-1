package com.project.tain.businessmembermanage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.businessmembermanage.model.dao.bCateDAO;
import com.project.tain.businessmembermanage.model.vo.bCateVO;

@Service("bcaService")
public class bCateServiceImpl implements bCateService{
	@Autowired
	bCateDAO bCateDao;
	
	@Override
	public List<bCateVO> showbCate(String m_id) {
		return bCateDao.showbCate(m_id);
	}

	@Override
	public int insertbCate(bCateVO bvo) {
		return bCateDao.insertbCate(bvo);
	}

	@Override
	public int deletebCate(bCateVO bvo) {
		return bCateDao.deletebCate(bvo);
	}

}
