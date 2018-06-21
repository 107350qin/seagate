package com.service;

import java.util.List;

import com.entity.Admin;
import com.entity.Course;
import com.entity.Event;

import selfUtil.Pager;

public interface IAdminService {

	Admin login(Admin admin);

	void addEventDo(Event event);

	Pager<Event> setEvent(Pager<Event> pager, int flag);
	
	Pager<Event> setEvent(Pager<Event> pager,String keyword);

	void deleteEvent(int parseInt);

	Event selectEventById(int event_id);

	void changeEventById(Event event);

	void updatePicOfEvent(Event event);

	Pager<Course> pickCourses(Pager<Course> pager, int isPass, int rank);
	

	void pass(int c_id,int pass);

	int pickCourseCount(int isPass,int rank);

	Course picCourseById(int c_id);

	Pager<Event> setCourse(Pager<Event> pager, String keyword);



}
