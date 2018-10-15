package com.cufflink.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("ProjectRest")
public class ProjectRestController {

	List<Map<String, Object>> list = new ArrayList<>();

	@Autowired
	ProjectLogic projectLogic;

	@RequestMapping("categoryList")
	public List<Map<String, Object>> list(@RequestParam Map<String, Object> pMap) {
		return list;
	}

	@RequestMapping(value = "projectList", method = RequestMethod.POST)
	public List<Map<String, Object>> projectList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> cates = new ArrayList<>();
		int pageNum = Integer.parseInt((String) pMap.get("pageNum"));
		list = projectLogic.projectList(pMap);
		if (pageNum * 10 > list.size()) {
			for (int i = 10 * (pageNum - 1); i < list.size(); i++) {
				cates.add(list.get(i));
			}
		} else {
			for (int i = 10 * (pageNum - 1); i < pageNum * 10; i++) {
				cates.add(list.get(i));
			}
		}
		return cates;
	}
}
