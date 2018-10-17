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
		
		//���̵� �����ϸ�  ��й�ȣ�� �´��� ó��
		//-1 ���̵� ���� 0 ��й�ȣ������ 1�̸� ����
		
		if(IdExit==1) {
			pMap = clientDao.login(pMap);
			return pMap;
		
		}
		//���̵� �������� �ʴٰ� ó���Ѵ� .
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
		logger.info("onMapLogic ȣ�� ����");
		List<Map<String,Object>> onMapList =  clientDao.onMapReady();
		return onMapList;
	}

	public Map<String, Object> Modify(String s_email) {
		// TODO Auto-generated method stub
		int result = clientDao.ModifyEmailCheck(s_email);
		Map<String, Object> pMap = null;
		logger.info(result);
		//���࿡ ù�����̶�� Insert
		
	    if(result == 0) {
	    	clientDao.ClientInsert(s_email);
	    	return null;
		}
	    //������ ������ �����´�.!!
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
	/***********수정20181017시작***********/
	public Map<String,Object> getUser(String kinds, String email){
		Map<String,Object> map = clientDao.getUser(kinds, email);
		return map;
	}
	/***********수정20181017끝***********/
}
