package com.cufflink.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	ProjectLogic projectLogic;
	
	@RequestMapping("/page")
	public String page(Model m) {
		m.addAttribute("pro", projectLogic.getPro());
		return "test";
	}
	
}
