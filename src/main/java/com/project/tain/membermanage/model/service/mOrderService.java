package com.project.tain.membermanage.model.service;

import java.util.List;

import com.project.tain.membermanage.model.vo.mOrderVO;

public interface mOrderService {
	public List<mOrderVO> showOrderList(String m_id);
	public int insertOrder(mOrderVO ovo);
}
