<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search_Phone_Page</title>
    </head>
    <body bgcolor="pink">
        <%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
Connection conn=null;
ResultSet rs=null;
Statement stmt=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
conn=DriverManager.getConnection("jdbc:odbc:Database");

stmt=conn.createStatement();
String Phone=request.getParameter("Phone");
rs=stmt.executeQuery("select * from Cust_Info where Phone = '" + Phone + "'") ;


if(!rs.next()) {
                out.println("SORRY NUMBER NOT FOUND!!!");
            } else {
        


%>
<center>
<h2>Search Result</h2>
  <table border="1" cellspacing="0" cellpadding="0">
  <tr>
      
      <td><b>Volunteer Name</b></td>
      <td><b>Phone</b></td>
</tr>


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

<br/><br/>
<a href="http://localhost:8084/Nlag/Search_Phone.html"><FONT COLOR="red">Search_Phone_FORM</FONT></a><br/><br/>
<a href="http://localhost:8084/Nlag/form.html"><FONT COLOR="red">ENTRY FORM</FONT></a>
</body>
</html>
