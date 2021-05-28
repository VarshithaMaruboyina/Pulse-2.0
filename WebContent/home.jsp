<%
session=request.getSession(false);
String name = (String) session.getAttribute("name");

%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    
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
        <li><a href="home.jsp">home</a></li>
          <li><a href="todo.jsp">todo</a></li>
            <li><a href="reminder.jsp">reminders</a></li>
              <li><a href="music.html">music</a></li>
              <li><a href="image.jsp">gallery</a></li>
              <li><a href="about.jsp">notes</a></li>
              <li><a href="logout.jsp">logout</a></li>

      </ul>




    </div>
    <div class="welcome">
     <h1>HELLO!  &nbsp; <%=name %></h1>
     </div>
    <div class="info">
   
    <img src="gif2.gif">
    </div>
    <!--<footer>
        <p>PULSE&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp_V make difference<p>
         <div class="socialmedia">  
                 <a herf="#"><i class="fa fa-facebook"></i></a>
                 <a herf="#"><i class="fa fa-instagram"></i></a>
                 <a herf="#"><i class="fa fa-twitter"></i></a>
        </div> 
    </footer>-->
   
</body>
</html>