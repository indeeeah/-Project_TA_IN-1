package com.project.tain.businessmembermanage.model.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.tain.businessmembermanage.model.vo.bOrderVO;

public interface bOrderService {
	public List<bOrderVO> manageOrderList(String m_id, @Param("startdate") Date startdate, @Param("enddate") Date enddate);
	public int updateOrderStatus(String od_status, String od_id);
}
