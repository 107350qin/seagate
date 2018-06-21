package com.entity;

import java.util.List;

/**
 * 普通用户表
 * 
 * @author Administrator
 *
 */
public class User {
	/**
	 * 用户id
	 */
	private int u_id;

	/**
	 * 用户手机号号码
	 */
	private String u_phone;

	



	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_phone=" + u_phone + ", u_email=" + u_email + ", u_password=" + u_password
				+ ", u_name=" + u_name + ", u_company=" + u_company + ", u_position=" + u_position + ", u_onlineTime="
				+ u_onlineTime + ", u_photo=" + u_photo + ", u_score=" + u_score + ", u_grow=" + u_grow + ", u_rank="
				+ u_rank + ", u_addressDetail=" + u_addressDetail + ", u_address=" + u_address + ", collList="
				+ collList + ", studyList=" + studyList + "]";
	}

	/**
	 * 用户邮箱
	 */
	private String u_email;

	/**
	 * 用户密码
	 */
	private String u_password;

	/**
	 * 用户姓名
	 */
	private String u_name;

	/**
	 * 用户所在公司
	 */
	private String u_company;

	/**
	 * 用户职位
	 */
	private String u_position;

	/**
	 * 用户在线时长
	 */
	private String u_onlineTime;

	/**
	 * 用户头像
	 */
	private String u_photo;

	/**
	 * 用户积分
	 */
	private int u_score;

	/**
	 * 用户成长值
	 */
	private int u_grow;

	/**
	 * 用户等级
	 */
	private String u_rank;

	/**
	 * 用户详细地址
	 */
	private String u_addressDetail;

	/**
	 * 用户地址[省市县]
	 */
	private String u_address;
	
	/**
	 * 收藏的课程
	 * @return
	 */
	private List<Course> collList;
	
	/**
	 * 学习的课程
	 * @return
	 */
	private List<Course> studyList;

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_password() {
		return u_password;
	}

	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_company() {
		return u_company;
	}

	public void setU_company(String u_company) {
		this.u_company = u_company;
	}

	public String getU_position() {
		return u_position;
	}

	public void setU_position(String u_position) {
		this.u_position = u_position;
	}

	public String getU_onlineTime() {
		return u_onlineTime;
	}

	public void setU_onlineTime(String u_onlineTime) {
		this.u_onlineTime = u_onlineTime;
	}

	public String getU_photo() {
		return u_photo;
	}

	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}

	public int getU_score() {
		return u_score;
	}

	public void setU_score(int u_score) {
		this.u_score = u_score;
	}

	public int getU_grow() {
		return u_grow;
	}

	public void setU_grow(int u_grow) {
		this.u_grow = u_grow;
	}

	public String getU_rank() {
		return u_rank;
	}

	public void setU_rank(String u_rank) {
		this.u_rank = u_rank;
	}

	public String getU_addressDetail() {
		return u_addressDetail;
	}

	public void setU_addressDetail(String u_addressDetail) {
		this.u_addressDetail = u_addressDetail;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}


}
