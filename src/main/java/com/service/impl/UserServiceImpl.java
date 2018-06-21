package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.IAdminDao;
import com.dao.IUserDao;
import com.entity.Chapter;
import com.entity.Comm;
import com.entity.Course;
import com.entity.Event;
import com.entity.Section;
import com.entity.User;
import com.service.IUserService;

import selfUtil.Pager;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	private IUserDao userDao;
	@Autowired
	private IAdminDao adminDao;

	@Override
	public List<Event> pickNoticeAndInfo(int i) {
		return userDao.pickNoticeAndInfo(i);
	}

	@Override
	public List<Event> pickMarketAndActivity(int i) {
		List<Event>list=userDao.pickMarketAndActivity(i);
		for(Event event:list) {
			event.setEvent_time(event.getEvent_time().substring(0, event.getEvent_time().length()-2));
		}
		return list;
	}

	@Override
	public List<Course> pickCourse(int i,int j,int c_class) {
		return userDao.pickCourse(i,j,c_class);
	}

	@Override
	public List<Comm> pickCourseCommByCid(int c_id) {
		System.out.println(c_id+"----------------c_id");
		return userDao.pickCourseCommByCid(c_id);
	}

	@Override
	public List<User> pickCourseStudyByCid(int c_id) {
		return userDao.pickCourseStudyByCid(c_id);
	}

	@Override
	public int pickCourseCountOfClass(int i) {
		return userDao.pickCourseCountOfClass(i);
	}

	@Override
	public Course picCourseById(int c_id) {
		Course course= userDao.pickCourseById(c_id);
		course.setCommList(pickCourseCommByCid(c_id));
		course.setStudyList(pickCourseStudyByCid(c_id));
		course.setChapterList(userDao.pickChapterListById(c_id));
		return course;
	}

	@Override
	public List<Integer> pickUidByCid(int c_id) {
		return userDao.pickUidByCid(c_id);
	}

	@Override
	public List<Integer> pickCidByUid(int uid) {
		return userDao.pickCidByUid(uid);
	}

	@Override
	public Section pickSectionById(int section_id) {
		return userDao.pickSectionById(section_id);
	}

	@Override
	public void insertComm(int u_id, int c_id, String v, String timeStr, int score) {
		userDao.insertComm(u_id,c_id,v,timeStr,score);
	}

	@Override
	public Chapter pickChapterBySectionId(int section_id) {
		return userDao.pickChapterBySectionId(section_id);
	}

	@Override
	@Transactional
	public void insertSeen(int u_id, int section_id, String position) {
		if((userDao.pickSeenCount(u_id,section_id))>0) {
			System.out.println("已经有了");
			userDao.updateSeen(u_id,section_id,position);
			return;
		}
		System.out.println("没有");
		userDao.insertSeen(u_id,section_id,position);
	}

	@Override
	public String pickSeenTime(int u_id, int section_id) {
		return userDao.pickSeenTime(u_id,section_id);
	}

	@Override
	public boolean insertLoginer(User user) {
		return userDao.insertLoginer(user)>0;
	}

	@Override
	public User pickUserByEmail(String email) {
		return userDao.pickUserByEmail(email);
	}

	@Override
	public User pickUserByPhone(String u_phone) {
		return userDao.pickUserByPhone(u_phone);
	}

	@Override
	public User selectLoginer(String a, String b) {
		return userDao.selectLoginer(a,b);
	}

	@Override
	public void updatePhoto(User user) {
		userDao.updatePhoto(user);
	}

	@Override
	public void updatePassword(String oldPassword, String newPassword, int u_id) {
		userDao.updatePassword(oldPassword,newPassword,u_id);
	}

	@Override
	public List<Course> pickCollCoursesByUid(int u_id) {
		return userDao.pickCollCoursesByUid(u_id);
	}

	@Override
	public List<Course> pickStudyCoursesByUid(int u_id) {
		return userDao.pickStudyCoursesByUid(u_id);
	}

	@Override
	public Event pickEventById(int event_id) {
		return userDao.pickEventById(event_id);
	}

	@Override
	public Pager<Event> setEvent(Pager<Event> pager, String keyword) {
		pager.setTotalCount(adminDao.selectEventCountA(keyword));
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		pager.setContent(adminDao.selectEventA((pager.getPageNow()-1)*pager.getPageSize(),pager.getPageSize(),keyword));
		return pager;
	}

	@Override
	public Pager<Course> setCourse(Pager<Course> pager, String keyword) {
		pager.setTotalCount(adminDao.selectCourseCount(keyword));
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		pager.setContent(userDao.selectCourses((pager.getPageNow()-1)*pager.getPageSize(),pager.getPageSize(),keyword));
		return pager;
	}



}
