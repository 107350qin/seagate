package com.service;

import java.util.List;

import com.entity.Chapter;
import com.entity.Com;
import com.entity.Course;
import com.entity.Section;

public interface IComService {

	boolean insertcom_companyRegistration(Com com);

	Com selectcom_login(Com com);

	boolean insertcom_companyHome(Course course, int com_id);

	List<Course> pickCoursesByComId(int com_id);

	List<Chapter> pickChapterListById(int c_id);

	boolean checkComNameExit(String com_name);

	boolean resetPassword(String com_name, String com_password);

	Course picCourseById(int c_id);
	
	

	Section pickSectionById(int section_id);

	Chapter pickChapterBySectionId(int section_id);

	boolean deleteCourseById(Course course);
}
