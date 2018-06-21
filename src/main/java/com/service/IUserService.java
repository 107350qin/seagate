package com.service;

import java.util.List;

import com.entity.Chapter;
import com.entity.Comm;
import com.entity.Course;
import com.entity.Event;
import com.entity.Section;
import com.entity.User;

import selfUtil.Pager;

public interface IUserService {

	List<Event> pickNoticeAndInfo(int i);

	List<Event> pickMarketAndActivity(int i);

	List<Course> pickCourse(int i,int j,int c_class);

	List<Comm> pickCourseCommByCid(int c_id);

	List<User> pickCourseStudyByCid(int c_id);

	int pickCourseCountOfClass(int i);

	Course picCourseById(int c_id);

	List<Integer> pickUidByCid(int c_id);

	List<Integer> pickCidByUid(int uid);

	Section pickSectionById(int section_id);

	void insertComm(int u_id, int c_id, String v, String timeStr, int score);

	Chapter pickChapterBySectionId(int section_id);

	void insertSeen(int u_id, int section_id, String position);

	String pickSeenTime(int u_id, int section_id);

	boolean insertLoginer(User user);

	User selectLoginer(String a,String b);

	User pickUserByEmail(String email);

	User pickUserByPhone(String u_phone);

	void updatePhoto(User user);

	void updatePassword(String oldPassword, String newPassword, int u_id);

	List<Course> pickCollCoursesByUid(int u_id);

	List<Course> pickStudyCoursesByUid(int u_id);

	Event pickEventById(int event_id);

	Pager<Event> setEvent(Pager<Event> pager, String keyword);

	Pager<Course> setCourse(Pager<Course> pager, String keyword);





}
