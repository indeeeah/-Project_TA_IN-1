package com.project.tain.membermanage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.membermanage.model.dao.mCartDAO;
import com.project.tain.membermanage.model.vo.mCartVO;

@Service("cService")
public class mCartServiceImpl implements mCartService {
	@Autowired
	private mCartDAO mCartDao;
	
	@Override
	public List<mCartVO> showCart(String m_id) {
		return mCartDao.showCart(m_id);
	}
	
	@Override
	public mCartVO showOrder(String m_id, String bb_id) {
		return mCartDao.showOrder(m_id, bb_id);
	}

	@Override
	public int deleteCart(String bb_id) {
		return mCartDao.deleteCart(bb_id);
	}

	@Override
	public String showOrderImg(String bb_id) {
		return mCartDao.showOrderImg(bb_id);
	}
}
