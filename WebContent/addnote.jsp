<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try{
String s=request.getParameter("text");
session=request.getSession(false);
String gmail=(String)session.getAttribute("gmail");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("eDriver class is loaded");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
System.out.println("eConnection Established");
PreparedStatement pstmt=con.prepareStatement("insert into notes(gmail,text) values(?,?)");
pstmt.setString(1,gmail);
pstmt.setString(2,s);
pstmt.executeUpdate();
response.sendRedirect("about.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}

%>