package com.cufflink.client;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientLogic {
	
	Logger logger = Logger.getLogger(ClientLogic.class);
	@Autowired
	ClientDao clientDao = null;
	
	public int Idcheck(Map<String,Object> pMap) {
		
		return clientDao.IdExit(pMap);
	}
	
	public Map<String,Object> ClientLogin(Map<String,Object> pMap) {
		int IdExit = 0;
		IdExit     = clientDao.IdExit(pMap);
		
		//아이디가 존제하면  비밀번호도 맞는지 처리
		//-1 아이디가 없음 0 비밀번호가없음 1이면 성공
		
		if(IdExit==1) {
			pMap = clientDao.login(pMap);
			return pMap;
		
		}
		//아이디가 존제하지 않다고 처리한다 .
		pMap.put("Idcheck", -1);
		return pMap;
		
		
	}


	public int join(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		int IdExit = 0;
		clientDao.join(pMap);
		return IdExit;
		
	}

	public int Njoin(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		int IdExit = 0;
		clientDao.Njoin(pMap);
		return IdExit;
		
	}
	public int Emailcheck(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return  clientDao.EmailExit(pMap);
	}

	public int NaverCapchar(Map<String, Object> pMap) {
		
		
		pMap.put("f_email", pMap.get("j_email"));
		int result = clientDao.EmailExit(pMap);

		return result;
		
	}

	public String proc_board_test(Map<String, Object> pMap) {
		// TODO Auto-generated method stub

		int result = 0;
		String msg = null;
		clientDao.proc_board_test(pMap);
		
		return "";
	}

	public int UserUpdate(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		int result = 0;
		result = clientDao.UserUpdate(pMap);
		
		return result;
	}

	public Map<String,Object> UserInfoEmail(Map<String, Object> pMap) {
		
		Map<String,Object> map = null;
		
		map = clientDao.UserInfoEmail(pMap);
		
		return map;
		// TODO Auto-generated method stub
		
	}

	public List<Map<String, Object>> onMapReady() {
		// TODO Auto-generated method stub
		logger.info("onMapLogic 호출 성공");
		List<Map<String,Object>> onMapList =  clientDao.onMapReady();
		return onMapList;
	}

	public Map<String, Object> Modify(String s_email) {
		// TODO Auto-generated method stub
		int result = clientDao.ModifyEmailCheck(s_email);
		Map<String, Object> pMap = null;
		logger.info(result);
		//만약에 첫수정이라면 Insert
		
	    if(result == 0) {
	    	clientDao.ClientInsert(s_email);
	    	return null;
		}
	    //유저의 정보를 가져온다.!!
		else if(result == 1) {
			pMap = clientDao.Modify(s_email);
			return pMap;
		}
		
		return pMap;
	}

	public int PwModify(Map<String,Object>pMap) {
        
		String result = "";
		int    value  = 0;
		result = clientDao.Pwcheck(pMap);
	
		if(result.equals(pMap.get("pw1"))) {
			value = clientDao.PwUpdate(pMap);
			return value;
		}

		return 0;
	}

	public int UserExcape(Map<String, Object> pMap) {

		int result = 0;
		result = clientDao.UserExcape(pMap);
		
		return result;
	}

	public void projectRegister1(Map<String, Object> pMap) {
		
		clientDao.projectRegister1(pMap);
	}
	
}
