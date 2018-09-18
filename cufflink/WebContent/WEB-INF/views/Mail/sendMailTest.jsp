<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
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
   int num = (int)(Math.random()*10000+Math.random()*1000+Math.random()*100+Math.random()*10);
   String subject = "안녕하세요 Cufflink 입니다.";
   String message="<html><head></head>";
   message+="<body><table style='width: 500px; height: 500px;'><tr><td style = 'background-color:#5882FA; color:white'>"+
	        "<h1>CuffLink 인증 코드</h1> </td></tr><tr><td style = 'background-color:#EFF5FB;''>"+
	        "Cufflink 사용자님. <b></b> 귀하의 이메일 주소를 통해 CuffLink 계정 에 대한 엑세스가 요청되었습니다. <b></b>"+
	        "Cufflink 의 인증코드는 다음과 같습니다. <b></b><center><h1>"+num+"</h1></center>"+
	        "이 코드를 요청하지 않았다면 다른 사람이 CuffLink 계정 에 엑세스 <b></b>하려고 시도 하는 것일수도 있습니다. 누구에게도 이 코드를 전달하거나 제공하면 안됩니다. "+
	        "감사합니다. <b></b> Cufflink 계정팀</td></tr></table></body></html>";
   
   Properties props = System.getProperties();
   props.put("mail.smtp.host", smtpServer);
   props.put("mail.smtp.port", smtpPort);
   props.put("mail.smtp.auth", true);
   props.put("mail.smtp.ssl.enable", true);
   props.put("mail.smtp.ssl.trust", smtpServer);
   Session session2 = null;
   session2 = Session.getDefaultInstance(props, new Authenticator(){
      protected PasswordAuthentication getPasswordAuthentication(){
         return new PasswordAuthentication(sendId, sendPass);
      }
   });   
   
   MimeMultipart multipart  = new MimeMultipart("related");
   BodyPart messageBodyPart = new MimeBodyPart();

   messageBodyPart.setContent(message,"text/html; charset=euc-kr");
   multipart.addBodyPart(messageBodyPart);
   
   
   session2.setDebug(true);
   Message msg = new MimeMessage(session2);
   msg.setFrom(new InternetAddress(sendMailAddr));
   msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMailAddr));
   msg.setSubject(subject);
   msg.setContent(multipart);

  /*  msg.setText(message); */
   Transport.send(msg);

%>
