<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body bgcolor="#D2B9D3">
        <%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
Connection conn=null;
ResultSet rs=null;
Statement stmt=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
conn=DriverManager.getConnection("jdbc:odbc:Database");
out.write("connected to database!!!");



stmt=conn.createStatement();
rs=stmt.executeQuery("select*from Cust_Info ");
%>
<center>
<h2>Team List</h2>
  <table border="1" cellspacing="0" cellpadding="0">
   <tr>
      
      <td><b>Volunteer Name</b></td>
      <td><b>Phone</b></td>
   </tr>
<%

while(rs.next()){
%>



    <tr>
      
      <td><%=rs.getString(1)%></td>
      <td><%=rs.getString(2)%></td>
   </tr>
<%
}

rs.close();
stmt.close();
conn.close();
%>
</table>
</center>
<a href="http://localhost:8084/Nlag/search.html"><FONT COLOR="red">Search Page</FONT></a><br/><br/>
<a href="http://localhost:8084/Nlag/Search_Phone.html"><FONT COLOR="red">Search_Phone_FORM</FONT></a><br/><br/>
<a href="http://localhost:8084/Nlag/form.html"><FONT COLOR="red">ENTRY FORM</FONT></a>
</body>
</html>
