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
		
		@RequestMapping("{path}")
		public String ProjectFind(Model mod,@PathVariable String path, @RequestParam Map<String,Object> pMap) {
			logger.info("ProjectFind 호출성공");
			logger.info(path);
			mod.addAttribute("path", path);
			mod.addAttribute("ProjectFind", projectLogic.getProjectFind(pMap));
			
			
			
			return "Project/ProjectFind";
		}
}
