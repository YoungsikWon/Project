package com.cufflink.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthLogic {

	@Autowired
	AuthDao authDao;
	
	List<Map<String, Object>> list = new ArrayList<>();

	public List<Map<String,Object>> getProjectList(String email) {
		list = authDao.projectList(email);
		return list;
	}
	
	public List<Map<String,Object>> getEmailList(int pro_no) {
		list = authDao.emailList(pro_no);
		return list;
	}
}
