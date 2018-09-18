package com.cufflink.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPage {
	
	//테스트화면
	@RequestMapping("/Flexbox")
	public String Flexbox() {
		return "test/Flexbox";
	}
	@RequestMapping("/newfile")
	public String newfile() {
		return "test/newfile";
	}
	@RequestMapping("/newfile1")
	public String newfile1() {
		return "test/newfile1";
	}
	@RequestMapping("/newfile3")
	public String newfile3() {
		return "test/newfile3";
	}
	@RequestMapping("/newfile2")
	public String newfile2() {
		return "test/newfile2";
	}
	@RequestMapping("/newfile4")
	public String newfile4() {
		return "test/newfile4";
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
	@RequestMapping("/projectFind")
	public String projectFind() {
		return "clients/projectFind";
	}
	//프로젝트 등록
	@RequestMapping("/projectRegister")
	public String projectRegister() {
		return "clients/projectRegister";
	}
	//파트너스 목록
	@RequestMapping("/partnersList")
	public String partnersList() {
		return "partners/partnersList";
	}	
	
//*********************************	클라이언트 로그인 네비게이터 메뉴
	//프로젝트 검수중
	@RequestMapping("/projectSubmitted")
	public String projectSubmitted() {
		return "/clients/manage/project/projectSubmitted";
	}
	//프로젝트 지원자 모집중
	@RequestMapping("/projectRecruiting")
	public String projectRecruiting() {
		return "/clients/manage/projectRecruiting";
	}
	//프로젝트 진행중인 프로젝트
	@RequestMapping("/projectContractInProgress")
	public String projectContractInProgress() {
		return "/clients/manage/projectContractInProgress";
	}
	//프로젝트 종료된 프로젝트
	@RequestMapping("/projectReviewContract")
	public String projectReviewContract() {
		return "/clients/manage/projectReviewContract";
	}
//*********************************	클라이언트 로그인 네비게이터 메뉴
	
//*********************************	클라이언트 로그인 네비게이터 검수 하위메뉴
	//프로젝트 검수중
	//네비게이터의 검수중메뉴와 동일
	
	//프로젝트 임시저장
	@RequestMapping("/projectSaved")
	public String projectSaved() {
		return "/clients/manage/project/projectSaved";
	}
	//프로젝트 등록실패
	@RequestMapping("/projectRejected")
	public String projectRejected() {
		return "/clients/manage/project/projectRejected";
	}
//*********************************	클라이언트 로그인 네비게이터 검수 하위메뉴	
	
//*********************************	클라이언트 로그인 네비게이터 검수 하위메뉴
	//프로젝트 종료된 프로젝트
	//네비게이터의 종료된 프로젝트 메뉴와 동일
	
	//프로젝트 완료된 프로젝트
	@RequestMapping("/projectCompletedContract")
	public String projectCompletedContract() {
		return "/clients/manage/projectCompletedContract";
	}
	//프로젝트 취소한 프로젝트
	@RequestMapping("/projectCancelledProject")
	public String projectCancelledProject() {
		return "/clients/manage/projectCancelledProject";
	}
//*********************************	클라이언트 로그인 네비게이터 검수 하위메뉴	
	
//*********************************	클라이언트 로그인 우측 클라이언트 정보메뉴	

	//마이 커프링크
	@RequestMapping("/ClientMyCufflink")
	public String ClientMyCufflink() {
		return "/clients/ClientMyCufflink";
	}
	//---------------------------------------
	//프로젝트 클라이언트 정보
	@RequestMapping("/ClientInfo")
	public String ClientInfo() {
		return "/clients/info/ClientInfo";
	}
	//프로젝트 클라이언트 정보등록
	@RequestMapping("/ClientInfoUpdate")
	public String ClientInfoUpdate() {
		return "/clients/info/ClientInfoUpdate";
	}
	//프로젝트 프로젝트 히스토리
	@RequestMapping("/ClientProjectHistory")
	public String ClientProjectHistory() {
		return "/clients/ClientProjectHistory";
	}	
	//---------------------------------------
	//계정설정 - 기본수정 
	@RequestMapping("/ClientProfile")
	public String ClientProfile() {
		return "/auth/clientSettings/ClientProfile";
	}
	//계정설정 - 계좌관리
	@RequestMapping("/ClientBankAccount")
	public String ClientBankAccount() {
		return "/auth/clientSettings/ClientBankAccount";
	}
	//계정설정 - 코인충전페이지
	@RequestMapping("/ClientAddcoin")
	public String ClientAddcoin() {
		return "/auth/clientSettings/ClientAddcoin";
	}
	//계정설정 - 비밀번호변경
	@RequestMapping("/ClientRelogin")
	public String ClientRelogin() {
		return "/auth/clientSettings/ClientRelogin";
	}
	//계정설정 - 알림설정
	@RequestMapping("/ClientNotificationSetting")
	public String ClientNotificationSetting() {
		return "/auth/clientSettings/ClientNotificationSetting";
	}
	//계정설정 - 회원탈퇴
	@RequestMapping("/ClientWithdrawal")
	public String ClientWithdrawal() {
		return "/auth/clientSettings/ClientWithdrawal";
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
