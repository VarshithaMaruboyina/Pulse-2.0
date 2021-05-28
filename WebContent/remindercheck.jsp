<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>pulse</title>
</head>
<body>

</body>
</html>
<%
session=request.getSession(false);
String gmail=(String)session.getAttribute("gmail");
String text=request.getParameter("textbox");
int date=Integer.parseInt(request.getParameter("date"));
int month=Integer.parseInt(request.getParameter("month"));
int year=Integer.parseInt(request.getParameter("year"));
int hour=Integer.parseInt(request.getParameter("timehour"));
int min=Integer.parseInt(request.getParameter("timemin"));

try{
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    PreparedStatement pstmt=con.prepareStatement("insert into reminder(gmail,text,date,month,year,hour,min) values(?,?,?,?,?,?,?)");
    pstmt.setString(1,gmail);
    pstmt.setString(2,text);
    pstmt.setInt(3,date);
    pstmt.setInt(4,month);
    pstmt.setInt(5,year);
    pstmt.setInt(6,hour);
    pstmt.setInt(7,min);
    int n=pstmt.executeUpdate();
    if(n>0)
    {
    	response.sendRedirect("mail.jsp?t="+text+"&d="+date+"&m="+month+"&y="+year+"&h="+hour+"&mi="+min+" ");
    }
    
    
    
 
	
}
catch(Exception e)
{
	System.out.println(e);
}


%>