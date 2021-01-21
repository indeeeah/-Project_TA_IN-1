package com.project.tain.businessmembermanage.model.service;

import java.util.List;

import com.project.tain.businessmembermanage.model.vo.bAdVO;

public interface bAdService {
	public List<bAdVO> showbAd(String m_id);
	public int insertbAd(bAdVO bvo);
	public int deletebAd(String s_id);
}
