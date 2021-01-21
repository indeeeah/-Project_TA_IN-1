package com.project.tain.businessmembermanage.model.vo;

import java.sql.Date;

public class bAdVO {
	private	String s_id;
	private	String m_id;
	private	String s_img;
	private	Date s_date;
	private	String s_link;
	private	char s_type;
	
	public bAdVO() {
	}
	
	public bAdVO(String s_id, String m_id, String s_img, Date s_date, String s_link, char s_type) {
		super();
		this.s_id = s_id;
		this.m_id = m_id;
		this.s_img = s_img;
		this.s_date = s_date;
		this.s_link = s_link;
		this.s_type = s_type;
	}

	@Override
	public String toString() {
		return "bAdVO [s_id=" + s_id + ", m_id=" + m_id + ", s_img=" + s_img + ", s_date=" + s_date + ", s_link="
				+ s_link + ", s_type=" + s_type + "]";
	}

	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getS_img() {
		return s_img;
	}
	public void setS_img(String s_img) {
		this.s_img = s_img;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public String getS_link() {
		return s_link;
	}
	public void setS_link(String s_link) {
		this.s_link = s_link;
	}
	public char getS_type() {
		return s_type;
	}
	public void setS_type(char s_type) {
		this.s_type = s_type;
	}
}
