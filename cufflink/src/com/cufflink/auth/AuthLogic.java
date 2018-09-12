package com.cufflink.auth;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AuthLogic {
	Logger logger = Logger.getLogger(AuthLogic.class); 
	
	@Autowired
	public AuthDao authDao;
	
	
}
