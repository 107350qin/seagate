package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.entity.Chapter;
import com.entity.Comm;
import com.entity.Course;
import com.entity.Event;
import com.entity.Section;
import com.entity.User;

@Repository
public interface IUserDao {

	List<Event> pickNoticeAndInfo(int i);

	List<Event> pickMarketAndActivity(int i);

	List<Course> pickCourse(int i,int j,@Param(value="c_class")int c_class);

	List<Comm> pickCourseCommByCid(int c_id);

	List<User> pickCourseStudyByCid(int c_id);

	int pickCourseCountOfClass(int i);

	Course pickCourseById(int c_id);

	List<Chapter> pickChapterListById(int c_id);

	List<Integer> pickUidByCid(int c_id);

	List<Integer> pickCidByUid(int uid);

	Section pickSectionById(int section_id);

	void insertComm(int u_id, int c_id, String v, String timeStr, int score);

	Chapter pickChapterBySectionId(int section_id);

	void insertSeen(int u_id, int section_id, String position);

	int pickSeenCount(int u_id, int section_id);

	void updateSeen(int u_id, int section_id, String position);

	String pickSeenTime(int u_id, int section_id);

	int insertLoginer(User user);

	User selectLoginer(User user);

	User pickUserByEmail(String email);

	User pickUserByPhone(String u_phone);

	User selectLoginer(String a, String b);

	void updatePhoto(User user);

	void updatePassword(String oldPassword, String newPassword, int u_id);

	List<Course> pickCollCoursesByUid(int u_id);

	List<Course> pickStudyCoursesByUid(int u_id);

	Event pickEventById(int event_id);

	List<Course> selectCourses(int i, int pageSize, String keyword);




}
