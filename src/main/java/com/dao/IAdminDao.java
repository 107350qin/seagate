package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Admin;
import com.entity.Course;
import com.entity.Event;

public interface IAdminDao {

	Admin selectAdmin(Admin admin);

	void insertEvent(Event event);

	int selectEventCount(int flag);
	List<Event> selectEvent(int flag,int i, int j);

	int selectEventCountA(String keyword);
	List<Event> selectEventA(int i, int j,String keyword);
	
	void deleteEvent(int event_id);

	Event selectEventById(int event_id);

	void changeEventById(Event event);

	void updatePicOfEvent(Event event);

	List<Course> pickCourses(@Param("isPass")int isPass,@Param("rank")int rank,@Param("begin")int begin,@Param("end")int end);

	void pass(int i,int pass);

	int pickCourseCount(@Param("isPass")int isPass,@Param("rank")int rank);

	Course pickCourseById(int c_id);

	int selectCourseCount(String keyword);

	List<Event> selectCourses(int i, int pageSize, String keyword);


}
