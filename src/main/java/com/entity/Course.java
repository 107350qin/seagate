package com.entity;
/**
 * 课程表
 * @author Administrator
 *
 */

import java.util.List;

public class Course {
	/**
	 * 课程id
	 */
	private int c_id;

	/**
	 * 课程名字
	 */
	private String c_name;

	/**
	 * 课程类别
	 */
	private String c_class;

	/**
	 * 课程评分
	 */
	private String c_score;

	/**
	 * 课程发布时间
	 */
	private String c_time;

	/**
	 * 课程审核状态
	 */
	private String c_boo;

	/**
	 * 课程浏览次数
	 */
	private String c_brow;

	/**
	 * 课程简介
	 */
	private String c_desc;

	/**
	 * 课程图片
	 */
	private Object c_pic;

	/**
	 * 总时长
	 */
	private String c_long;

	/**
	 * 适合对象
	 */
	private String c_for;

	/**
	 * 课程属于哪一个公司
	 */
	private Com com;
	
	
	

	public Com getCom() {
		return com;
	}

	public void setCom(Com com) {
		this.com = com;
	}

	public Object getC_pic() {
		return c_pic;
	}

	public void setC_pic(Object c_pic) {
		this.c_pic = c_pic;
	}

	public String getC_for() {
		return c_for;
	}

	public void setC_for(String c_for) {
		this.c_for = c_for;
	}

	/**
	 * 包含的章
	 */
	private List<Chapter> chapterList;

	/**
	 * 学习的人
	 */
	private List<User> studyList;
	/**
	 * 评论
	 */
	private List<Comm> commList;

	public String getC_long() {
		return c_long;
	}

	public void setC_long(String c_long) {
		this.c_long = c_long;
	}

	public List<User> getStudyList() {
		return studyList;
	}

	public void setStudyList(List<User> studyList) {
		this.studyList = studyList;
	}

	public List<Comm> getCommList() {
		return commList;
	}

	public void setCommList(List<Comm> commList) {
		this.commList = commList;
	}


	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public String getC_class() {
		return c_class;
	}

	public void setC_class(String c_class) {
		this.c_class = c_class;
	}

	public String getC_score() {
		return c_score;
	}

	public void setC_score(String c_score) {
		this.c_score = c_score;
	}

	public String getC_time() {
		return c_time;
	}

	public void setC_time(String c_time) {
		this.c_time = c_time;
	}

	public String getC_boo() {
		return c_boo;
	}

	public void setC_boo(String c_boo) {
		this.c_boo = c_boo;
	}

	public String getC_brow() {
		return c_brow;
	}

	public void setC_brow(String c_brow) {
		this.c_brow = c_brow;
	}

	public String getC_desc() {
		return c_desc;
	}

	public void setC_desc(String c_desc) {
		this.c_desc = c_desc;
	}

	public List<Chapter> getChapterList() {
		return chapterList;
	}

	public void setChapterList(List<Chapter> chapterList) {
		this.chapterList = chapterList;
	}

	

	/**
	 * 此处增加两个方法是为了确保hashSset的add方法添加唯一的元素
	 * 注意：里面包含的list是对象，我这里只需要判断课程的id是否相同就行，所以要明确需要的属性
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + c_id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Course other = (Course) obj;
		if (c_id != other.c_id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Course [c_id=" + c_id + ", c_name=" + c_name + ", c_class=" + c_class + ", c_score=" + c_score
				+ ", c_time=" + c_time + ", c_boo=" + c_boo + ", c_brow=" + c_brow + ", c_desc=" + c_desc + ", c_pic="
				+ c_pic + ", c_long=" + c_long + ", c_for=" + c_for + ", com=" + com + ", chapterList=" + chapterList
				+ "]";
	}

	
}
