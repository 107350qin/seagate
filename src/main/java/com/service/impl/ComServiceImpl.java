package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.IComDao;
import com.entity.Chapter;
import com.entity.Com;
import com.entity.Course;
import com.entity.Section;
import com.service.IComService;

@Service
public class ComServiceImpl implements IComService {
	@Autowired
	private IComDao comDao;

	@Override
	@Transactional
	public boolean insertcom_companyRegistration(Com com) {
		 
		return comDao.insertcom_companyRegistration(com) > 0;
	}



	@Override
	public Com selectcom_login(Com com) {
		Com comm = comDao.selectcom_login(com);
		return comm;
	}



	@Override
	@Transactional
	public boolean insertcom_companyHome(Course course,int com_id) {
		comDao.insertCourse(course.getC_name(),course.getC_class(),course.getC_time(),course.getC_desc(),(String)course.getC_pic(),com_id);
		Course course2=comDao.selectCourseByName(course.getC_name());
		System.out.println("课程ID："+course2.getC_id());
		for(int i=0;i<course.getChapterList().size();i++) {
			System.out.println("章标题是："+course.getChapterList().get(i).getCh_title());
			comDao.insertChapter(course.getChapterList().get(i).getCh_title(),course2.getC_id());
			
			Chapter chapter=comDao.selectChapterByTile(course.getChapterList().get(i).getCh_title());
			
			System.out.println("章的ID："+chapter.getCh_id());
			for(int j=0;j<course.getChapterList().get(i).getList().size();j++) {
				Section section=course.getChapterList().get(i).getList().get(j);
				comDao.insertSection(section.getSection_title(),section.getSection_long(),section.getSection_link(),chapter.getCh_id());
			}
		}
		return true;
	}



	@Override
	public List<Course> pickCoursesByComId(int com_id) {
		return comDao.pickCoursesByComId(com_id);
	}

	@Override
	public List<Chapter> pickChapterListById(int c_id) {
		return comDao.pickChapterListById(c_id);
	}



	@Override
	public boolean checkComNameExit(String com_name) {
		return comDao.checkComNameExit(com_name)>0;
	}



	@Override
	public boolean resetPassword(String com_name, String com_password) {
		return comDao.updatePassword(com_name,com_password)>0;
	}



	@Override
	public Course picCourseById(int c_id) {
		Course course= comDao.pickCourseById(c_id);
		course.setChapterList(comDao.pickChapterListById(c_id));
		return course;
	}



	@Override
	public Section pickSectionById(int section_id) {
		return comDao.pickSectionById(section_id);
	}



	@Override
	public Chapter pickChapterBySectionId(int section_id) {
		return comDao.pickChapterBySectionId(section_id);
	}


	@Transactional
	@Override
	public boolean deleteCourseById(Course course) {
		for(Chapter chapter:course.getChapterList()) {
			for(Section section:chapter.getList()) {
				comDao.delUserSection(section.getSection_id());
			}
			comDao.delSection(chapter.getCh_id());
		}
		comDao.delChapter(course.getC_id());
		comDao.delColl(course.getC_id());
		comDao.delComm(course.getC_id());
		comDao.delStudy(course.getC_id());
		comDao.delCourse(course.getC_id());
		return true;
	}

}
