package com.project.tain.businessmembermanage.model.service;

import java.util.List;

import com.project.tain.businessmembermanage.model.vo.bCateVO;

public interface bCateService {
	public List<bCateVO> showbCate(String m_id);
	public int insertbCate(bCateVO bvo);
	public int deletebCate(bCateVO bvo);
}
