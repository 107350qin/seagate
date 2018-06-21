package com.entity;

/**
 * 事件表
 * 
 * @author Administrator
 *
 */
public class Event {
	/**
	 * 事件id
	 */
	private int event_id;

	/**
	 * 事件标题
	 */
	private String event_title;

	/**
	 * 事件内容
	 */
	private String event_content;

	/**
	 * 事件发布时间
	 */
	private String event_time;

	/**
	 * 事件浏览次数
	 */
	private String event_browCount;

	/**
	 * 事件类型
	 */
	private String event_boo;

	/**
	 * 事件描述
	 */
	private String event_desc;

	/**
	 * 相关图片
	 * 
	 * @return
	 */
	private String event_pic;

	public String getEvent_pic() {
		return event_pic;
	}

	public void setEvent_pic(String event_pic) {
		this.event_pic = event_pic;
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public String getEvent_time() {
		return event_time;
	}

	public void setEvent_time(String event_time) {
		this.event_time = event_time;
	}

	public String getEvent_browCount() {
		return event_browCount;
	}

	public void setEvent_browCount(String event_browCount) {
		this.event_browCount = event_browCount;
	}

	public String getEvent_boo() {
		return event_boo;
	}

	public void setEvent_boo(String event_boo) {
		this.event_boo = event_boo;
	}

	public String getEvent_desc() {
		return event_desc;
	}

	public void setEvent_desc(String event_desc) {
		this.event_desc = event_desc;
	}

	@Override
	public String toString() {
		return "Event [event_id=" + event_id + ", event_title=" + event_title + ", event_content=" + event_content
				+ ", event_time=" + event_time + ", event_browCount=" + event_browCount + ", event_boo=" + event_boo
				+ ", event_desc=" + event_desc + "]";
	}

}
