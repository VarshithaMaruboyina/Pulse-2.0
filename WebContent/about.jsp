<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity=
"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">

	<script src=
"https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity=
"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous">
	</script>
	
	<script src=
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity=
"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous">
	</script>
	
	<script src=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity=
"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous">
	</script>
	<link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	*{
	margin-top:-8px;
	}
	.note{
	position:absolute;
	left:25%;
	top:10%;
	width:850px;
	
	}
	body{
	background-color:rgba(255, 99, 71, 0.5);
	
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
<div class="note" >
  
	 <form method="post" action="addnote.jsp">
	<div class="container my-3" >
		<h1 style="background-color:#fb607f;padding:10px;padding-left:20px;">Take your Notes here</h1>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">
					Add a Note
				
				</h5>
				<div class="form-group">
					<textarea class="form-control"
						id="addTxt" name="text" rows="3">
					</textarea>
				</div>
				<input type="submit" class="btn btn-primary"
					id="addBtn" style=
					"background-color:black" value="Add Note">
					
			</div>
			</form>
		</div>
		<hr>
		<h1>Your Notes</h1>
		<hr>
		
		
			<%
try{

session=request.getSession(false);
String gmail=(String)session.getAttribute("gmail");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("eDriver class is loaded");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject","root","Varshi27092002");
System.out.println("eConnection Established");
PreparedStatement pstmt=con.prepareStatement("select * from notes where gmail=?");
pstmt.setString(1,gmail);
ResultSet rs = pstmt.executeQuery();
while(rs.next())
{

%>
<div id="notes" style="color:darkblack;" class="row container-fluid">
<h4><%=rs.getString(3)%></h4>
</div>

	
<%
}

}
catch(Exception e)
{
	System.out.println(e);
}

%>
</div>

<div>
<form method="post" action="noteclear.jsp">
<input type="submit" class="btn btn-success" style="background-color:black;" value="clear">
</form>
</div>
		
</div>
</body>

</html>
