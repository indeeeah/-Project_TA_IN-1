package com.project.tain.businessmembermanage.model.vo;

public class bCateVO {
	private String c_name;
	private String m_id;
	
	public bCateVO() {
	}
	
	public bCateVO(String c_name, String m_id) {
		super();
		this.c_name = c_name;
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "bCateVO [c_name=" + c_name + ", m_id=" + m_id + "]";
	}

	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
}