package com.cufflink.common;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainLogic {

	Logger logger = Logger.getLogger(MainLogic.class);
	
	@Autowired
	MainDao mainDao = null;

	public List<Map<String,Object>> MainProject() {
		// TODO Auto-generated method stub
		List<Map<String,Object>> pMap = null;
		pMap = mainDao.MainProject();
		
		return pMap;
	}
	
	
	
	
}
