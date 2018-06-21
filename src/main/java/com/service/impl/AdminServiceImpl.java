package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.IAdminDao;
import com.entity.Admin;
import com.entity.Course;
import com.entity.Event;
import com.service.IAdminService;

import selfUtil.Pager;

@Service
public class AdminServiceImpl implements IAdminService {
	@Autowired
	private IAdminDao adminDao;

	@Override
	public Admin login(Admin admin) {
		return adminDao.selectAdmin(admin);
	}

	@Override
	@Transactional
	public void addEventDo(Event event) {
		adminDao.insertEvent(event);
	}

	@Override
	public Pager<Event> setEvent(Pager<Event> pager,int flag) {
		pager.setTotalCount(adminDao.selectEventCount(flag));
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		List<Event> list=adminDao.selectEvent(flag,(pager.getPageNow()-1)*pager.getPageSize(),pager.getPageSize());
		for(Event event:list) {
			event.setEvent_time(event.getEvent_time().substring(0, event.getEvent_time().length()-2));
		}
		pager.setContent(list);
		return pager;
	}
	

	@Override
	public Pager<Event> setEvent(Pager<Event> pager,String keyword) {
		pager.setTotalCount(adminDao.selectEventCountA(keyword));
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		pager.setContent(adminDao.selectEventA((pager.getPageNow()-1)*pager.getPageSize(),pager.getPageSize(),keyword));
		return pager;
	}

	@Override
	@Transactional
	public void deleteEvent(int event_id) {
		adminDao.deleteEvent(event_id);
	}

	@Override
	public Event selectEventById(int event_id) {
		return adminDao.selectEventById(event_id);
	}

	@Override
	public void changeEventById(Event event) {
		adminDao.changeEventById(event);
	}

	@Override
	public void updatePicOfEvent(Event event) {
		adminDao.updatePicOfEvent(event);
		
	}

	@Override
	public Pager<Course> pickCourses(Pager<Course> pager, int isPass, int rank) {
		pager.setPageSize(5);
		pager.setTotalCount(pickCourseCount(isPass,rank));
		System.out.println(pager.getTotalCount()+"总条数 ");
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		pager.setContent(adminDao.pickCourses(isPass,rank,(pager.getPageNow()-1)*pager.getPageSize(),pager.getPageSize()));
		return pager;
	}


	@Override
	public void pass(int c_id,int pass) {
		System.out.println(c_id+"............."+pass);
		adminDao.pass(c_id,pass);
	}

	@Override
	public int pickCourseCount(int isPass,int rank) {
		return adminDao.pickCourseCount(isPass,rank);
	}

	@Override
	public Course picCourseById(int c_id) {
		Course course= adminDao.pickCourseById(c_id);
		return course;
	}

	@Override
	public Pager<Event> setCourse(Pager<Event> pager, String keyword) {
		pager.setTotalCount(adminDao.selectCourseCount(keyword));
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		pager.setContent(adminDao.selectCourses((pager.getPageNow()-1)*pager.getPageSize(),pager.getPageSize(),keyword));
		return pager;
	}

}
