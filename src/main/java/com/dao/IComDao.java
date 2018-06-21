package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Chapter;
import com.entity.Com;
import com.entity.Course;
import com.entity.Section;

@Repository
public interface IComDao {
	 int insertcom_companyRegistration(Com com);
	 Com selectcom_login(Com com);
	 int insertcom_companyHome(Course course);
	void insertCourse(String i,String j,String k,String l,String m,int com_id);
	void insertChapter(String chapter_title, int i);
	void insertSection(String section_title,String section_long,String section_link, int i);
	Course selectCourseByName(String c_name);
	Chapter selectChapterByTile(String ch_title);
	List<Course> pickCoursesByComId(int com_id);
	List<Chapter> pickChapterListById(int c_id);
	int checkComNameExit(String com_name);
	int updatePassword(String com_name, String com_password);
	Course pickCourseById(int c_id);
	Section pickSectionById(int section_id);
	Chapter pickChapterBySectionId(int section_id);
	
	void delUserSection(int section_id);
	void delSection(int ch_id);
	void delChapter(int c_id);
	void delColl(int c_id);
	void delComm(int c_id);
	void delStudy(int c_id);
	void delCourse(int c_id);
}
