<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

int result = (int)request.getAttribute("result");
  if(result==1){
	out.print("중복");
}
else{
	out.print("<font color='blue';>사용가능</font>");
} 
 
%>