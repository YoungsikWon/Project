package com.cufflink.project;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cufflink.partners.PartnersController;

@Controller
@RequestMapping("/Project")
public class ProjectController {
	Logger logger = Logger.getLogger(ProjectController.class);
		@Autowired
		ProjectLogic projectLogic;
		
		@RequestMapping("/page")
		public String getProjectFind(Model mod) {
			logger.info("ProjectFind 호출성공");
			mod.addAttribute("ProjectFind", projectLogic.getProjectFind());
			return "Project/ProjectFind";
		}
}
