package com.project.tain.membermanage.model.vo;

import java.sql.Date;

public class mFollowVO {
	private String m_id2;

	
	
	
	public mFollowVO() {
	}

	public mFollowVO(String m_id1, String m_id2, Date f_date) {
		super();
		this.m_id2 = m_id2;
	}
	
	
	@Override
	public String toString() {
		return "mFollowVO [m_id2=" + m_id2 + "]";
	}

	public String getM_id2() {
		return m_id2;
	}
	public void setM_id2(String m_id2) {
		this.m_id2 = m_id2;
	}
}
