<%@page import="java.sql.*"%>
<%

String gmail=request.getParameter("gmail");
String password=request.getParameter("passwd");

try{
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    PreparedStatement pstmt=con.prepareStatement("select * from registration where gmail=? and password=?");
    pstmt.setString(1,gmail);
    pstmt.setString(2,password);
    
    ResultSet rs =pstmt.executeQuery();
    if(rs.next())
    	
    {
    	session=request.getSession();
    	session.setAttribute("gmail", gmail);
    	session.setAttribute("name",rs.getString(3));
    	response.sendRedirect("home.jsp");
    }
    else{
      response.sendRedirect("loginerror.jsp");
    }
	
}
catch(Exception e)
{
	System.out.println(e);
}






%>