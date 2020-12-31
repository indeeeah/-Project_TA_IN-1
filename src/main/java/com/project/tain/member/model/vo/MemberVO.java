package com.project.tain.member.model.vo;

import java.sql.Date;

public class MemberVO {
	private	String m_id;
	private String m_pw;
	private String m_name;
	private String m_intro;
	private String m_email;
	private int m_addr1;
	private String m_addr2;
	private String m_addr3;
	private String m_phone;
	private Date m_birth;
	private String m_img;
	private char m_usage;
	private int m_status;
	private int m_activity;
	private Date m_lastact;
	private char m_language;
	private Date m_joindate;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(int m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_addr3() {
		return m_addr3;
	}
	public void setM_addr3(String m_addr3) {
		this.m_addr3 = m_addr3;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public Date getM_birth() {
		return m_birth;
	}
	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public char getM_usage() {
		return m_usage;
	}
	public void setM_usage(char m_usage) {
		this.m_usage = m_usage;
	}
	public int getM_status() {
		return m_status;
	}
	public void setM_status(int m_status) {
		this.m_status = m_status;
	}
	public int getM_activity() {
		return m_activity;
	}
	public void setM_activity(int m_activity) {
		this.m_activity = m_activity;
	}
	public Date getM_lastact() {
		return m_lastact;
	}
	public void setM_lastact(Date m_lastact) {
		this.m_lastact = m_lastact;
	}
	public char getM_language() {
		return m_language;
	}
	public void setM_language(char m_language) {
		this.m_language = m_language;
	}
	public Date getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}
}
