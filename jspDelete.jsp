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
//conn=DriverManager.getConnection("jdbc:odbc:Database");
out.write("connected to database!!!");

//SqlConnection connection = new SqlConnection();
Connection con = DriverManager.getConnection("jdbc:odbc:Database");
String sql = "SELECT * FROM Users_Delete";
PreparedStatement ps = con.prepareStatement(sql);
rs = ps.executeQuery();
int i=0;

//stmt=conn.createStatement();
//rs=stmt.executeQuery("select*from Users_Delete ");
//int i=0;
%>
<body>
<h1>Will be deleting an Existing User</h1>
<h4> List of Users</h4>
<form name=myname method=post action="http://localhost:8084/Nlag/jspsuccess.jsp">
<table border="1">
<tr>
<td>Select</td>
<td>EmployeeID</td>
<td>FirstName</td>
<td>LastName</td>
</tr>
<%
while(rs.next()){ %>
<tr>
    <td><input type="checkbox" name="check<%=i%>" value=<%=rs.getString(1)%>></td>

<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
</tr>
<%}%>

</table>
      <input type="submit" value="Delete">

</form>
</body>
</html>
