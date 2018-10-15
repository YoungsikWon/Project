<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="javax.mail.*, javax.mail.internet.*, java.util.Properties" %>
<%
   String smtpServer= "smtp.naver.com";
   final String sendId = "qwmnzxpo";
   final String sendPass = "wogus7262@@";
   String sendMailAddr = "qwmnzxpo@naver.com";
   int smtpPort=465;
   
   //받는 분
   String receiveMailAddr = "qwmnzxpo@naver.com";
   String subject = "안녕하세요. 메일테스트입니다.";
  
   String content="<html>"+
		   "<head>"+
           "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"+
           "<title>Insert title here</title>"+
           "</head>"+
           "<body>"+
           "asasdasd"+
           "</body>"+
           "</html>";
   
   Properties props = System.getProperties();
   props.put("mail.smtp.host", smtpServer);
   props.put("mail.smtp.port", smtpPort);
   props.put("mail.smtp.auth", true);
   props.put("mail.smtp.ssl.enable", true);
   props.put("mail.smtp.ssl.trust", smtpServer);
   
   Session session2 = Session.getDefaultInstance(props, new Authenticator(){
      protected PasswordAuthentication getPasswordAuthentication(){
         return new PasswordAuthentication(sendId, sendPass);
      }
   });   
   session2.setDebug(true);
   Message msg = new MimeMessage(session2);
   msg.setFrom(new InternetAddress(sendMailAddr));
   msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMailAddr));
   msg.setSubject(subject);
   msg.setText(content);
   Transport.send(msg);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>