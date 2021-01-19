package com.project.tain.businessmembermanage.model.vo;

public class bMemberVO {
	private String m_id;
	private int bm_cate;
	private String bm_name;
	private String bm_addr;
	private String bm_url;
	private String bm_account;
	private String bm_intro;
	private String bm_phone;
	private String bm_approval;
	
	public bMemberVO() {
	}
	
	
	
	public bMemberVO(String m_id, int bm_cate, String bm_name, String bm_addr, String bm_url, String bm_account,
			String bm_intro, String bm_phone, String bm_approval) {
		super();
		this.m_id = m_id;
		this.bm_cate = bm_cate;
		this.bm_name = bm_name;
		this.bm_addr = bm_addr;
		this.bm_url = bm_url;
		this.bm_account = bm_account;
		this.bm_intro = bm_intro;
		this.bm_phone = bm_phone;
		this.bm_approval = bm_approval;
	}
	


	@Override
	public String toString() {
		return "bMemberVO [m_id=" + m_id + ", bm_cate=" + bm_cate + ", bm_name=" + bm_name + ", bm_addr=" + bm_addr
				+ ", bm_url=" + bm_url + ", bm_account=" + bm_account + ", bm_intro=" + bm_intro + ", bm_phone="
				+ bm_phone + ", bm_approval=" + bm_approval + "]";
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
}
