<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Deleted</title>
</head>
<%
String id[] = new String[10];
for (int i = 0; i < 10; i++) {
id[i] = request.getParameter("check" + i);
out.println(id[i]);
}
%>
<body bgcolor="beige">
<%
try {
Connection conn = null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
conn=DriverManager.getConnection("jdbc:odbc:Database");
ResultSet rs = null;
Statement st = null;
st = conn.createStatement();
for (int a = 0; a < 10; a++) {
st.executeUpdate("delete from Users_Delete where EmployeeID='" + id[a] + "'");
if(id[a] != null)
{%>
<h3><font color="blue">Employee ID : <%= id[a]%> Deleted Successfully</font></h3>
<% }}
} catch (SQLException e) {
System.out.println(e.getMessage());
}

%>

<a href="http://localhost:8084/Nlag/jspDelete.jsp">Click here to go to View All</a>
</body>

</html>
