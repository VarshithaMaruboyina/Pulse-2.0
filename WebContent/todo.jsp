<%
int a=0;
%>

<%@page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    
    <link rel="stylesheet" type="text/css" href="todo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    
    <style>
     body{
    	 background-color:rgba(255, 99, 71, 0.5);
    	 }
    	 </style>
<body>

       


  <input type="checkbox" id="check">
  <label for="check">
    <i class="fa fa-bars" id="btn"></i>
    <i class="fa fa-times" id="cancel"></i>
  </label>
    <div id="main">
      <header>PULSE</header>
      <ul id="sidenav">
        <li><a href="home.jsp">home</a></li>
          <li><a href="todo.jsp">todo</a></li>
            <li><a href="reminder.jsp">reminders</a></li>
              <li><a href="music.html">music</a></li>
              <li><a href="image.jsp">gallery</a></li>
              <li><a href="about.jsp">notes</a></li>
              <li><a href="logout.jsp">logout</a></li>

      </ul>
   </div>


 <div class="todo" style="background-color:#fb607f;">
      <header>TODO APP</header>
      <form method="post" name="f" action="addtodo.jsp">
      <input type="text" id="to" name="tod"  " placeholder="Enter your to do tasks"><i class="fa fa-plus"  id="fa" onclick="submitForm()"></i>
      </form>
      <ul id="elements">
      <h3>ON GOING TASKS </h3>
      <%
      session=request.getSession(false);
      String gmail=(String)session.getAttribute("gmail");
		  try{
			  Connection con = null;
			    Class.forName("com.mysql.jdbc.Driver");
			    System.out.println("Driver class is loaded");
			    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
			    System.out.println("Connection Established"); 
			    PreparedStatement pstmt=con.prepareStatement("select * from todos where gmail=?");
			    pstmt.setString(1,gmail);
			   ResultSet rs=pstmt.executeQuery();
			   while(rs.next())
			   {
				   
				   %>
	
				   <li style="text-align:center"><a href="completed.jsp?id=<%=rs.getInt(1)%>">done</a><%=rs.getString(3) +"   "+ rs.getDate(4) %>  <span onClick="JavaScript:window.location='deletetodo.jsp?id=<%=rs.getInt(1)%>';"><i class="fa fa-trash"></i></span></li>
				   <!--  <div style="text-align:right">
				   <div style="background-color:black; margin-right:310px;padding:5px;text-align:center">
				   <a style="color: white;margin-top=0;margin-bottom=11px" href="completed.jsp?">completed</a>
				   </div>
				   <br>
				
				   </div>
				   -->
				   
				   <% 
			   }
			   rs.last();
			   a=rs.getRow();
		  }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
      
      
      
      
      %>
      </ul>
      <div class="clear">
        <span>you have <%=a%><span class="pendingnumb"></span> pending tasks</span>
        <button id="deleteall" onClick="JavaScript:window.location='clearall.jsp';">clear all</button>
      </div>
 

    </div>
    
    
    
<!-- completed tasks -->  

<div class="todo1" style="background-color:#fd5c63">
<h3>COMPLETED TASKS</h3>
<br>
<ul id="elements">
      
<%
		  try{
			  Connection con = null;
			    Class.forName("com.mysql.jdbc.Driver");
			    System.out.println("Driver class is loaded");
			    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
			    System.out.println("Connection Established"); 
			    PreparedStatement pstmt=con.prepareStatement("select * from completed where gmail=?");
			    pstmt.setString(1,gmail);
			   ResultSet rs=pstmt.executeQuery();
			   while(rs.next())
			   {
				   
				   %>
	
				   <li  style="margin-botton=11px"><%=rs.getString(3) +"   "+ rs.getDate(4) %>  <span onClick="JavaScript:window.location='deletecompleted.jsp?id=<%=rs.getInt(1)%>';"><i class="fa fa-trash"></i></span></li>
	
				   <% 
			   }
			   rs.last();
			   a=rs.getRow();
		  }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
      
      
      
      
      %>
   </ul>  
    
 </div>     




<!-- completed tasks -->
     <script type="text/javascript" src="todo.js"></script>
</body>
</html>