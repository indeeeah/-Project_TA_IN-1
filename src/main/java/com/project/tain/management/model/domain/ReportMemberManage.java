package com.project.tain.management.model.domain;

import java.sql.Date;

public class ReportMemberManage implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String m_id1;
	private String m_id2;
	private String rm_reason;
	private Date rm_date;
	
	public ReportMemberManage() {
		
	}

	public ReportMemberManage(String m_id1, String m_id2, String rm_reason, Date rm_date) {
		super();
		this.m_id1 = m_id1;
		this.m_id2 = m_id2;
		this.rm_reason = rm_reason;
		this.rm_date = rm_date;
	}

	@Override
	public String toString() {
		return "ReportMemberManage [m_id1=" + m_id1 + ", m_id2=" + m_id2 + ", rm_reason=" + rm_reason + ", rm_date="
				+ rm_date + "]";
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

	public String getRm_reason() {
		return rm_reason;
	}

	public void setRm_reason(String rm_reason) {
		this.rm_reason = rm_reason;
	}

	public Date getRm_date() {
		return rm_date;
	}

	public void setRm_date(Date rm_date) {
		this.rm_date = rm_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
