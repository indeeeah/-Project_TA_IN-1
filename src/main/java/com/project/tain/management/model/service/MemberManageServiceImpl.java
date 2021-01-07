package com.project.tain.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.management.model.dao.MemberManageDao;
import com.project.tain.management.model.domain.MemberManage;

@Service("mmService")
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private MemberManageDao mmDao;
	
	@Override
	public int totalCount() {
		return mmDao.listCount();
	}

	@Override
	public MemberManage selectOne(String m_id) {
		return mmDao.selectOne(m_id);
	}

	@Override
	public List<MemberManage> searchList(String keyword) {
		return mmDao.searchList(keyword);
	}

	@Override
	public List<MemberManage> selectList(int startPage, int limit) {
		return mmDao.selectList(startPage, limit);
	}

	@Override
	public MemberManage updateMmanage(MemberManage m) {
		int result = mmDao.updateMmanage(m);
		if (result > 0) {
			m = mmDao.selectOne(m.getM_id());
		} else {
			m = null;
		}
		return m;
		
	}

	@Override
	public void deleteMmanage(String m_id) {
		mmDao.deleteMmanage(m_id);
	}

}
