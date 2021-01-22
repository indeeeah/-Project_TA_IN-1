package com.project.tain.membermanage.model.vo;

public class mMessageVO {
	private String m_id;
	private String m_id2;
	private String m_message;
	private String m_date;
	
	public mMessageVO() {
	}
	
	public mMessageVO(String m_id, String m_id2, String m_message, String m_date) {
		super();
		this.m_id = m_id;
		this.m_id2 = m_id2;
		this.m_message = m_message;
		this.m_date = m_date;
	}
	
	@Override
	public String toString() {
		return "mMessageVO [m_id=" + m_id + ", m_id2=" + m_id2 + ", m_message=" + m_message + ", m_date=" + m_date
				+ "]";
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_id2() {
		return m_id2;
	}
	public void setM_id2(String m_id2) {
		this.m_id2 = m_id2;
	}
	public String getM_message() {
		return m_message;
	}
	public void setM_message(String m_message) {
		this.m_message = m_message;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
}
