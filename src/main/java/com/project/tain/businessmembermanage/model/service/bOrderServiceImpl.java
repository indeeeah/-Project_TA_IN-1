package com.project.tain.businessmembermanage.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.businessmembermanage.model.dao.bOrderDAO;
import com.project.tain.businessmembermanage.model.vo.bOrderVO;

@Service("boService")
public class bOrderServiceImpl implements bOrderService{
	@Autowired
	private bOrderDAO bOrderDao;

	@Override
	public List<bOrderVO> manageOrderList(String m_id, Date startdate, Date enddate) {
		return bOrderDao.manageOrderList(m_id, startdate, enddate);
	}

	@Override
	public int updateOrderStatus(String od_status, String od_id) {
		return bOrderDao.updateOrderStatus(od_status, od_id);
	}

}
