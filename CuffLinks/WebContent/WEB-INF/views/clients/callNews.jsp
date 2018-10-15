<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
String clientId = "Hw_ExZIHTAvn0VlH_Eft";//애플리케이션 클라이언트 아이디값";
String clientSecret = "2JfnFiD7Eo";//애플리케이션 클라이언트 시크릿값";
try {
    String text = URLEncoder.encode("자바", "UTF-8");
    String apiURL = "https://openapi.naver.com/v1/search/news?display=25&query="+ text; // json 결과
    //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
    URL url = new URL(apiURL);
    HttpURLConnection con = (HttpURLConnection)url.openConnection();
    con.setRequestMethod("GET");
    con.setRequestProperty("X-Naver-Client-Id", clientId);
    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    int responseCode = con.getResponseCode();
    BufferedReader br;
    if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
    } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
    }
    String inputLine;
    StringBuffer value = new StringBuffer();
    
    while ((inputLine = br.readLine()) != null) {
    	value.append(inputLine);
    }
    br.close();
    out.print(value.toString());
} catch (Exception e) {
    System.out.println(e);
}

%>