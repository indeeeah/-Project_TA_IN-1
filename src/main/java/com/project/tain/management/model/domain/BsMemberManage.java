package com.project.tain.management.model.domain;

public class BsMemberManage implements java.io.Serializable{
//	CREATE TABLE BusinessMember (
//	m_id   varchar2(20)      NOT NULL,
//	bm_cate   number   CHECK(bm_cate IN (1, 2, 3, 4, 5))      NOT NULL,
//	bm_name   varchar2(200)      NOT NULL,
//	bm_addr   varchar2(500)      NOT NULL,
//	bm_url   varchar2(200)      NULL,
//	bm_account   varchar2(200)      NOT NULL,
//	bm_qr   varchar2(200)      NULL,
//	bm_intro   varchar2(200)      NULL,
//	bm_phone   varchar2(20)      NOT NULL,
//	bm_approval   char(1)   DEFAULT 'N' CHECK(bm_approval IN ('N', 'Y'))   NOT NULL
//	);
	private static final long serialVersionUID = 1L;
	
	private String m_id;
	private int bm_cate;
	private String bm_name;
	private String bm_addr;
	private String bm_url;
	private String bm_account;
	private String bm_qr;
	private String bm_intro;
	private String bm_phone;
	private String bm_approval;
	
	public BsMemberManage() {
		
	}

	public BsMemberManage(String m_id, String bm_approval) {
		super();
		this.m_id = m_id;
		this.bm_approval = bm_approval;
	}

	public BsMemberManage(String m_id, int bm_cate, String bm_name, String bm_account, String bm_qr,
			String bm_approval) {
		super();
		this.m_id = m_id;
		this.bm_cate = bm_cate;
		this.bm_name = bm_name;
		this.bm_account = bm_account;
		this.bm_qr = bm_qr;
		this.bm_approval = bm_approval;
	}

	public BsMemberManage(String m_id, int bm_cate, String bm_name, String bm_addr, String bm_url, String bm_account,
			String bm_qr, String bm_intro, String bm_phone, String bm_approval) {
		super();
		this.m_id = m_id;
		this.bm_cate = bm_cate;
		this.bm_name = bm_name;
		this.bm_addr = bm_addr;
		this.bm_url = bm_url;
		this.bm_account = bm_account;
		this.bm_qr = bm_qr;
		this.bm_intro = bm_intro;
		this.bm_phone = bm_phone;
		this.bm_approval = bm_approval;
	}

	@Override
	public String toString() {
		return "BsMemberManage [m_id=" + m_id + ", bm_cate=" + bm_cate + ", bm_name=" + bm_name + ", bm_addr=" + bm_addr
				+ ", bm_url=" + bm_url + ", bm_account=" + bm_account + ", bm_qr=" + bm_qr + ", bm_intro=" + bm_intro
				+ ", bm_phone=" + bm_phone + ", bm_approval=" + bm_approval + "]";
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getBm_cate() {
		return bm_cate;
	}

	public void setBm_cate(int bm_cate) {
		this.bm_cate = bm_cate;
	}

	public String getBm_name() {
		return bm_name;
	}

	public void setBm_name(String bm_name) {
		this.bm_name = bm_name;
	}

	public String getBm_addr() {
		return bm_addr;
	}

	public void setBm_addr(String bm_addr) {
		this.bm_addr = bm_addr;
	}

	public String getBm_url() {
		return bm_url;
	}

	public void setBm_url(String bm_url) {
		this.bm_url = bm_url;
	}

	public String getBm_account() {
		return bm_account;
	}

	public void setBm_account(String bm_account) {
		this.bm_account = bm_account;
	}

	public String getBm_qr() {
		return bm_qr;
	}

	public void setBm_qr(String bm_qr) {
		this.bm_qr = bm_qr;
	}

	public String getBm_intro() {
		return bm_intro;
	}

	public void setBm_intro(String bm_intro) {
		this.bm_intro = bm_intro;
	}

	public String getBm_phone() {
		return bm_phone;
	}

	public void setBm_phone(String bm_phone) {
		this.bm_phone = bm_phone;
	}

	public String getBm_approval() {
		return bm_approval;
	}

	public void setBm_approval(String bm_approval) {
		this.bm_approval = bm_approval;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getbsm_cate() {
		if(bm_cate==1) {
			return "패션";
		} if(bm_cate==2) {
			return "전자제품";
		} if(bm_cate==3) {
			return "잡화";
		} if(bm_cate==4) {
			return "화장품";
		} else {
			return "기타";
		}
	}
}
