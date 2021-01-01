package com.project.tain.member.model.vo;

import java.sql.Date;

public class MemberRegVO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_usage;
	private String m_language;
	private String m_addr1;
	private String m_addr2;
	private String M_addr3;
	private Date m_birth;
	public MemberRegVO() {
		
	}
	public MemberRegVO(String m_id, String m_pw, String m_name, String m_email, String m_phone, String m_usage,
			String m_language, String m_addr1, String m_addr2, String m_addr3, Date m_birth) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_usage = m_usage;
		this.m_language = m_language;
		this.m_addr1 = m_addr1;
		this.m_addr2 = m_addr2;
		M_addr3 = m_addr3;
		this.m_birth = m_birth;
	}
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
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_usage() {
		return m_usage;
	}
	public void setM_usage(String m_usage) {
		this.m_usage = m_usage;
	}
	public String getM_language() {
		return m_language;
	}
	public void setM_language(String m_language) {
		this.m_language = m_language;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_addr3() {
		return M_addr3;
	}
	public void setM_addr3(String m_addr3) {
		M_addr3 = m_addr3;
	}
	public Date getM_birth() {
		return m_birth;
	}
	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}
	@Override
	public String toString() {
		return "MemberVO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_email=" + m_email
				+ ", m_phone=" + m_phone + ", m_usage=" + m_usage + ", m_language=" + m_language + ", m_addr1="
				+ m_addr1 + ", m_addr2=" + m_addr2 + ", M_addr3=" + M_addr3 + ", m_birth=" + m_birth + "]";
	}
}