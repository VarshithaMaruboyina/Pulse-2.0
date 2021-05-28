


<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
int id=Integer.parseInt(request.getParameter("id"));
try 
{
	 Class.forName("com.mysql.jdbc.Driver");
	    System.out.println("Driver class is loaded");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
	    System.out.println("Connection Established"); 
stmt = con.createStatement();
rs = stmt.executeQuery("select photofile from timetable where id='"+id+"' ");
if (rs.next()) 
{
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
} 
else 
{
out.println("Display Blob Example");
out.println("image not found for given ID");
return;
}
response.setContentType("image/jpg");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} 
catch (Exception e) 
{


} 


%> 