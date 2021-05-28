
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    
    <style type="text/css">
    
   body{
    	 background-color:rgba(255, 99, 71, 0.5);
    	 }
    	 .imgupload{
    	       position:absolute;
    	       left:34%;
    	       top:10%;
    	 }
    	 #input{
    	 width:250px;
    	 height:30px;
    	 border: 2px solid black;
    	  border-radius: 4px;
    	 }
    	 
    	 
    	 .img{
    	   text-align:center;
    	   width:700px;
    	 height:350px;
    	 margin-left: 400px;
    	 margin-top:150px;
    	 
    	   
    	 
    	 
    	 }
    	 a{
    	 text-decoration:none;
    	 }
    
    
    </style>
</head>
<body>
  <input type="checkbox" id="check">
  <label for="check">
    <i class="fa fa-bars" id="btn"></i>
    <i class="fa fa-times" id="cancel"></i>
  </label>
    <div id="main">
      <header>PULSE</header>
      <ul id="sidenav">
        <li><a href="home.html">home</a></li>
          <li><a href="todo.jsp">todo</a></li>
            <li><a href="reminder.jsp">reminders</a></li>
              <li><a href="music.html">music</a></li>
              <li><a href="image.jsp">gallery</a></li>
              <li><a href="about.jsp">notes</a></li>
              <li><a href="logout.jsp">logout</a></li>

      </ul>




    </div>
<div>
<div class="imgupload">
<form action="imageupload.jsp"   method="post">
<div class="input-group input-group-lg" >
<input type="text" class="form-control" style="height:50px;width:325px;" id="input" name="imagepath" placeholder="Enter the path of image">&nbsp;&nbsp;&nbsp;
<input type="submit" class="btn btn-danger" id="sub"  value="upload">
</div>

</form>
<body>
</div>

<%@page import="java.sql.*"%>
<%
session=request.getSession(false);
		  
String gmail=(String)session.getAttribute("gmail");
		  

try{
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    PreparedStatement pstmt=con.prepareStatement("select * from timetable where gmail=?");
    pstmt.setString(1, gmail);
    
    ResultSet rs =pstmt.executeQuery();
    while(rs.next())
    	
    {
    	%>
    	<img src="displayimg.jsp?id=<%=rs.getInt(1) %>" width="200" height="200" class="img">&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
    	<a href="deleteimg.jsp?id=<%=rs.getInt(1) %>" style="text-decoration:none; background-color:black;color:white;padding:8px;margin-left:410px;border:0;radius:2px;">Delete</a>
    	<br>
    	
    	<% 
    	
    }
	
}
catch(Exception e)
{
	
}






%>
</div>


 










 