package com.project.tain.membermanage.model.vo;

import java.sql.Date;

public class mFollowVO {
	private String m_id1;
	private String m_id2;
	private Date f_date;
	
	
	
	public mFollowVO() {
	}

	public mFollowVO(String m_id1, String m_id2, Date f_date) {
		super();
		this.m_id1 = m_id1;
		this.m_id2 = m_id2;
		this.f_date = f_date;
	}
	
	
	@Override
	public String toString() {
		return "mFollowVO [m_id1=" + m_id1 + ", m_id2=" + m_id2 + ", f_date=" + f_date + "]";
	}

	public String getM_id1() {
		return m_id1;
	}
	public void setM_id1(String m_id1) {
		this.m_id1 = m_id1;
	}
	public String getM_id2() {
		return m_id2;
	}
	public void setM_id2(String m_id2) {
		this.m_id2 = m_id2;
	}
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
}
