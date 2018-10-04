package com.cufflink.project;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/Project")
public class ProjectController {
	Logger logger = Logger.getLogger(ProjectController.class);
		@Autowired
		ProjectLogic projectLogic;
		
		@RequestMapping("/page")
		public String getProjectFind(Model mod, @RequestParam("pagenum") String pagenum) {
			logger.info("ProjectFind 호출성공");
			mod.addAttribute("ProjectFind1", projectLogic.getProjectFind1()); //개발
			mod.addAttribute("ProjectFind2", projectLogic.getProjectFind2()); //디자인
			mod.addAttribute("Project", projectLogic.getProject()); //전체 프로젝트 정리.
			mod.addAttribute("ProjectCate_ALL", projectLogic.getProject_cateALL()); //카테고리 찍기~
			mod.addAttribute("getAll", projectLogic.getProAll(Integer.parseInt(pagenum))); //카테고리 찍기~
			return "Project/ProjectFind";
		}
		
}
