package com.cufflink.partners;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cufflink.client.ClientLogic;
import com.cufflink.project.ProjectLogic;

@Controller
@RequestMapping("/partners")
public class PartnersController {
	
	Logger logger = Logger.getLogger(PartnersController.class);

	@Autowired
	PartnersLogic partnersLogic;
			
}
