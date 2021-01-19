package com.project.tain.membermanage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.membermanage.model.dao.mOrderDAO;
import com.project.tain.membermanage.model.vo.mOrderVO;

@Service("oService")
public class mOrderServiceImpl implements mOrderService {
	@Autowired
	private mOrderDAO mOrderDao;

	@Override
	public List<mOrderVO> showOrderList(String m_id) {
		return mOrderDao.showOrderList(m_id);
	}

	@Override
	public int insertOrder(mOrderVO ovo) {
		return mOrderDao.insertOrder(ovo);
	}
}
