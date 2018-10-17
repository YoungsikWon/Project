package com.cufflink.android;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AndroidLogic {

	Logger logger = Logger.getLogger(AndroidLogic.class);
	
	@Autowired
	AndroidDao androidDao = null;
	
	public int Join(Map<String, Object> pMap) {
		
		int result = 0;
		
		result = androidDao.IdExit(pMap);
		if(result == 1) {
			return result;
		}
		result = androidDao.EmailExit(pMap);
		if(result == 1) {
			result = 2;
			return result;
		}
		result = androidDao.join(pMap);
		if(result == 1) {
			result = 3;
		}
		
		return result;
		
	}

	public Map<String,Object> Login(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		
		int IdExit = 0;
	
		IdExit     = androidDao.IdExit(pMap);
		
		if(IdExit==1) {
			pMap = androidDao.login(pMap);	
			return pMap;
		}
		
		return null;
	}

	public List<Map<String, Object>> GooggleMap() {
		// TODO Auto-generated method stub
		
		List<Map<String,Object>> list = androidDao.GooggleMap();
		return list;
	}

	public List<Map<String, Object>> List() {
		// TODO Auto-generated method stub
		
		List<Map<String,Object>> list = androidDao.List();
		return list;
	}

	public java.util.List<Map<String, Object>> MainList() {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = androidDao.MainPage();
		return list;
	}

	public Map<String, Object> ProjectInfo(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		Map<String,Object> list = androidDao.ProjectInfo(pMap);
		return list;
	}

	public List<Map<String, Object>> Search(Map<String, Object> pMap) {
		
		List<Map<String,Object>> list = androidDao.Search(pMap);
		return list;
	}

	public List<Map<String,Object>> ProjectAttention(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		
		List<Map<String,Object>> list = androidDao.ProjectAttention(pMap);
		return list;
	}
	public void projectAttention(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		androidDao.projectAttention(pMap);
		
	}

	public void projectcancel(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		androidDao.projectcancel(pMap);
	}
	
}
