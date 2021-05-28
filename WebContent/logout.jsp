<%@page import="java.sql.*"%>
<%

session=request.getSession(false);
session.invalidate();
response.sendRedirect("mainhome.html");
%>