<%@page import="java.sql.*"%>
<%


try{
	session=request.getSession(false);
	String gmail=(String)session.getAttribute("gmail");
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    PreparedStatement pstmt=con.prepareStatement("delete from todos where gmail=?");
    pstmt.setString(1,gmail);
   int n =pstmt.executeUpdate();
   response.sendRedirect("todo.jsp");
	
}
catch(Exception e)
{
	System.out.println(e);
}






%>