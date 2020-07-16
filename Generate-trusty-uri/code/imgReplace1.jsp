<%@ page import="java.io.*,java.sql.*" %>
<%
String path="C:/Tomcat 9.0/webapps/pro/img/"+request.getParameter("file");
new File(path).delete();
response.sendRedirect("repImage.jsp?file="+request.getParameter("file"));
%>