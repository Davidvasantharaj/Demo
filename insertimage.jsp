<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*" %>
<%
Statement st=null;
Connection cn=null;
%>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
cn=DriverManager.getConnection("jdbc:odbc:Database");
st=cn.createStatement();
%>

 
<%
try
{
String ImageFile="";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
}
catch (FileUploadException e)
{
e.getMessage();/**e.printStackTrace();*/
}
 
Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if (item.isFormField())
{
String name = item.getFieldName();
String value = item.getString();
if(name.equals("ImageFile"))
{
ImageFile=value;
}
 
}
else
{
try
{
String itemName = item.getName();
File savedFile = new File("C:/Program Files/Apache Software Foundation/Apache Tomcat 7.0.11/webapps/ROOT/test/image/"+itemName);

item.write(savedFile);
}
catch (Exception e)
{
out.println("Error"+e.getMessage());
}
}
}
try
{  
String myquery=("insert into test(Image) values('"+itemName+"')");
st.executeUpdate(myquery);
}
catch(Exception el)
{
out.println("Inserting error"+el.getMessage());
}
}
}
catch (Exception e){
out.println(e.getMessage());
}
%>
