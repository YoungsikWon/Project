package com.cufflink.partners;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Test {
	
	@Autowired
	PartnersLogic partnersLogic;
	
	@RequestMapping("/test/test")
	public List<Map<String,Object>> test (){
		return partnersLogic.partnersList();
	}
	
	@RequestMapping("Hello")
	public List<Map<String,Object>> a() {
		return partnersLogic.partnersList();
	}
}
