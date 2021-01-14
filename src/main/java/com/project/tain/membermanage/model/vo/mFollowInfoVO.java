package com.project.tain.membermanage.model.vo;

public class mFollowInfoVO {
	private String m_id;
	private String m_img;

	public mFollowInfoVO() {
	}

	public mFollowInfoVO(String m_id, String m_img) {
		super();
		this.m_id = m_id;
		this.m_img = m_img;
	}

	@Override
	public String toString() {
		return "mFollowInfoVO [m_id=" + m_id + ", m_img=" + m_img + "]";
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
}
