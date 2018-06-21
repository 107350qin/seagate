package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Admin;
import com.entity.Chapter;
import com.entity.Course;
import com.entity.Event;
import com.entity.Section;
import com.service.IAdminService;
import com.service.IComService;

import selfUtil.Pager;
import selfUtil.StringUtil;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private IAdminService adminService;
	@Autowired
	private IComService comService;

	/**
	 * 管理员管理数据部分开始
	 * @return
	 */
	
	/**
	 * 管理员登陆页面显示
	 * @return
	 */
	@RequestMapping("login")
	public String login() {
		return "admin_login";
	}

	/**
	 * 管理员登陆执行动作
	 * @param admin
	 * @param request
	 * @return
	 */
	@RequestMapping("loginDo")
	public String loginDo(Admin admin, HttpServletRequest request) {
		Admin ADMIN = adminService.login(admin);
		if (ADMIN != null) {
			request.getSession().setAttribute("CUR_ADMIN", ADMIN);
			return "redirect:index";
		}
		System.out.println("如果我是DJ");
		return "redirect:login";

	}
	
	/**
	 * 管理员退出登陆
	 * @param request
	 * @return
	 */
	@RequestMapping("cancel")
	public String cancel(HttpServletRequest request) {
		request.getSession().setAttribute("CUR_ADMIN", null);
		return "redirect:login";
		
	}
	
	/**
	 * 管理员搜索内容
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
		Pager<Event> pager = new Pager<>();
		String now=request.getParameter("pageNow");
		int pageNow=1;
		if(now!=null) {
			pageNow=Integer.parseInt(now);
		}
		pager.setPageNow(pageNow);
		if(flag=="0") {
			pager.setPageSize(10);
			pager = adminService.setEvent(pager,keyword);
			System.out.println(pager.getContent().toString());
			request.setAttribute("pager", pager);
			return "admin_searchEvent";
		}else{
			pager.setPageSize(5);
			pager = adminService.setCourse(pager,keyword);
			System.out.println(pager.getContent().toString());
			request.setAttribute("pager", pager);
			return "admin_searchCourse";
		}
		
	}

	/**
	 * 分页工具方法
	 * @param pager
	 * @param pageNow
	 * @return
	 */
	public Pager getPager(Pager<Event> pager, String pageNow) {
		if (!StringUtil.isNotNull(pageNow)) {
			pageNow = "1";
		}
		pager.setPageNow(Integer.parseInt(pageNow));
		pager.setPageSize(10);
		return pager;
	}

	/**
	 * 管理员主页
	 * @param request
	 * @return
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		String pageNow = request.getParameter("pageNow");
		Pager<Event> pager = new Pager<>();
		pager = getPager(pager, pageNow);
		pager = adminService.setEvent(pager,1);
		request.setAttribute("pager", pager);
		return "admin_index";
	}

	/**
	 * 添加事件的界面
	 * @return
	 */
	@RequestMapping("addEvent")
	public String addNotice() {
		return "admin_addEvent";
	}

	/**
	 * 添加事件的动作
	 * @param files
	 * @param request
	 * @param event
	 * @return
	 */
	@RequestMapping(value = "addEventDo")
	public String addEventDo(@RequestParam("files") MultipartFile[] files, HttpServletRequest request, Event event) {
		// 存放路径
		StringBuffer sb = new StringBuffer();

		String path = request.getServletContext().getRealPath("/img/event");
		for (int i = 0; i < files.length; i++) {
			if (files[i] != null
					&& (files[i].getOriginalFilename().indexOf(".jpg") > 0
							|| files[i].getOriginalFilename().indexOf(".gif") > 0
							|| files[i].getOriginalFilename().indexOf(".png") > 0)
					|| files[i].getOriginalFilename().indexOf(".bmp") > 0) {
				String name = files[i].getOriginalFilename();
				name = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
				sb.append(name + ";");
				String savePath = path + File.separator + name;
				try {
					files[i].transferTo(new File(savePath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		// 设置event的图片
		event.setEvent_pic(sb.toString());

		// 判断是那种类型的内容
		String index = event.getEvent_boo();
		if (!("1".equals(index) || "2".equals(index) || "3".equals(index) || "4".equals(index))) {
			return "redirect:addEvent";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(System.currentTimeMillis());
		event.setEvent_time(now);

		/**
		 * 保持原来的内容格式
		 */
		event.setEvent_content("<pre>"+event.getEvent_content()+"</pre>");
		
		adminService.addEventDo(event);
		if ("1".equals(index)) {
			return "redirect:index";
		} else if ("2".equals(index)) {
			return "redirect:latestInfo";
		} else if ("3".equals(index)) {
			return "redirect:marketActivity";
		} else if ("4".equals(index)) {
			return "redirect:incentivePlan";
		}
		return "redirect:index";
	}

	/**
	 * 修改事件的页面
	 * @param request
	 * @return
	 */
	@RequestMapping("changeEvent")
	public String changeEvent(HttpServletRequest request) {
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		Event event = adminService.selectEventById(event_id);
		event.setEvent_content(event.getEvent_content().substring(5, event.getEvent_content().length()-6));
		event.setEvent_time(event.getEvent_time().substring(0, event.getEvent_time().length()-2));
		request.setAttribute("event", event);
		List<String> path = new ArrayList<>();
		if (StringUtil.isNotNull(event.getEvent_pic())) {
			for (String string : event.getEvent_pic().split(";")) {
				path.add(string);
			}
			request.setAttribute("path", path);
		}
		return "admin_changeEvent";
	}

	/**
	 * 修改事件的动作
	 * @param files
	 * @param request
	 * @param event
	 * @return
	 */
	@RequestMapping("changeEventDo")
	public String changeEventDo(@RequestParam("files") MultipartFile[] files, HttpServletRequest request, Event event) {
		// 新上传的图片
		StringBuffer sb = new StringBuffer();

		String path = request.getServletContext().getRealPath("/img/event");
		for (int i = 0; i < files.length; i++) {
			if (files[i] != null
					&& (files[i].getOriginalFilename().indexOf(".jpg") > 0
							|| files[i].getOriginalFilename().indexOf(".gif") > 0
							|| files[i].getOriginalFilename().indexOf(".png") > 0)
					|| files[i].getOriginalFilename().indexOf(".bmp") > 0) {
				String name = files[i].getOriginalFilename();
				name = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
				sb.append(name + ";");
				String savePath = path + File.separator + name;
				try {
					files[i].transferTo(new File(savePath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		// 之前没有删除的图片
		String newPic =adminService.selectEventById(event.getEvent_id()).getEvent_pic();
		if(!"".equals(sb.toString())) {
			newPic += sb.toString();
		}
		// 设置event的图片
		event.setEvent_pic(newPic);
		event.setEvent_content("<pre>"+event.getEvent_content()+"</pre>");
		adminService.changeEventById(event);
		return "redirect:changeEvent?event_id=" + event.getEvent_id();
	}

	/**
	 * 删除事件
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteEvent")
	public String deleteEvent(HttpServletRequest request) {
		/**
		 * 先删除、event里面的图片，再删除数据库中的数据
		 */
		int enent_id=Integer.parseInt(request.getParameter("event_id"));
		String picName=adminService.selectEventById(enent_id).getEvent_pic();
		if(StringUtil.isNotNull(picName)) {
			String[] strings=picName.split(";");
			for(String string:strings) {
				String picPath=request.getServletContext().getRealPath("/img/event")+File.separator+string;
				new File(picPath).delete();
			}
		}
		adminService.deleteEvent(enent_id);
		
		if("1".equals(request.getParameter("boo"))) {
			return "redirect:search?keyword="+request.getSession().getAttribute("keyword");
		}
		int flag = Integer.parseInt(request.getParameter("event_boo"));
		if (flag == 1) {
			return "redirect:index";
		} else if (flag == 2) {
			return "redirect:latestInfo";
		} else if (flag == 3) {
			return "redirect:marketActivity";
		} else if (flag == 4) {
			return "redirect:incentivePlan";
		}
		return "redirect:index";
	}

	/**
	 * 删除某一个事件的一张图片
	 * @param request
	 * @return
	 */
	@RequestMapping("deletePicOfEvent")
	public String deletePicOfEvent(HttpServletRequest request) {
		Event event = adminService.selectEventById(Integer.parseInt(request.getParameter("event_id")));
		StringBuffer sb = new StringBuffer();
		String pic = request.getParameter("pic");
		for (String string : event.getEvent_pic().split(";")) {
			if (!pic.equals(string)) {
				sb.append(string + ";");
			}else {
				new File(request.getServletContext().getRealPath("/img/event")+File.separator+string).delete();
			}
		}
		event.setEvent_pic(sb.toString());
		adminService.updatePicOfEvent(event);
		return "redirect:changeEvent?event_id=" + event.getEvent_id();
	}

	/**
	 * 查看事件的具体内容
	 * @param request
	 * @return
	 */
	@RequestMapping("eventDetail")
	public String eventDetail(HttpServletRequest request) {
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		Event event = adminService.selectEventById(event_id);
		event.setEvent_time(event.getEvent_time().substring(0, event.getEvent_time().length()-2));
		request.setAttribute("event", event);
		List<String> path = new ArrayList<>();
		if (StringUtil.isNotNull(event.getEvent_pic())) {
			for (String string : event.getEvent_pic().split(";")) {
				path.add(string);
			}
			request.setAttribute("path", path);
		}
		return "admin_eventDetail";
	}

	/**
	 * 管理员主页搞定，以下就简单了
	 */
	/**
	 * 最新消息
	 * @param request
	 * @return
	 */
	@RequestMapping("latestInfo")
	public String latestInfo(HttpServletRequest request) {
		String pageNow = request.getParameter("pageNow");
		Pager<Event> pager = new Pager<>();
		pager = getPager(pager, pageNow);
		pager = adminService.setEvent(pager, 2);
		request.setAttribute("pager", pager);
		return "admin_latestInfo";
	}
	/**
	 * 市场活动
	 * @param request
	 * @return
	 */
	@RequestMapping("marketActivity")
	public String marketActivity(HttpServletRequest request) {
		String pageNow = request.getParameter("pageNow");
		Pager<Event> pager = new Pager<>();
		pager = getPager(pager, pageNow);
		pager = adminService.setEvent(pager, 3);
		request.setAttribute("pager", pager);
		return "admin_marketActivity";
	}
	/**
	 * 奖励计划
	 * @param request
	 * @return
	 */
	@RequestMapping("incentivePlan")
	public String incentivePlan(HttpServletRequest request) {
		String pageNow = request.getParameter("pageNow");
		Pager<Event> pager = new Pager<>();
		pager = getPager(pager, pageNow);
		pager = adminService.setEvent(pager, 4);
		request.setAttribute("pager", pager);
		return "admin_incentivePlan";
	}

	/**
	 * 下面是轮播图片的显示
	 */
	@RequestMapping("lunbo")
	public String lunbo(HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/img/lunbo");
		request.setAttribute("list", new File(path).listFiles());
		return "admin_lunbo";
	}
	/**
	 * 删除轮播中的某一张图片
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteLunboPic")
	public String deleteLunboPic(HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/img/lunbo");
		String fileName=request.getParameter("name");
		for(String string:new File(path).list()) {
			if(string.equals(fileName)) {
				new File(path+File.separator+fileName).delete();
			}
		}
		request.setAttribute("list", new File(path).listFiles());
		return "admin_lunbo";
	}
	/**
	 * 添加一张轮播图片
	 * @param files
	 * @param request
	 * @return
	 */
	@RequestMapping("addLunboPic")
	public String addLunboPic(@RequestParam("files") MultipartFile[] files,HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/img/lunbo");
		
		for (int i = 0; i < files.length; i++) {
			if (files[i] != null
					&& (files[i].getOriginalFilename().indexOf(".jpg") > 0
							|| files[i].getOriginalFilename().indexOf(".gif") > 0
							|| files[i].getOriginalFilename().indexOf(".png") > 0)
					|| files[i].getOriginalFilename().indexOf(".bmp") > 0) {
				String name = files[i].getOriginalFilename();
				name = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
				String savePath = path + File.separator + name;
				try {
					files[i].transferTo(new File(savePath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		request.setAttribute("list", new File(path).listFiles());
		return "admin_lunbo";
	}
	
	/**
	 * 课程审核列表
	 */
	@RequestMapping("check")
	public String check(HttpServletRequest request) {
		//是否通过审核 -1不管，0未通过审核 1通过审核
		int isPass=Integer.parseInt(request.getParameter("isPass"));
		//级别 0代表没有级别分类  1初级 2中级 3高级
		int rank=Integer.parseInt(request.getParameter("rank"));
		//第几页
		String now=request.getParameter("pageNow");
		int pageNow=1;
		if(now!=null) {
			pageNow=Integer.parseInt(now);
		}
		Pager<Course> pager=new Pager<>();
		pager.setPageNow(pageNow);
		pager=adminService.pickCourses(pager,isPass,rank);
		System.out.println("列表："+pager.getContent().toString());
		request.setAttribute("pager", pager);
		request.setAttribute("isPass", isPass);
		request.setAttribute("rank", rank);
		return "admin_checkList";
	}
	
	/**
	 * 课程审核
	 */
	@RequestMapping("pass")
	public String pass(HttpServletRequest request) {
		//如果查询语句有map则必须加上<id>
		
		int c_id=Integer.parseInt(request.getParameter("c_id"));
		int pass=Integer.parseInt(request.getParameter("pass"));
		adminService.pass(c_id,pass);
		
		int isPass=Integer.parseInt(request.getParameter("isPass"));
		int rank=Integer.parseInt(request.getParameter("rank"));
		int pageNow=Integer.parseInt(request.getParameter("pageNow"));
		return "redirect:check?isPass="+isPass+"&rank="+rank+"&pageNow="+pageNow;
	}
	
	/**
	 * 管理员查看课程细节
	 */
	@RequestMapping("enterStudy")
	public String enterStudy(HttpServletRequest request) {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		Course course = adminService.picCourseById(c_id);
		System.out.println("管理员查看细节："+course.toString());
		request.setAttribute("course", course);
		return "admin_enterStudy";
	}
	/**
	 * 管理员查看课程细节时的审核
	 */
	@RequestMapping("detailPass")
	public String detailPass(HttpServletRequest request) {
		int c_id=Integer.parseInt(request.getParameter("c_id"));
		int pass=Integer.parseInt(request.getParameter("pass"));
		System.out.println(c_id+"------------------/////+"+pass);
		adminService.pass(c_id,pass);
		return "redirect:enterStudy?c_id="+c_id;
	}
	/**
	 * 管理员播放视频
	 */
	@RequestMapping("startStudy")
	public String startStudy(HttpServletRequest request) {
		int section_id = 1;
		if (request.getParameter("section_id") != null) {
			section_id = Integer.parseInt(request.getParameter("section_id"));
			Section section = comService.pickSectionById(section_id);
			request.setAttribute("section", section);
		}

		int c_id = Integer.parseInt(request.getParameter("c_id"));
		Course course = comService.picCourseById(c_id);
		request.setAttribute("course", course);

		int index = 1;
		if (request.getParameter("index") != null) {
			index = Integer.parseInt(request.getParameter("index"));
		}
		request.setAttribute("index", index);
		// 差章的名字
		Chapter chapter = comService.pickChapterBySectionId(section_id);
		request.setAttribute("chapter", chapter);
		return "admin_player";
	}
	
	/**
	 * 管理员管理数据部分结束
	 */
}


/**
 * 问题：pickCourses中0,1,2,3为什么不能传递参数，非得加上@param
 * 问题:jqurey的导航栏ul下面的li下面的第一个元素只能用户span，用a或者span包裹着a都不行
 * ajax导航
 * aop实现拦截器
 */
