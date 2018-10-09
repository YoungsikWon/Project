package com.cufflink.project;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("ProjectRest")
public class ProjectRestController {
	
	List<Map<String,Object>> list = new ArrayList<>();
	@RequestMapping("categoryList")
	public List<Map<String,Object>>	list (@RequestParam Map<String,Object> pMap){
		
		return list; 
	}
}
