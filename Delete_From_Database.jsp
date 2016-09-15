<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor=gray>
        <%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
Connection con=null;
Statement stmt=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:Database");



//String VolunteerName=request.getParameter("VolunteerName");
String Phone=request.getParameter("Phone");

stmt=con.createStatement();




String myquery= "DELETE FROM Cust_Info WHERE Phone = '" + Phone + "'";
stmt.executeUpdate(myquery);
out.println("Delete From Cust_Info tabel");
stmt.close();
con.close();
 %> 
 <a href="http://localhost:8084/Nlag/form.html"><FONT COLOR="red">ENTRY FORM</FONT></a><br/><br/>
 <a href="http://localhost:8084/Nlag/search.html"><FONT COLOR="red">Search Page</FONT></a>
 </body>
</html>
