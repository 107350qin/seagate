package com.entity;

/**
 * 节表
 * 
 * @author Administrator
 *
 */
public class Section {
	/**
	 * 节id
	 */
	private int section_id;

	/**
	 * 节标题
	 */
	private String section_title;

	/**
	 * 节总时长
	 */
	private String section_long;

	/**
	 * 节视频地址
	 */
	private String section_link;

	public int getSection_id() {
		return section_id;
	}

	public void setSection_id(int section_id) {
		this.section_id = section_id;
	}

	public String getSection_title() {
		return section_title;
	}

	public void setSection_title(String section_title) {
		this.section_title = section_title;
	}

	public String getSection_long() {
		return section_long;
	}

	public void setSection_long(String section_long) {
		this.section_long = section_long;
	}

	public String getSection_link() {
		return section_link;
	}

	public void setSection_link(String section_link) {
		this.section_link = section_link;
	}

	@Override
	public String toString() {
		return "Section [section_id=" + section_id + ", section_title=" + section_title + ", section_long="
				+ section_long + ", section_link=" + section_link + "]";
	}

}

