<%@page import="java.sql.*"%>
<%

int id=Integer.parseInt(request.getParameter("id"));

try{
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    PreparedStatement pstmt=con.prepareStatement("delete from timetable where id=?");
    pstmt.setInt(1,id);
    int n=pstmt.executeUpdate();
    response.sendRedirect("image.jsp");	
    
 
    
   
}
catch(Exception e)
{
	System.out.println(e);
}






%>