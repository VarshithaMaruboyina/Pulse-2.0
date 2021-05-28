<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    
   <%
   int id=Integer.parseInt(request.getParameter("id"));
   try{
		Connection con = null;
	    Class.forName("com.mysql.jdbc.Driver");
	    System.out.println("Driver class is loaded");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
	    System.out.println("Connection Established"); 
	    PreparedStatement pstmt=con.prepareStatement("select * from todos where tid=?");
	    pstmt.setInt(1,id);
	    ResultSet rs=pstmt.executeQuery();
	    PreparedStatement pstmt1=con.prepareStatement("insert into completed values(?,?,?,?)");
	    if(rs.next())
	    {
	    pstmt1.setInt(1,rs.getInt(1));
	    pstmt1.setString(2,rs.getString(2));
	    pstmt1.setString(3,rs.getString(3));
	    pstmt1.setDate(4,rs.getDate(4));
	    int n=pstmt1.executeUpdate();
	    if(n>0)
	    {
	    	 PreparedStatement pstmt2=con.prepareStatement("delete from todos where tid=?");
	    	 pstmt2.setInt(1,id);
	    	 pstmt2.executeUpdate();
	    }
	    
	    response.sendRedirect("todo.jsp");
	    }
	    
		
	}
	catch(Exception e)
	{
		System.out.println(e);
	}


   
   
   
   
   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>