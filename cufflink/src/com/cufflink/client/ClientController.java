package com.cufflink.client;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/clients")
public class ClientController {
	
	@Autowired
	ClientLogic clientLogic;
	
	@RequestMapping("/page")
	public String page(Model m) {
		m.addAttribute("bns", clientLogic.getBNs());
		return "partners/info/partnersInfo";
	}
	
	
}
