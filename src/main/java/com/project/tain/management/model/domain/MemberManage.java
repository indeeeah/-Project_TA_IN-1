package com.project.tain.management.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberManage implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
//	CREATE TABLE Member (
//			   m_id   varchar2(20)      NOT NULL,
//			   m_pw   varchar2(20)      NOT NULL,
//			   m_name   varchar2(20)      NOT NULL,
//			   m_intro   varchar2(200)    NULL,
//			   m_email   varchar2(100)      NOT NULL,
//			   m_addr1   number      NOT NULL,
//			   m_addr2   varchar2(100)       NULL,
//			   m_addr3   varchar2(200)       NULL,
//			   m_phone   varchar2(13)      NOT NULL,
//			   m_birth   Date      NOT NULL,
//			   m_img   varchar2(200)      NULL,
//			   m_usage   char(1)   DEFAULT 'G'   CHECK(m_usage IN ('G', 'B'))    NOT NULL,
//			   m_status   number   DEFAULT 0   NOT NULL,
//			   m_activity   number   DEFAULT 2   NOT NULL,
//			   m_lastact   Date   DEFAULT sysdate   NOT NULL,
//			   m_language   char(1)   DEFAULT 'K'   CHECK(m_language IN ('K', 'E'))   NOT NULL,
//			   m_joindate  Date   default sysdate  not null
//			);
	
	
	private String m_id;
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
	private String m_usage;
	private int m_status;
	private int m_activity;
	private Date m_lastact;
	private String m_language;
	private Date m_joindate;
	private String approval_key;
	private String approval_status;
	
	private String o_reason;
	private Date o_date;
	private String o_reasontx;
	
	public MemberManage() {
		
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

	public String getM_usage() {
		return m_usage;
	}

	public void setM_usage(String m_usage) {
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

	public String getM_language() {
		return m_language;
	}

	public void setM_language(String m_language) {
		this.m_language = m_language;
	}

	public Date getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}
	
	public String getApproval_key() {
		return approval_key;
	}

	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	
	public String getO_reason() {
		return o_reason;
	}

	public void setO_reason(String o_reason) {
		this.o_reason = o_reason;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public String getO_reasontx() {
		return o_reasontx;
	}

	public void setO_reasontx(String o_reasontx) {
		this.o_reasontx = o_reasontx;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getom_reason() {
		if(o_reason.equals("S")) {
			return "자진탈퇴";
		} else {
			return "강제탈퇴";
		}
	}
}
