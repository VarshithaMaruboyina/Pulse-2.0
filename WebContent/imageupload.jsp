
<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%

session=request.getSession(false);
String gmail=(String)session.getAttribute("gmail");
String path=request.getParameter("imagepath");


  
try
{
	File imagefile=new File(path);
	FileInputStream fis=new FileInputStream(imagefile);
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("eDriver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("eConnection Established"); 
   PreparedStatement pstmt=null;
   pstmt=con.prepareStatement("insert into timetable(gmail,photofile) values(?,?)");
   pstmt.setString(1,gmail);
   pstmt.setBinaryStream(2, (InputStream)fis, (int)(imagefile.length()));
   
   pstmt.executeUpdate();
    
   response.sendRedirect("image.jsp");
}   
catch(Exception e)
{
    
}   
%>