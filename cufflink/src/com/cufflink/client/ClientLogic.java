package com.cufflink.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ClientLogic {
	Logger logger = Logger.getLogger(ClientLogic.class);
	@Autowired
	ClientDao clientDao;
	
	public List<String> getBNs(){
		List<String> bns = new ArrayList<>();
		List<Map<String,Object>> list = clientDao.getClientList();
		logger.info(list);
		for (Map<String, Object> map : list) {
			bns.add((String)map.get("C_BUSINESSNUMBER"));
		}
		logger.info(bns);
		return bns;
	}
}
