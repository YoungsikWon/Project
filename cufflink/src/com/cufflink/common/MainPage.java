package com.cufflink.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPage {
	
	@RequestMapping("/newfile")
	public String newfile() {
		return "test/NewFile";
	}
	@RequestMapping("/newfile1")
	public String newfile1() {
		return "test/NewFile1";
	}
	
	//메인화면
	@RequestMapping("/")
	public String mainpage() {
		return "common/main";
	}

	//로그인
	@RequestMapping("/login")
	public String login() {
		return "auth/login";
	}
	//로그인성공
	@RequestMapping("/loginSuccess")
	public String loginSuccess() {
		return "auth/loginSuccess";
	}
	//회원가입
	@RequestMapping("/join")
	public String join() {
		return "auth/join";
	}
	//프로젝트 찾기
	@RequestMapping("/ProjectFind")
	public String projectFind() {
		return "Project/ProjectFind";
	}
	//프로젝트 등록  파트너스 존재하지않음 XXXXXXX
	@RequestMapping("/projectRegister")
	public String projectRegister() {
		return "clients/projectRegister";
	}
	//파트너스 목록
	@RequestMapping("/PartnersList")
	public String partnersList() {
		return "Project/PartnersList";
	}	
	
//*********************************	파트너스 로그인 네비게이터 메뉴
	//관심 프로젝트
	@RequestMapping("/projectSubmitted")
	public String projectSubmitted() {
		return "/ProjectAttention/projectSubmitted";
	}
	//프로젝트 지원자 모집중
	@RequestMapping("/ProjectRecruiting")
	public String projectRecruiting() {
		return "/Project/ProjectRecruiting";
	}
	//프로젝트 진행중인 프로젝트
	@RequestMapping("/ProjectContractInProgress")
	public String projectContractInProgress() {
		return "/Project/ProjectContractInProgress";
	}
	//프로젝트 완료한 프로젝트
	@RequestMapping("/ProjectReviewContract")
	public String projectCompletedContract() {
		return "/Project/ProjectReviewContract";
	}

	//마이 커프링크
	@RequestMapping("/PartnersMyCufflink")
	public String ClientMyCufflink() {
		return "/Partners/PartnersMyCuffLink";
	}
	//---------------------------------------
	//프로젝트 파트너스 정보
	@RequestMapping("/PartnersInfo")
	public String ClientInfo() {
		return "/info/PartnersInfo";
	}
	//프로젝트 파트너스 정보등록
	@RequestMapping("/PartnersInfoUpdate")
	public String ClientInfoUpdate() {
		return "/info/PartnersInfoUpdate";
	}
	//프로젝트 프로젝트 히스토리
	@RequestMapping("/PartnersProjectHistory")
	public String ClientProjectHistory() {
		return "/Partners/PartnersProjectHistory";
	}	
	//---------------------------------------
	//계정설정 - 기본수정 
	@RequestMapping("/PartnersProfile")
	public String ParnersProfile() {
		return "/PartnersSettings/PartnersProfile";
	}
	//계정설정 - 계좌관리
	@RequestMapping("/PartnersBankAccount")
	public String PartnersBankAccount() {
		return "/PartnersSettings/PartnersBankAccount";
	}
	//계정설정 - 코인충전페이지
	@RequestMapping("/PartnersAddcoin")
	public String ClientAddcoin() {
		return "/PartnersSettings/PartnersAddcoin";
	}
	//계정설정 - 비밀번호변경
	@RequestMapping("/PartnersRelogin")
	public String PartnersRelogin() {
		return "/PartnersSettings/PartnersRelogin";
	}
	//계정설정 - 알림설정
	@RequestMapping("/PartnersNotificationSetting")
	public String PartnersNotificationSetting() {
		return "/PartnersSettings/PartnersNotificationSetting";
	}
	//계정설정 - 회원탈퇴
	@RequestMapping("/PartnersWithdrawal")
	public String ClientWithdrawal() {
		return "/PartnersSettings/PartnersWithdrawal";
	}
	//---------------------------------------
	
//*********************************	클라이언트 로그인 우측 클라이언트 정보메뉴
	
	//휴대폰을 통한 지문인식
	@RequestMapping("/fingerprint")
	public String fingerprint() {
		return "/auth/fingerprint";
	}
	//비밀번호찾기
	@RequestMapping("/idpassfind")
	public String idpassfind() {
		return "/auth/idpassfind";
	}
	//qr코드
	@RequestMapping("/qrcode")
	public String qrcode() {
		return "/auth/qrcode";
	}
	//채팅화면
	@RequestMapping("/chat")
	public String chat() {
		return "/chat/chat";
	}
	
//*********************************	클라이언트 관리자 화면
	//관리자 로그인 화면
	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	//관리자 메인화면
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "/admin/adminMain";
	}
	//관리자 비밀번호찾기
	@RequestMapping("/adminLoginFind")
	public String adminLoginFind() {
		return "/admin/adminLoginFind";
	}
		
//*********************************	클라이언트 관리자 화면		


}
