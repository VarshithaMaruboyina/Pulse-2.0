
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>pulse</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    	 body{
    	 
    	 background-color:rgba(255, 99, 71, 0.5);
    	 }
    	.reminders{
    		position:absolute;
    		top: 10%;
    		left:40%;
    		
    	}
    	.display{
    	    position:absolute;
    	    top: 40%;
    		left:40%;
    	    
    	}
    	.dispreminder{
    	  padding:10px;
    	  margin:10px;
    	  background-color:lightgrey;
    	  box-shadow:0px 10px 10px 0px grey;
    	}
    	.sub:hover{
    	padding-top:3px;
    	box-shadow:0px 3px 3px 3px grey;
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
        <li><a href="home.jsp">home</a></li>
          <li><a href="todo.jsp">todo</a></li>
            <li><a href="reminder.jsp">reminders</a></li>
              <li><a href="music.html">music</a></li>
               <li><a href="image.jsp">gallery</a></li>
              <li><a href="about.jsp">notes</a></li>
              <li><a href="logout.jsp">logout</a></li>

      </ul>




    </div>



 <div class="reminders">

<form method="post" action="remindercheck.jsp">
	<h1>ENTER YOUR REMINDER</h1>
	<br>
<textarea id="w3review" name="textbox" rows="4" cols="50" required>
  </textarea>&nbsp;&nbsp;&nbsp;&nbsp;
   <h2>ENTER TIME</h2>
    <strong>date</strong><input type="number" min="1" max="31" name="date" style="height:30px;" required> &nbsp;&nbsp;
    <strong>month</strong><input type="number" min="1" max="12" name="month" style="height:30px;" required>  &nbsp;&nbsp; 
  <strong>year</strong><input type="number" min="2021" max="2050" name="year" style="height:30px;" required>  &nbsp;&nbsp; 
 <strong>hour</strong><input type="number" min="0" max="24" name="timehour" style="height:30px;" required> &nbsp;&nbsp;
<strong>min</strong><input type="number" min="0" max="59" name="timemin" required style="height:30px;"><br><br>  &nbsp;&nbsp;
 <strong><input type="submit" class="sub" value=" add reminder" style="background-color:red;width:150px;height:35px;box-shadow:0px 3px 3px 0px grey; "></strong>
</form>
</div>

<%@page import="java.sql.*"%>
<%

try{
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver class is loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
    System.out.println("Connection Established"); 
    session=request.getSession(false);
    String gmail=(String)session.getAttribute("gmail");
    PreparedStatement pstmt=con.prepareStatement("select * from reminder where gmail=?");
    pstmt.setString(1,gmail);
    ResultSet rs=pstmt.executeQuery();
    
    %>
     <div class="display">
    <table>
    <tr>
    <td>
    <% 
    while(rs.next())
    {
    %>
   <br>
    <div class="dispreminder">
    <h2>Reminder : <%=rs.getString(3) %></h2>
    <h2> Date: <%=rs.getInt(4) %>-<%=rs.getInt(5) %>-<%=rs.getInt(6) %></h2>
    <h2>Time : <%=rs.getInt(7) %>:<%=rs.getInt(8) %></h2>
    <a href="delete.jsp?id=<%=rs.getInt(1)%>" style="fontsize:25px;">Delete</a> 
    </div>
    
    <%  }%>
    <td> 
    <tr>  
    </table>
    

     
     </div>
   
    
    
  
  <%  
   

    
   
}
catch(Exception e)
{
	System.out.println(e);
}

%>











</body>
</html>






