package com.project.tain.management.model.domain;

import java.sql.Date;

public class ReportAllManage implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String m_id1;
	private String m_id2;
	private String rm_reason;
	private Date rm_date;
	
	private String m_id;
	private String bb_id;
	private String rbb_reason;
	private Date rbb_date;
	
	private String b_id;
	private String rb_reason;
	private Date rb_date;
	
	public ReportAllManage() {
		
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

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getBb_id() {
		return bb_id;
	}

	public void setBb_id(String bb_id) {
		this.bb_id = bb_id;
	}

	public String getRbb_reason() {
		return rbb_reason;
	}

	public void setRbb_reason(String rbb_reason) {
		this.rbb_reason = rbb_reason;
	}

	public Date getRbb_date() {
		return rbb_date;
	}

	public void setRbb_date(Date rbb_date) {
		this.rbb_date = rbb_date;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getRb_reason() {
		return rb_reason;
	}

	public void setRb_reason(String rb_reason) {
		this.rb_reason = rb_reason;
	}

	public Date getRb_date() {
		return rb_date;
	}

	public void setRb_date(Date rb_date) {
		this.rb_date = rb_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
