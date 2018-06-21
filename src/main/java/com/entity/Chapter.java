package com.entity;

import java.util.List;

/**
 * 章表
 * @author Administrator
 *
 */
public class Chapter {
/**
 * 章id
 */
private int ch_id;

/**
 * 章标题
 */
private String ch_title;

/**
 * 章包含的节
 */
private List<Section> list;

/**
 * 章时长
 * @return
 */
private String ch_long;

public String getCh_long() {
	return ch_long;
}

public void setCh_long(String ch_long) {
	this.ch_long = ch_long;
}

public int getCh_id() {
	return ch_id;
}

public void setCh_id(int ch_id) {
	this.ch_id = ch_id;
}

public String getCh_title() {
	return ch_title;
}

public void setCh_title(String ch_title) {
	this.ch_title = ch_title;
}

public List<Section> getList() {
	return list;
}

public void setList(List<Section> list) {
	this.list = list;
}

@Override
public String toString() {
	return "Chapter [ch_id=" + ch_id + ", ch_title=" + ch_title + ", list=" + list + ", ch_long=" + ch_long + "]";
}



}
