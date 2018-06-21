package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.jdbc.Null;
import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.entity.Chapter;
import com.entity.Com;
import com.entity.Course;
import com.entity.Section;
import com.google.gson.Gson;
import com.mail.Mymail;
import com.service.IComService;

import selfUtil.StringUtil;

@Controller
@RequestMapping("com")
@SessionAttributes("CRU_COM")
public class ComController {
	@Autowired
	private IComService comService;
	
	@RequestMapping("reg")
	 public String reg() {
		return "com_regCom"; 
	 }
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping("cancel")
	public String cancel(HttpServletRequest request) {
		request.getSession().setAttribute("CUR_COM",null);
		return "redirect:login"; 
	}
	
	/**
	 * ajax验证公司名称是否已经存在
	 * @return
	 */
	@RequestMapping("checkComNameExit")
	public String checkComNameExit(HttpServletResponse response,HttpServletRequest request) {
		response.setContentType("text/html;charset=utf-8");
		String com_name=request.getParameter("com_name");
		int flag=comService.checkComNameExit(com_name)?1:0;
		System.out.println(com_name+"sdffdfffffffffffffffffffffffffffffffffffff");
		try {
			response.getWriter().write(new Gson().toJson(flag));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	@RequestMapping("regDoCom")
	public String regDo(Com com,HttpServletRequest req,@RequestParam("com_pic")CommonsMultipartFile[] files){
		String path = req.getServletContext().getRealPath("/img/com"); 
		
		for (int i = 0; i < files.length; i++) {
			if (!(files[i] != null
					&& (files[i].getOriginalFilename().indexOf(".jpg") > 0
							|| files[i].getOriginalFilename().indexOf(".gif") > 0
							|| files[i].getOriginalFilename().indexOf(".png") > 0)
					|| files[i].getOriginalFilename().indexOf(".bmp") > 0)) {
				return "redirect:reg";
			}
		}
 
		String name = files[0].getOriginalFilename();
		name = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
		com.setCom_pica(name);
		String savePath = path + File.separator + name;
		try {
			files[0].transferTo(new File(savePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		name = files[1].getOriginalFilename();
		name = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
		com.setCom_picb(name);
		savePath = path + File.separator + name;
		try {
			files[1].transferTo(new File(savePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	System.out.println("公司基本信息："+com.toString());
		req.getSession().setAttribute("REG_COM", com);
		
		return "com_regCon";
	}
	
	@RequestMapping("regDoCon")
	public String conDo (Com com ,HttpServletRequest req) {
		Com coms = (Com)(req.getSession().getAttribute("REG_COM"));
		coms.setCom_legalPhone(com.getCom_legalPhone());
		coms.setCom_legalEmail(com.getCom_legalEmail());
		coms.setCom_legalQQ(com.getCom_legalQQ());
		coms.setCom_legalUsername(com.getCom_legalUsername());
		coms.setCom_legalWechat(com.getCom_legalWechat());
		coms.setCom_legalWNickname(com.getCom_legalWNickname());
		coms.setCom_managerEmail(com.getCom_managerEmail());
		coms.setCom_managerName(com.getCom_managerName());
		coms.setCom_managerPhone(com.getCom_managerPhone());
		coms.setCom_managerQQ(com.getCom_managerQQ());
		coms.setCom_managerWechat(com.getCom_managerWechat());
		coms.setCom_managerWNickname(com.getCom_managerWNickname());
	System.out.println(com.toString());
		req.getSession().setAttribute("REG_COM", coms);
		System.out.println("联系："+coms.toString());
		return "com_regWeb";
	}
	
	@RequestMapping("regDoWeb")
	public String webDo(Com com ,HttpServletRequest req) {
		Com comx = (Com)(req.getSession().getAttribute("REG_COM"));
		comx.setCom_webContactBoo(com.getCom_webContactBoo());
		comx.setCom_webEmail(com.getCom_webEmail());
		comx.setCom_webJob(com.getCom_webJob());
		comx.setCom_webPhone(com.getCom_webPhone());
		comx.setCom_webPhoneG(com.getCom_webPhoneG());
		comx.setCom_webQQ(com.getCom_webQQ());
		comx.setCom_webUsername(com.getCom_webUsername());
		com.setCom_webWechat(com.getCom_webWechat());
		comx.setCom_webWNickname(com.getCom_webWNickname());
		req.getSession().setAttribute("REG_COM",comx);
	System.out.println("网站："+comx.toString());
		return "com_regOther";
	}
	
	@RequestMapping("regDoAther")
	public String otherDo(Com com,HttpServletRequest req) {
		Com comt = (Com)req.getSession().getAttribute("REG_COM");
		comt.setCom_subTrade(com.getCom_subTrade());
		comt.setCom_customerTrade(com.getCom_customerTrade());
		req.getSession().setAttribute("REG_COM", comt);
	System.out.println("其他："+comt.toString());
		return "com_regAudit";
	} 
	
	@RequestMapping("regAuditDo")
	public String auditDo(HttpServletRequest req) {
		System.out.println("所有："+((Com)(req.getSession().getAttribute("REG_COM"))).toString());
		boolean flag = comService.insertcom_companyRegistration((Com)(req.getSession().getAttribute("REG_COM")));
		req.getSession().invalidate();
		if(flag) {
			return	"redirect:login";
		}else {
			return	"redirect:reg";
		}
	}
	@RequestMapping("login")
	public String com_login() {
		return "com_login";
	}
	
	@RequestMapping("loginDo")
	public String loginDo(Com com,HttpServletRequest request) {
		Com comx = comService.selectcom_login(com);
		if(comx != null) {
			request.getSession().setAttribute("CUR_COM", comx);
			return "redirect:index";
		}
		return "redirect:login";
	}
	@RequestMapping("index")
	public String home () {
		return "com_index";
	}
	
	/**
	 * 忘记密码显示页面
	 */
	@RequestMapping("forgetPassword")
	public String forgetPassword() {
		return "com_forgetPassword";
	}
	
	/**
	 * 发送验证码
	 */
	@RequestMapping("sendEmail")
	public String sendEmail(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		String com_email=request.getParameter("com_email");
		String flag="1";
		String theString=StringUtil.getRandomStr(4);
		try {
			new Mymail("qin107350@163.com",com_email, "qin107350@163.com", "107350qi", "验证码", theString).sendMail();
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		}finally {
			try {
				response.getWriter().write(new Gson().toJson(flag));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		request.getSession().setAttribute("EMAIL_VAL", theString);
		return null;
	}
	
	/**
	 * 超过时长将EMAIL_VAL置空
	 */
	
	@RequestMapping("deleteEmailVal")
	public String deleteEmailVal(HttpServletRequest request,HttpServletResponse response) {
		request.getSession().setAttribute("EMAIL_VAL", "");
		return null;
	}
	
	/**
	 * 通过邮箱验证公司，忘记密码
	 */
	@RequestMapping("checkEmailVal")
	public String checkEmailVal(HttpServletRequest request,HttpServletResponse response) {
		String com_name=request.getParameter("com_name");
		String val=request.getParameter("yzm");
		String email_val=(String) request.getSession().getAttribute("EMAIL_VAL");
		if(val.equalsIgnoreCase(email_val)) {
			request.setAttribute("com_name", com_name);
			return "com_resetPassword";
		}else {
			try {
				response.getWriter().print("输入验证码超时或者输入验证码不对");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "com_resetPassword";
	}
	
	/**
	 * 重置密码的动作
	 */
	@RequestMapping("resetPasswordDo")
	public String resetPasswordDo(HttpServletRequest request,HttpServletResponse response) {
		String com_name=request.getParameter("com_name");
		String com_password=request.getParameter("com_password");
		String com_passwordAgain=request.getParameter("com_passwordAgain");
		if(com_password.equals(com_passwordAgain)) {
			boolean flag=comService.resetPassword(com_name,com_password);
			if(flag) {
				return "redirect:login";
			}
		}
		return "redirect:forgetPassword";
	}
	
	
	
	
	//Course cource,@RequestParam("file")CommonsMultipartFile[][] file,,@RequestParam("c_pic")CommonsMultipartFile file1,HttpServletRequest req
//	
	@RequestMapping("homeDoOne")
	public String homeDoOne(Course course,HttpServletRequest req,@RequestParam("c_pic")CommonsMultipartFile filec) {
		course.setC_time(StringUtil.getTimeStr().substring(0, 9));
		
		//创建的课程目录
		String path = req.getServletContext().getRealPath("/upload/course/"+course.getC_name());
		new File(path).mkdir();
		String name = filec.getOriginalFilename();
		name = UUID.randomUUID().toString()+name.substring(name.lastIndexOf("."));
		course.setC_pic(name);
		String picpath = path+File.separator+name;
		try {
			filec.transferTo(new File(picpath));
		} catch (IllegalStateException e) {	
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		req.getSession().setAttribute("addCourse", course);
//		icomservice.insertcom_companyHome(course);
		
		req.getSession().setAttribute("chapter_num", Integer.parseInt(req.getParameter("chapter_num"))+1); 
		
		return "com_homeNext";
	}
	
	
	@RequestMapping("homeDoTwo")
	public String homeDoTwo(HttpServletRequest req,@RequestParam("file")CommonsMultipartFile[] files) {
		//课程名路径
		String path = req.getServletContext().getRealPath("/upload/course/"+((Course)(req.getSession().getAttribute("addCourse"))).getC_name());
		String chapter_num="第"+req.getParameter("chapter_num")+"章";
		
		//章名
		String thechapterName=req.getParameter("chapter_name");
		//第1章 java举出
		String chapterName=chapter_num+"  "+thechapterName;
		
		Chapter chapter=new Chapter();
		chapter.setCh_title(thechapterName);
		
		//创建章的文件夹
		String zhang=path+File.separator+chapterName;
		new File(zhang).mkdir();
		
		for(CommonsMultipartFile filec:files) {
			String theName = filec.getOriginalFilename();
			String name = UUID.randomUUID().toString()+theName.substring(theName.lastIndexOf("."));
			String picpath = zhang+File.separator+name;
			try {
				filec.transferTo(new File(picpath));
				
				//将节插入到数据库
				Section section=new Section();
				section.setSection_title(theName);
				section.setSection_long("5:02");
				section.setSection_link(name);
				
				List<Section> list=chapter.getList();
				if(list==null) {
					list=new ArrayList<>();
				}
				list.add(section);
				chapter.setList(list);
				
			} catch (IllegalStateException e) {	
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		List<Chapter> list=((Course)(req.getSession().getAttribute("addCourse"))).getChapterList();
		if(list==null) {
			list=new ArrayList<>();
		}
		Course course=(Course)(req.getSession().getAttribute("addCourse"));
		list.add(chapter);
		course.setChapterList(list);
		req.getSession().setAttribute("addCourse", course);
		
		req.getSession().setAttribute("chapter_num", (Integer)(req.getSession().getAttribute("chapter_num"))+1);
		
		/**
		 * 循环上传
		 */
		
		return "com_homeNext";
	}
	
	
	@RequestMapping("uploadOver")
	public String over(HttpServletRequest req) {
		comService.insertcom_companyHome((Course)(req.getSession().getAttribute("addCourse")),((Com)req.getSession().getAttribute("CUR_COM")).getCom_id());
		System.out.println(((Course)(req.getSession().getAttribute("addCourse"))).toString());
		return "redirect:courseList";
	}
	
	/**
	 * 注意：公司查看发布的课程的时候该课程还没有审核通过时查询不到
	 * 故而需要重新写sql查询
	 * @param req
	 * @return
	 */
	@RequestMapping("courseList")
	public String companyRelease(HttpServletRequest req) {
		int com_id=((Com)(req.getSession().getAttribute("CUR_COM"))).getCom_id();
		List<Course> courseList=comService.pickCoursesByComId(com_id);
		for(Course course:courseList) {
			List<Chapter> chapterList=comService.pickChapterListById(course.getC_id());
			course.setChapterList(chapterList);
		}
		System.out.println(courseList);
		req.setAttribute("courseList", courseList);
		return "com_courseList";
	}
	
	@RequestMapping("enterStudy")
	public String enterStudy(HttpServletRequest request) {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		Course course = comService.picCourseById(c_id);
		request.setAttribute("course", course);
		return "com_enterStudy";
	}
	
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
		return "com_player";
	}
	
	/**
	 * 删除课程
	 * @param request
	 * @return
	 */
	@RequestMapping("delete")
	public String delete(HttpServletRequest request) {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		Course course=comService.picCourseById(c_id);
		boolean flag=comService.deleteCourseById(course);
		if(flag) {
			//删除课程视频、图片
			String pathname=request.getServletContext().getRealPath("/upload/course/"+course.getC_name());
			theDelete(new File(pathname));
		}
		return "redirect:courseList";
	}
	
	private void theDelete(File file) {
		if(file.isDirectory()) {
			for(File f:file.listFiles()) {
				theDelete(f);
			}
		}
		file.delete();
	}
}



