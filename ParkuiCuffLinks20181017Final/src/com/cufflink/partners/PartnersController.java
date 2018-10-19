package com.cufflink.partners;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	/*
	 * @RequestMapping("partnersMyprofileMain") public String
	 * partnersMyprofileMain(Model mod, @RequestParam Map<String,Object> pno) {
	 * logger.info("partnersMyprofileMain호출성공");
	 * mod.addAttribute("partnersMyprofileMain",
	 * partnersLogic.partnersMyprofileMain(pno)); return
	 * "partners/PartnersMyprofile/partnersMyprofileMain"; }
	 */
	// 쿠쿠쿠키 맛있는쿠키 가져오기
	public String getCookie(HttpServletRequest req) {
		String id = null;
		Cookie[] cookies = req.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("id".equals(cookie.getName())) {
					id = cookie.getValue();
				}
			}
		}
		return id;
	}
	
	// 파트너스 내 프로필
	// 페이지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/{path}")
	public String partnersMyprofileMain(Model mod, @PathVariable String path, @RequestParam("s_email") String s_email,
			HttpSession session, HttpServletRequest req) {
		logger.info("partnersMyprofileMain호출성공");
		int pno = partnersLogic.getUserP_no(s_email);
		mod.addAttribute("getUserP_no", pno);
		mod.addAttribute("path", path);
		mod.addAttribute("partnersMyprofileMain", partnersLogic.partnersMyprofileMain(pno));

		mod.addAttribute("e_grade", partnersLogic.e_grade(pno));
		mod.addAttribute("e_pro", partnersLogic.e_pro(pno));
		mod.addAttribute("e_avg", partnersLogic.e_avg(pno));
		mod.addAttribute("e_cate", partnersLogic.e_cate(pno));
		mod.addAttribute("e_intro", partnersLogic.e_intro(pno));

		mod.addAttribute("e_port", partnersLogic.e_port(pno));
		mod.addAttribute("e_back_car", partnersLogic.e_back_car(pno));
		mod.addAttribute("e_back_lic", partnersLogic.e_back_lic(pno));
		mod.addAttribute("e_back_edu", partnersLogic.e_back_edu(pno));
		mod.addAttribute("e_skill", partnersLogic.e_skill(pno));

		mod.addAttribute("c_eval_grade", partnersLogic.c_eval_grade(pno));
		mod.addAttribute("c_eval_cate", partnersLogic.c_eval_cate(pno));
		mod.addAttribute("c_eval_pro", partnersLogic.c_eval_pro(pno));
		mod.addAttribute("c_eval_info", partnersLogic.c_eval_info(pno));
		logger.info("여기");

		return "partners/PartnersMyprofile/partnersMyprofileMain";
	}

	// 파트너스 마이 위시캣 - 파트너스로 로그인 성공시 바로나오는
	// 페이지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/partnersMyWishket")
	public String partnersMyWishket(Model mod, HttpSession session,
			HttpServletRequest req) {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute(getCookie(req));
		int pno = partnersLogic.getUserP_no(userInfo.get("S_EMAIL").toString());
		// mod.addAttribute("partnersMyWishket",partnersLogic.partnersMyWishket(pno));
		mod.addAttribute("c_eval_pro", partnersLogic.c_eval_pro(pno));
		mod.addAttribute("c_eval_grade", partnersLogic.c_eval_grade(pno));
		mod.addAttribute("getStateProject_ing", partnersLogic.getStateProject("진행", pno));
		mod.addAttribute("getStateProject_interest", partnersLogic.getStateProject("관심", pno));
		mod.addAttribute("getStateProject_support", partnersLogic.getStateProject("지원", pno));
		mod.addAttribute("getStateProject_complete", partnersLogic.getStateProject("완료", pno));
		return "partners/partnersMyWishket";
	}

	// 파트너스 목록 페이지
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/partnersList")
//	public String partnersList(Model mod, @PathVariable String id,@RequestParam int pno , HttpSession session, HttpServletRequest req) {
	public String partnersList(Model mod, HttpSession session, HttpServletRequest req) {
		logger.info("partnersList호출성공");
		mod.addAttribute("partnersList", partnersLogic.partnersList());
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute(getCookie(req));
		if(userInfo != null) mod.addAttribute("kind", userInfo.get("S_KINDS").toString());
		return "partners/partnersList";
	}

	// 파트너스 관심
	// 프로젝트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/partnersInterestProject")
	public String partnersInterestProject(Model mod, HttpSession session,
			HttpServletRequest req) {
		logger.info("partnersInterestProject호출성공");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute(getCookie(req));
		int pno = partnersLogic.getUserP_no(userInfo.get("S_EMAIL").toString());
		mod.addAttribute("getStateProject", partnersLogic.getStateProject("관심", pno));
		mod.addAttribute("c_eval_pro", partnersLogic.c_eval_pro(pno));
		mod.addAttribute("email", userInfo.get("S_EMAIL").toString());
		return "partners/manage/partnersInterestProject";
	}

	// 파트너스
	// 지원내역@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/partnersSupportHistory")
	public String partnersSupportHistory(Model mod, @RequestParam Map<String, Object> pMap, HttpSession session,
			HttpServletRequest req) {
		logger.info("partnersSupportHistory호출성공");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute(getCookie(req));
		int pno = partnersLogic.getUserP_no(userInfo.get("S_EMAIL").toString());
		mod.addAttribute("getStateProject", partnersLogic.getStateProject("지원", pno));
		mod.addAttribute("c_eval_pro", partnersLogic.c_eval_pro(pno));
		mod.addAttribute("email", userInfo.get("S_EMAIL").toString());
		return "partners/manage/partnersSupportHistory";
	}

	// 파트너스 진행중인
	// 프로젝트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/partnersProject_ing")
	public String partnersProject_ing(Model mod, @RequestParam Map<String, Object> pMap, HttpSession session,
			HttpServletRequest req) {
		logger.info("partnersProject_ing호출성공");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute(getCookie(req));
		int pno = partnersLogic.getUserP_no(userInfo.get("S_EMAIL").toString());
		mod.addAttribute("getStateProject", partnersLogic.getStateProject("진행", pno));
		return "partners/manage/partnersProject_ing";
	}

	// 파트너스 완료된
	// 프로젝트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/partnersCompleteProject")
	public String partnersCompleteProject(Model mod, @RequestParam Map<String, Object> pMap, HttpSession session,
			HttpServletRequest req) {
		logger.info("partnersCompleteProject호출성공");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute(getCookie(req));
		int pno = partnersLogic.getUserP_no(userInfo.get("S_EMAIL").toString());
		mod.addAttribute("getStateProject", partnersLogic.getStateProject("완료", pno));
		return "partners/manage/partnersCompleteProject";
	}
	
	//파트너스 기본정보 수정@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@RequestMapping("/partnersProfile")
		public String partnersProfile(Model mod, @RequestParam Map<String,Object> pMap, HttpSession session, HttpServletRequest req) {
			logger.info("partnersProfile호출성공");
			Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute(getCookie(req));
			mod.addAttribute("info",userInfo);
			mod.addAttribute("email",userInfo.get("S_EMAIL"));
			return "partners/partnersSetting/partnersProfile";
		}
				//파트너스 계정설정 - 현금교환////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				@RequestMapping("/partnersCashExchange")
				public String partnersCashExchange() {
					return "partners/partnersSetting/partnersCashExchange";
				}
				//파트너스 계정설정 - 거래내역
				@RequestMapping("/partnersTransactionHistory")
				public String partnersTransactionHistory() {
					return "partners/partnersSetting/partnersTransactionHistory";
				}
				//파트너스 계정설정 - 비밀번호 변경
				@RequestMapping("/partnersReLogin")
				public String partnersReLogin() {
					return "partners/partnersSetting/partnersReLogin";
				}
				//파트너스 계정설정 - 알림 설정
				@RequestMapping("/partnersNotificationSetting")
				public String partnersNotificationSetting() {
					return "partners/partnersSetting/partnersNotificationSetting";
				}
				
				//파트너스 계정설정 - 회원 탈퇴
				@RequestMapping("/partnersWithdrawal")
				public String partnersWithdrawal() {
					return "partners/partnersSetting/partnersWithdrawal";
				}
}
