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
   
   //�޴� ��
   String receiveMailAddr = "qwmnzxpo@naver.com";
   int num = (int)(Math.random()*10000+Math.random()*1000+Math.random()*100+Math.random()*10);
   String subject = "�ȳ��ϼ��� Cufflink �Դϴ�.";
   String message="<html><head></head>";
   message+="<body><table style='width: 500px; height: 500px;'><tr><td style = 'background-color:#5882FA; color:white'>"+
	        "<h1>CuffLink ���� �ڵ�</h1> </td></tr><tr><td style = 'background-color:#EFF5FB;''>"+
	        "Cufflink ����ڴ�. <b></b> ������ �̸��� �ּҸ� ���� CuffLink ���� �� ���� �������� ��û�Ǿ����ϴ�. <b></b>"+
	        "Cufflink �� �����ڵ�� ������ �����ϴ�. <b></b><center><h1>"+num+"</h1></center>"+
	        "�� �ڵ带 ��û���� �ʾҴٸ� �ٸ� ����� CuffLink ���� �� ������ <b></b>�Ϸ��� �õ� �ϴ� ���ϼ��� �ֽ��ϴ�. �������Ե� �� �ڵ带 �����ϰų� �����ϸ� �ȵ˴ϴ�. "+
	        "�����մϴ�. <b></b> Cufflink ������</td></tr></table></body></html>";
   
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
