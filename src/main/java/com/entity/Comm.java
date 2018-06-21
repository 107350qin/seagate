package com.entity;

public class Comm {
	private int comm_id;
	private User user;
	private String comm_content;
	private String comm_time;
	private int comm_score;

	@Override
	public String toString() {
		return "Comm [comm_id=" + comm_id + ", user=" + user + ", comm_content=" + comm_content + ", comm_time="
				+ comm_time + ", comm_score=" + comm_score + "]";
	}

	public int getComm_id() {
		return comm_id;
	}

	public void setComm_id(int comm_id) {
		this.comm_id = comm_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public String getComm_time() {
		return comm_time;
	}

	public void setComm_time(String comm_time) {
		this.comm_time = comm_time;
	}

	public int getComm_score() {
		return comm_score;
	}

	public void setComm_score(int comm_score) {
		this.comm_score = comm_score;
	}
}
