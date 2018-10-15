package com.cufflink.android;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cufflink.client.ClientLogic;
import com.google.gson.Gson;
import com.util.HangulConversion;

@RestController
public class AndroidController {

	Logger logger = Logger.getLogger(AndroidController.class);
	
	@Autowired
	AndroidLogic androidLogic = null;
	
	@RequestMapping("/Android/Join")
	public String Join(@RequestParam Map<String, Object> pMap) {
		
		int result = 0;
		 
		pMap.put("f_id", pMap.get("j_id"));
		pMap.put("f_email", pMap.get("j_email"));
		pMap.put("f_shape","CuffLink");
		pMap.put("s_kids", String.valueOf(pMap.get("j_radio")));
		
		logger.info(pMap.get("j_radio")+"-----------------------");
		
		logger.info(pMap.put("f_id", pMap.get("j_id")));
		result = androidLogic.Join(pMap);
		if(result == 1) {
			logger.info(result);
			return "1";
			
		}
		else if (result == 2) {
			logger.info(result);
			return "2";
		}
		logger.info(result);
		
		return "3";
	}
	@RequestMapping(value = "/Android/Login",produces="text/plain;charset=UTF-8")
	public String Login(@RequestParam Map<String, Object> pMap) {
		
		logger.info("호출성공");
		int result = 0;
		String tojson = "";
		pMap = androidLogic.Login(pMap);
		Gson gson = new Gson();
		
		if(pMap == null) {
			return "1";
		}else {
			tojson = "["+gson.toJson(pMap)+"]";
			return tojson;
		}

	}
	
	@RequestMapping(value = "/Android/Search",produces="text/plain;charset=UTF-8")
	public String Search(@RequestParam Map<String, Object> pMap) {
		

		pMap.put("search", HangulConversion.toUTF((String) pMap.get("search")));
		List<Map<String,Object>> list = null;
		list = androidLogic.Search(pMap);
		
		Gson gson = new Gson();
		String toJson = "";
		toJson = gson.toJson(list);
		return toJson;

	}
	
	@RequestMapping(value = "/Android/GoogleMap",produces="text/plain;charset=UTF-8")
	public String GooggleMap() {
		
		int result = 0;
		String tojson = "";
		logger.info("GoogleMap 호출 완료");
		
		List<Map<String,Object>> list = null;
		
		list = androidLogic.GooggleMap();
		
		Gson gson = new Gson();
		tojson = gson.toJson(list);
		logger.info(tojson);
		return tojson;

	}
	
	@RequestMapping(value = "/Android/List",produces="text/plain;charset=UTF-8")
	public String List() {

		String tojson = "";
		List<Map<String,Object>> list = null;
		list = androidLogic.List();
		Gson gson = new Gson();
		tojson = gson.toJson(list);
		
		logger.info(tojson);
		return tojson;
		

	}
	
	@RequestMapping(value = "/Android/MainPage",produces="text/plain;charset=UTF-8")
	public String MainPage() {

		String tojson = "";
		List<Map<String,Object>> list = null;
		list = androidLogic.MainList();
		Gson gson = new Gson();
		
	

		tojson = gson.toJson(list);
		logger.info(tojson);
		return tojson;
		

	}
	
	@RequestMapping(value = "/Android/ProjectInfo",produces="text/plain;charset=UTF-8")
	public String ProjectInfo(@RequestParam Map<String, Object> pMap) {

		String tojson = "";
		Map<String,Object> list = null;
		list = androidLogic.ProjectInfo(pMap);
		
		Gson gson = new Gson();
		

		tojson = gson.toJson(list);
		logger.info(tojson);
		return "["+tojson+"]";
		

	}

}
