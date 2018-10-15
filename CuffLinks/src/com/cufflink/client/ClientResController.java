package com.cufflink.client;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.util.HangulConversion;


@RestController
public class ClientResController {

Logger logger = Logger.getLogger(ClientResController.class);
	
	@Autowired
	ClientLogic clientLogic = null;
	
	@RequestMapping(value = "/client/modify",produces="text/plain;charset=UTF-8")
	public String onMapReady(@RequestParam("s_email") String s_email) {
		
		Map<String,Object> pMap = clientLogic.Modify(s_email);
		String toJSON = null;
		Gson gson = new Gson();
		toJSON = gson.toJson(pMap);

		logger.info(toJSON);
		
		return "["+toJSON+"]";
		
	}
	@RequestMapping(value = "/client/PwModify",produces="text/plain;charset=UTF-8")
	public String PwModify(@RequestParam Map<String,Object>pMap) {


		int result = 0;
		result = clientLogic.PwModify(pMap);
	
		return String.valueOf(result);

	}
	
	@RequestMapping("/client/UserExcape")
	public String UserExcape(@RequestParam Map<String,Object>pMap) {

		int result = 0;
           result = clientLogic.UserExcape(pMap);

		return String.valueOf(result);

	}

	
}
