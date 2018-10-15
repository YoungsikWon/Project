package com.cufflink.project;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.MidiDevice.Info;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/project")
public class ProjectController {
	Logger logger = Logger.getLogger(ProjectController.class);

	@Autowired
	ProjectLogic projectLogic;
	String id;
	
	public Map<String,Object> userInfo(HttpSession session, HttpServletRequest req){
		Cookie[] cookies = req.getCookies();
		for (Cookie cookie : cookies) {
			if ("id".equals(cookie.getName())) {
				id = cookie.getValue();
			}
		}
		Map<String,Object> userInfo = (Map<String,Object>)session.getAttribute(id);
		return userInfo;
	}
	
	@RequestMapping("/page")
	public String getProjectFind(Model mod, @RequestParam("pagenum") String pagenum, Map<String, Object> pMap, HttpServletRequest req, HttpSession session) {
		logger.info("ProjectFind 호출성공");
		
		// 프로젝트 --찾기--
		mod.addAttribute("ProjectFind1", projectLogic.getProjectFind1()); // 개발
		mod.addAttribute("ProjectFind2", projectLogic.getProjectFind2()); // 디자인
		mod.addAttribute("ProjectCate_ALL", projectLogic.getProject_cateALL()); // 카테고리 찍기~
		mod.addAttribute("Projectseach", projectLogic.getProjectseach());// 검색 기능
		//mod.addAttribute("getAll", projectLogic.getProAll(Integer.parseInt(pagenum))); // 페이지 네이션
		// 프로젝
		
		
		mod.addAttribute("Project", projectLogic.Project(pMap));
		if(userInfo(session, req) != null)	mod.addAttribute("kind", userInfo(session, req).get("S_KINDS"));
		// 클라이언트 히스토리 : 계약한 건들 넣어두기.
		return "Project/ProjectFind";
	}
	
	
	
	// 관심 프로젝트
	@RequestMapping("/projectSubmitted")
	public String projectSubmitted(Model m, HttpSession session, HttpServletRequest req) {
		Map<String,Object> map = userInfo(session, req);
		m.addAttribute("kind", userInfo(session, req).get("S_KINDS"));
		List<Map<String,Object>> rList = projectLogic.getState(map.get("S_EMAIL").toString(), "관심");
		m.addAttribute("getState", rList);
		return "ProjectAttention/projectSubmitted";
	}

	// 프로젝트 지원자 모집중
	@RequestMapping("/projectRecruiting")
	public String projectRecruiting(Model m, HttpSession session, HttpServletRequest req) {
		Map<String,Object> map = userInfo(session, req);
		m.addAttribute("kind", userInfo(session, req).get("S_KINDS"));
		List<Map<String,Object>> state = projectLogic.getState(map.get("S_EMAIL").toString(), "지원");
		m.addAttribute("getState", state);
		return "Project/ProjectRecruiting";
	}

	// 프로젝트 진행중인 프로젝트
	@RequestMapping("/projectContractInProgress")
	public String projectContractInProgress(Model m, HttpSession session, HttpServletRequest req) {
		Map<String,Object> map = userInfo(session, req);
		m.addAttribute("kind", userInfo(session, req).get("S_KINDS"));
		List<Map<String,Object>> rList = projectLogic.getState(map.get("S_EMAIL").toString(), "진행");
		m.addAttribute("getState", rList);
		return "Project/ProjectContractInProgress";
	}

	// 프로젝트 완료한 프로젝트
	@RequestMapping("/projectReviewContract")
	public String projectCompletedContract(Model m, HttpSession session, HttpServletRequest req) {
		Map<String,Object> map = userInfo(session, req);
		m.addAttribute("kind", userInfo(session, req).get("S_KINDS"));
		List<Map<String,Object>> rList = projectLogic.getState(map.get("S_EMAIL").toString(), "완료");
		m.addAttribute("getState", rList);
		return "Project/ProjectReviewContract";
	}
	//프로젝트 상세보기
    @RequestMapping("/View")
    public String getProjectRoom
    (Model mod, @RequestParam("pro_no") int pro_no, Map<String ,Object>pMap, HttpSession session, HttpServletRequest req) {
       mod.addAttribute("Project", projectLogic.Project(pMap));
       //mod.addAttribute("view", projectLogic.ProjectView(pro_no));
       if(userInfo(session, req) != null) mod.addAttribute("kind", userInfo(session, req).get("S_KINDS"));
       
       return "Project/ProjectRoom";
    }
    /*****************************
	    * @category 지원 목록  / 지원자 / 클라이언트 접속할 아이디
	    * @since 2018 - 10 - 15
	    **************************/
    @RequestMapping("Jiwon")
    public String project_jiwon(Model mod, @PathVariable String path, @RequestParam("s_email") String s_email,
			HttpSession session, HttpServletRequest req) {
		logger.info("partnersMyprofileMain호출성공");
		int client = projectLogic.getUserC_no(s_email);
		
		mod.addAttribute("getUserC_no", client);
		
		mod.addAttribute("JiwonList", projectLogic.pro_JiwonList(client)); //List
		mod.addAttribute("JiwonUser", projectLogic.pro_support(client)); //User
		//지원 목록
		return "Project/ProjectRecruiting";
    }
   
}
