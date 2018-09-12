package com.cufflink.auth;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/auth")
public class AuthController {
	Logger logger = Logger.getLogger(AuthController.class);
	
	@Autowired	
	AuthLogic authLogic;
	
	@RequestMapping("/login")
	public String login(@RequestParam Map<String,Object> pMap) {
		logger.info("login 페이지 출력");
		return "auth/login";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		logger.info("signup 페이지 출력");
		return "auth/signup";
	}
	
	@RequestMapping("/")
	public String test() {
		logger.info(authLogic);
		logger.info(authLogic.authDao);
		logger.info(authLogic.authDao.sqlSessionTemplate);
		return "test";
	}
}
