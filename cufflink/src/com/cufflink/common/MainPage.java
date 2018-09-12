package com.cufflink.common;


import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MainPage {
	Logger logger = Logger.getLogger(MainPage.class);
	
	@RequestMapping("/")
	public String mainpage() {
		return "common/main";
	}	
	
	@RequestMapping("/file")
	public String file() {
		return "common/fileTest";
	}
	
}
