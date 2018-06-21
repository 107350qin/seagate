package com.entity;
/**
 * 管理员表
 * @author Administrator
 *
 */
public class Admin {
/**
 * 管理员id
 */
private int id;

/**
 * 管理员账号
 */
private String username;

/**
 * 管理员密码
 */
private String password;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

}
