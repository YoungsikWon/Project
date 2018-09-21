package com.cufflink.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Project")
public class ProjectController {

		@Autowired
		ProjectLogic projectLogic;
		
		@RequestMapping("/page")
		public String proejct(Model m) {
			m.addAttribute("pro", projectLogic.getProejct());
			return "Project/PartnersList";
		}
}
