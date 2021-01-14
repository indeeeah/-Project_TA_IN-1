package com.project.tain.membermanage.model.service;

import java.util.List;

import com.project.tain.membermanage.model.vo.mCartVO;

public interface mCartService {
	public List<mCartVO> showCart(String m_id);
	public mCartVO showOrder(String m_id, String bb_id);
	public int deleteCart(String bb_id);
}
