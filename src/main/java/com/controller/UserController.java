package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.HTTP;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.entity.Chapter;
import com.entity.Course;
import com.entity.Event;
import com.entity.Section;
import com.entity.User;
import com.fasterxml.jackson.core.sym.Name;
import com.google.gson.Gson;
import com.mail.Mymail;
import com.service.IAdminService;
import com.service.IUserService;

import selfUtil.Pager;
import selfUtil.StringUtil;
import selfUtil.Val;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private IUserService userService;

	@Autowired
	private IAdminService adminService;

	/**
	 * 秦盟开始
	 */

	/**
	 * 用户注册
	 */
	@RequestMapping("reg")
	public String reg() {
		return "user_reg";
	}

	@RequestMapping("regDo")
	public String regDo(User user,HttpServletRequest request) {
		request.setAttribute("user", user);
		System.out.println(request.getParameter("sheng"));
		System.out.println(request.getParameter("shi"));
		System.out.println(request.getParameter("xian"));
		System.out.println(request.getSession().getAttribute("VAL"));
		String aString=request.getParameter("yzm");
		String bString=(String) request.getSession().getAttribute("VAL");
		
		if(!StringUtil.isNotNull(user.getU_phone(),
				user.getU_password(),
				user.getU_email(),
				user.getU_name(),
				user.getU_company(),
				user.getU_position(),
				request.getParameter("yzm")))  {
			return "redirect:reg";
		}
		if(!aString.equalsIgnoreCase(bString)) {
			return "redirect:reg";
		}
		if(Integer.parseInt(request.getParameter("sheng"))==0 || Integer.parseInt(request.getParameter("shi"))==0) {
			return "redirect:reg";
		}
		
		String cString=request.getParameter("sheng")+","+request.getParameter("shi");
		if(Integer.parseInt(request.getParameter("xian"))!=0) {
			cString=cString+","+request.getParameter("xian");
		}
		user.setU_address(cString);
		System.out.println(user.toString());//////////////////////////////
		if (userService.insertLoginer(user)) {
			return "redirect:login";
		} else {
			return "redirect:reg";
		}
		
	}

//	邮箱验证登陆暂时不会
//		request.getSession().setAttribute("theUser", user);
//		String string="<a href='https://10.2.64.181/seagate/user/sureReg?flag=1'>欢迎注册，点击这里确认注册...</a>";
//		try {
//			new Mymail("qin107350@163.com", "1654400317@qq.com", "qin107350@163.com", "107350qi", "小碧涛", string).sendMail();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "user_jumpCheck";
	
//	@RequestMapping("sureReg")
//	public String sureReg(HttpServletRequest request) {
//		System.out.println("hello:"+request.getParameter("flag"));
//		return "user_login";
//	}
	
	
	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
	public void checkEmail(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("传入邮箱时："+request.getParameter("email"));
		response.setContentType("text/html;charset=utf-8");
		String email = request.getParameter("email");
		String status = "0";
		// 写查询语句，查询表里面是否存在该邮箱
		User user = userService.pickUserByEmail(email);
		if (user != null)
			status = "1";
		String data = new Gson().toJson(status);
		try {
			response.getWriter().print(data);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	@RequestMapping("checkPhone")
	public void checkPhone(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("传入电话时："+request.getParameter("u_phone"));
		response.setContentType("text/html;charset=utf-8");
		String u_phone = request.getParameter("u_phone");
		String status = "0";
		// 写查询语句，查询表里面是否存在该邮箱
		User user = userService.pickUserByPhone(u_phone);
		if (user != null)
			status = "1";
		String data = new Gson().toJson(status);
		try {
			response.getWriter().print(data);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/*
	 *验证码 
	 */
	@RequestMapping("VAL")
	public String VAL(HttpServletRequest request,HttpServletResponse response) {
		try {
			new Val().val(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/*
	 *验证码验证 
	 */
	@RequestMapping("checkVAL")
	public String checkVAL(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("到达");
		response.setContentType("text/html;charset=utf-8");
		String valImg=(String)(request.getSession().getAttribute("VAL"));
		System.out.println("用户验证码图片："+valImg);
		
		String valInput=(String)(request.getParameter("val"));
		System.out.println("用户输入的验证码时："+valInput);
		
		String flag="0";
		if(valImg.equalsIgnoreCase(valInput)) {
			 flag="1";
		}
		try {
			response.getWriter().write(new Gson().toJson(flag));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping("login")
	public String login(User user) {
		return "user_login";
	}

	@RequestMapping("loginDo")
	public String loginDo(User user,HttpServletRequest request) {
		String phone_or_email=request.getParameter("phone_or_email");
		User user2=userService.selectLoginer( phone_or_email,user.getU_password());
		if ( user2!= null) {
			request.getSession().setAttribute("CUR_USER", user2);
			return "redirect:index";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("cancel")
	public String cancel(HttpServletRequest request) {
		request.getSession().setAttribute("CUR_USER", null);
		return "redirect:login";
	}
	
	/**
	 * 数据提取
	 * 
	 * @param request
	 * @param boo
	 * @return
	 */
	public Pager<Event> getPager(HttpServletRequest request, int boo) {
		String pageNow = request.getParameter("pageNow");
		Pager<Event> pager = new Pager<>();
		if (!StringUtil.isNotNull(pageNow)) {
			pageNow = "1";
		}
		pager.setPageNow(Integer.parseInt(pageNow));
		pager.setPageSize(10);
		pager = adminService.setEvent(pager, boo);
		request.setAttribute("pager", pager);
		return pager;
	}

	/**
	 * 公告通知
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("notice")
	public String notice(HttpServletRequest request) {
		request.setAttribute("pager", getPager(request, 1));
		return "user_notice";
	}

	/**
	 * 最新资讯
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("latestInfo")
	public String latestInfo(HttpServletRequest request) {
		request.setAttribute("pager", getPager(request, 2));
		return "user_latestInfo";
	}

	/**
	 * 市场活动
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("marketActivity")
	public String marketActivity(HttpServletRequest request) {
		request.setAttribute("pager", getPager(request, 3));
		return "user_marketActivity";
	}

	/**
	 * 奖励计划
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("incentivePlan")
	public String incentivePlan(HttpServletRequest request) {
		request.setAttribute("pager", getPager(request, 4));
		return "user_incentivePlan";
	}

	/**
	 * 公在线学习
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("studyOnline") // 也是最新课程列表
	public String studyOnline(HttpServletRequest request) {
		Pager<Course> pager = new Pager<>();
		String pageNow = request.getParameter("pageNow");
		if (!StringUtil.isNotNull(pageNow)) {
			pageNow = "1";
		}
		pager.setPageNow(Integer.parseInt(pageNow));
		pager.setPageSize(5);

		int c_class = 0;
		if (StringUtil.isNotNull(request.getParameter("c_class"))) {
			c_class = Integer.parseInt(request.getParameter("c_class"));
		}

		int totalCount = userService.pickCourseCountOfClass(c_class);
		pager.setPageCount((totalCount - 1) / pager.getPageSize() + 1);
		System.out.println("总量是：" + totalCount);
		System.out.println("总页数是：" + pager.getPageCount());
		pager.setTotalCount(totalCount);

		request.setAttribute("c_class", c_class);
		List<Course> list = userService.pickCourse((pager.getPageNow() - 1) * pager.getPageSize(), pager.getPageSize(),
				c_class);
		for (Course course : list) {
			course.setCommList(userService.pickCourseCommByCid(course.getC_id()));
			course.setStudyList(userService.pickCourseStudyByCid(course.getC_id()));
		}

		pager.setContent(list);
		request.setAttribute("pager", pager);
		return "user_studyOnline";
	}

	/**
	 * 进入学习
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("enterStudy")
	public String enterStudy(HttpServletRequest request) {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		Course course = userService.picCourseById(c_id);
		request.setAttribute("course", course);

		/**
		 * 学过该课程的人还学过
		 */
		Set<Course> courseList = new HashSet<>();
		/**
		 * 学过该课程的人的ID列表
		 */
		List<Integer> uidList = userService.pickUidByCid(c_id);
		for (int uid : uidList) {
			/**
			 * 对于每一个id取出学过的课程，添加到课程列表里面 注意：由于在course实体里面添加的hashCode和equals方法，添加的是唯一的
			 */
			List<Integer> cidList = userService.pickCidByUid(uid);
			cidList.remove((Integer) c_id);
			if (cidList.size() > 0) {
				for (int id : cidList) {
					courseList.add(userService.picCourseById(id));
				}
			}
		}
		request.setAttribute("courseList", courseList);
		return "user_enterStudy";
	}

	/**
	 * 开始学习
	 * 
	 * @return
	 */
	@RequestMapping("startStudy")
	public String startStudy(HttpServletRequest request) {
		int section_id = 1;
		if (request.getParameter("section_id") != null) {
			section_id = Integer.parseInt(request.getParameter("section_id"));
			Section section = userService.pickSectionById(section_id);
			request.setAttribute("section", section);
		}

		int c_id = Integer.parseInt(request.getParameter("c_id"));
		Course course = userService.picCourseById(c_id);
		request.setAttribute("course", course);

		int index = 1;
		if (request.getParameter("index") != null) {
			index = Integer.parseInt(request.getParameter("index"));
		}
		request.setAttribute("index", index);
		// 差章的名字
		Chapter chapter = userService.pickChapterBySectionId(section_id);
		request.setAttribute("chapter", chapter);
		return "user_player";
	}

	/**
	 * 评论编辑
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("comm")
	public String comm(HttpServletRequest request) {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		request.setAttribute("c_id", c_id);
		return "user_edit";
	}

	/**
	 * 评论编辑
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("edit")
	public String edit(HttpServletRequest request) {
		String v = request.getParameter("editorValue");
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		// int u_id=((User)(request.getSession().getAttribute("CUR_USER"))).getU_id();
		int u_id = 1;
		String scoreStr = request.getParameter("score");
		int score = 0;
		if (scoreStr != null) {
			score = Integer.parseInt(scoreStr);
		}
		userService.insertComm(u_id, c_id, v, StringUtil.getTimeStr(), score);
		System.out.println(v);
		return "redirect:enterStudy?c_id=" + c_id;
	}

	/**
	 * user主页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		/**
		 * 将图片轮播路径放到请求作用于
		 */
		String path = request.getServletContext().getRealPath("/img/lunbo");
		List<String> list=new ArrayList<>();
		String[] li=new File(path).list();
		for(int i=0;i<5;i++) {
			list.add(li[i]);
		}
		request.setAttribute("lunboList", list);

		/**
		 * 公告资讯提取
		 */
		List<Event> noticeAndInfoList = userService.pickNoticeAndInfo(10);
		request.setAttribute("lista", noticeAndInfoList);
		/**
		 * 市场活动提取
		 */
		List<Event> marketAndActivityList = userService.pickMarketAndActivity(5);
		request.setAttribute("listb", marketAndActivityList);
		/**
		 * 课程提取
		 */
		List<Course> courseList = userService.pickCourse(0, 5, 0);
		request.setAttribute("listc", courseList);
		return "user_index";
	}

	/**
	 * 记录播放的地方
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("position")
	public void position(HttpServletRequest request) {
		String position = request.getParameter("position");
		int section_id = Integer.parseInt(request.getParameter("section_id"));
		System.out.println(position);
		System.out.println(section_id);

		// 用户没有登录暂时用l号用户
		// userService.insertSeen(((User)request.getSession().getAttribute("CUR_USER")).getU_id(),section_id,position);
		userService.insertSeen(1, section_id, position);
	}

	/**
	 * 播放的时候从上一次结束的时候开始
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("getPosition")
	public void getPosition(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		int section_id = Integer.parseInt(request.getParameter("section_id"));
		User user = (User) (request.getSession().getAttribute("CUR_USER"));
		// String seenTime=userService.pickSeenTime(user.getU_id(),section_id);
		String seenTime = userService.pickSeenTime(1, section_id);
		System.out.println("播放了：" + seenTime);
		response.getWriter().write(new Gson().toJson(seenTime));
	}

	/**
	 * 秦盟结束
	 */

	/**
	 * 个人信息管理开始
	 */
	@RequestMapping("personalCenter")
	public String personalCenter(HttpServletRequest request) {
		User user=(User)(request.getSession().getAttribute("CUR_USER"));
		String[] strings=user.getU_address().split(",");
		int[] indexs=new int[strings.length];
		for(int i=0;i<strings.length;i++) {
			indexs[i]=Integer.parseInt(strings[i]);
			System.out.println(indexs[i]);
		}
		request.setAttribute("sheng", strings[0]);
		request.setAttribute("shi", strings[1]);
		return "user_personalCenter";
	}

	@RequestMapping("headerImageSetting")
	public String headerImageSetting(HttpServletRequest request) {
		String path= request.getServletContext().getRealPath("/img/user");
		String[] all=new File(path).list();
		int length=new File(path).list().length;
		String[] names=new String[4];
		for(int i=0;i<4;i++) {
			String name=all[new Random().nextInt(length)];
			names[i]=name;
		}
		request.setAttribute("names", names);
		return "user_headerImageSetting";
	}
	
	@RequestMapping("headerImageSettingDo")
	public String headerImageSettingDo(HttpServletRequest request,@RequestParam("imgUpload")CommonsMultipartFile file) {
		String pathBefore=request.getServletContext().getRealPath("/img/user");
		String flag=request.getParameter("out");
		User user=(User)(request.getSession().getAttribute("CUR_USER"));
		String fileName="userHeader.jpg";
		if("0".equals(flag)) {
			fileName=request.getParameter("inLeft");
		}else if("1".equals(flag)) {
			String rname=file.getOriginalFilename();
			fileName=UUID.randomUUID().toString()+rname.substring(rname.lastIndexOf("."));
			String path=pathBefore+File.separator+fileName;
			try {
				file.transferTo(new File(path));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		user.setU_photo(fileName);
		userService.updatePhoto(user);
		return "redirect:headerImageSetting";
	}
	
	@RequestMapping("changePassword")
	public String changePassword() {
		return "user_changePassword";
	}
	
	public User getCurrentUser(HttpServletRequest request) {
		return (User)(request.getSession().getAttribute("CUR_USER"));
	}
	
	@RequestMapping("changePasswordDo")
	public String changePasswordDo(HttpServletRequest request) {
		int u_id=getCurrentUser(request).getU_id();
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		userService.updatePassword(oldPassword,newPassword,u_id);
		return "redirect:login";
	}
	
	@RequestMapping("myMessage")
	public String myMessage() {
		return "user_myMessage";
	}

	@RequestMapping("myColl")
	public String myColl(HttpServletRequest request) {
		List<Course> courses=userService.pickCollCoursesByUid(getCurrentUser(request).getU_id());
		request.setAttribute("courses", courses); 
		return "user_myColl";
	}

	@RequestMapping("myStudy")
	public String myStudy(HttpServletRequest request) {
		List<Course> courses=userService.pickStudyCoursesByUid(getCurrentUser(request).getU_id());
		request.setAttribute("courses", courses); 
		return "user_myStudy";
	}
	
	/**
	 * 查看各个event的详细信息
	 * @param request
	 * @return
	 */
	@RequestMapping("eventDtail")
	public String eventDtail(HttpServletRequest request) {
		int event_id=Integer.parseInt(request.getParameter("event_id"));
		Event event=userService.pickEventById(event_id);
		request.setAttribute("event", event); 
		String[] path=event.getEvent_pic().split(";");
		request.setAttribute("path", path); 
		return "user_eventDtail";
	}
	/**
	 * 搜索
	 * @param request
	 * @return
	 */
	@RequestMapping("search")
	public String search(HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		request.getSession().setAttribute("keyword", keyword);
		//搜索类型
		String flag=request.getParameter("flag");
		if(flag==null) {
			flag="0";
		}
		
		String now=request.getParameter("pageNow");
		int pageNow=1;
		if(now!=null) {
			pageNow=Integer.parseInt(now);
		}
		
		if(flag=="0") {
			Pager<Event> pager = new Pager<>();
			pager.setPageNow(pageNow);
			pager.setPageSize(10);
			pager = userService.setEvent(pager,keyword);
			System.out.println(pager.getContent().toString());
			request.setAttribute("pager", pager);
			return "user_search";
		}else{
			Pager<Course> pager = new Pager<>();
			pager.setPageNow(pageNow);
			pager.setPageSize(5);
			pager = userService.setCourse(pager,keyword);
			System.out.println(pager.getContent().toString());
			request.setAttribute("pager", pager);
			return "user_searchCourse";
		}
	}

}
