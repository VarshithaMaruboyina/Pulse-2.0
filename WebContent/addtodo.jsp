<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%
session=request.getSession(false);
String gmail=(String)session.getAttribute("gmail");
out.println(gmail);
String task=request.getParameter("tod");
out.println(task);  

try{
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    PreparedStatement pstmt=con.prepareStatement("insert into todos(gmail,task,date) values(?,?,?)");
    pstmt.setString(1,gmail);
    pstmt.setString(2,task);
    pstmt.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));
    
    int n=pstmt.executeUpdate();
    if(n>0)
    {
    	response.sendRedirect("todo.jsp");
    }
    
    
    
 
	
}
catch(Exception e)
{
	System.out.println(e);
}


%>