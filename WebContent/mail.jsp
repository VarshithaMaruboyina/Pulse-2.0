<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
session=request.getSession(false);
String gmail=(String)session.getAttribute("gmail");
String name=(String)session.getAttribute("name");
String text=request.getParameter("t");
String date=request.getParameter("d");
String month=request.getParameter("m");
String year=request.getParameter("y");
String hour=request.getParameter("h");
String min=request.getParameter("mi");
















String user ="pulsetimey19@gmail.com";
          
          String pass ="Pulse@y19"; 
          
          String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
          
          String to =gmail; 

          String from ="pulsetimey19@gmail.com";

          String subject ="Remainder you created now . dont forget to do that task on that day!!!";
          
          String messageText ="<h1>Hii "+name+" <h2>text:"+text+"</h2>  <h2>date:"+date+"-"+month+"-"+year+"</h2><h2>time:"+hour+":"+min+"</h2> <h4>       -Team Pulse</h4>";  // you can use HTML tags also
          boolean sessionDebug = true;
          String host = "smtp.gmail.com";
Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
transport.sendMessage(msg, msg.getAllRecipients());       
response.sendRedirect("reminder.jsp");

%>