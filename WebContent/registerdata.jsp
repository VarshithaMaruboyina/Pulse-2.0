<%@page import="java.sql.*"%>
<%

String gmail=request.getParameter("gmail");
String password=request.getParameter("passwd");
String name=request.getParameter("name");

try{
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    PreparedStatement pstmt=con.prepareStatement("insert into registration values(?,?,?)");
    pstmt.setString(1,gmail);
    pstmt.setString(2,password);
    pstmt.setString(3,name);
    
    int n=pstmt.executeUpdate();
    if(n>0)
    {
    	response.sendRedirect("login1.html");
    }
    else{
       %>
         <h1>you have already registerd please login</h1>
       <%
    }
	
}
catch(Exception e)
{
	 %>
     <h1>you have already registerd please login</h1>
   <%
	System.out.println(e);
}






%>