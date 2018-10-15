package com.cufflink.auth;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/AuthRest")
public class AuthRestController {

	@Autowired
	AuthLogic authLogic;
	List<Map<String,Object>> list = new ArrayList<>();
	
	@RequestMapping(value="/emailList", method=RequestMethod.POST)
	public List<Map<String,Object>> getEmailList(@RequestParam("pro_no") int pro_no) {
		list = authLogic.getEmailList(pro_no);
		return list;
	}
}
