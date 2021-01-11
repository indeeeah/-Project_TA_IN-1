package com.project.tain.general.board.model.domain;

import org.springframework.stereotype.Component;

@Component
public class GnBoard {
	private String m_id;
	private String m_img;
	private int follow;
	private int follower;
	private int post;
	private String m_intro;
	private int story;
	private String b_img;

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

	public int getFollow() {
		return follow;
	}

	public void setFollow(int follow) {
		this.follow = follow;
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	public int getPost() {
		return post;
	}

	public void setPost(int post) {
		this.post = post;
	}

	public String getM_intro() {
		return m_intro;
	}

	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}

	public int getStory() {
		return story;
	}

	public void setStory(int story) {
		this.story = story;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	
	

}
