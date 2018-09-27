package com.cufflink.partners;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/partners")
public class PartnersController {
	Logger logger = Logger.getLogger(PartnersController.class);

	@Autowired
	private PartnersLogic partnersLogic;
	
	/*@RequestMapping("partnersMyprofileMain")
	public String partnersMyprofileMain(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("partnersMyprofileMain호출성공");
		mod.addAttribute("partnersMyprofileMain", partnersLogic.partnersMyprofileMain(pMap));
		return "partners/PartnersMyprofile/partnersMyprofileMain";
	}*/
	@RequestMapping("{path}")
	public String partnersMyprofileMain(Model mod,@PathVariable String path, @RequestParam Map<String,Object> pMap) {
		logger.info("partnersMyprofileMain호출성공");
		logger.info(path);
		mod.addAttribute("path",path);
		mod.addAttribute("partnersMyprofileMain", partnersLogic.partnersMyprofileMain(pMap));
		/*mod.addAttribute("partnersIntroduction", partnersLogic.partnersIntroduction(pMap));
		mod.addAttribute("partnersPortfolio", partnersLogic.partnersPortfolio(pMap));
		mod.addAttribute("partnersSKill", partnersLogic.partnersSkill(pMap));
		mod.addAttribute("partnersBackground", partnersLogic.partnersBackground(pMap));
		mod.addAttribute("partnersEvaluation", partnersLogic.partnersEvaluation(pMap));*/
		
		return "partners/PartnersMyprofile/partnersMyprofileMain";
	}
	
	
}
