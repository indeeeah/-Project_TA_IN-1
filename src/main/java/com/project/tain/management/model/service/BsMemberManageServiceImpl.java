package com.project.tain.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.management.model.dao.BsMemberManageDao;
import com.project.tain.management.model.domain.BsMemberManage;

@Service("bsmmService")
public class BsMemberManageServiceImpl implements BsMemberManageService{

	@Autowired
	private BsMemberManageDao bsmmDao;
	
	@Override
	public int totalCount() {
		return bsmmDao.listCount();
	}

	@Override
	public BsMemberManage selectOne(String m_id) {
		return bsmmDao.selectOne(m_id);
	}

	@Override
	public List<BsMemberManage> searchList(String keyword) {
		return bsmmDao.searchList(keyword);
	}

	@Override
	public List<BsMemberManage> selectList(int startPage, int limit) {
		return bsmmDao.selectList(startPage, limit);
	}

	@Override
	public BsMemberManage updateBsMmanage(BsMemberManage bsm) {
		int result = bsmmDao.updateBsMmanage(bsm);
		if (result > 0) {
			bsm = bsmmDao.selectOne(bsm.getM_id());
		} else {
			bsm = null;
		}
		return bsm;
	}

	@Override
	public void deleteBsMmanage(String m_id) {
		bsmmDao.deleteBsMmanage(m_id);
	}

}


