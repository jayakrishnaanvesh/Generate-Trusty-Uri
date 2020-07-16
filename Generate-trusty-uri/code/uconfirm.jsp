<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
   <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update status</title>
</head>
<body>
<%
try{
	String content=request.getParameter("text");
	String file=request.getParameter("filename");
	String owner=request.getParameter("owner");
	String hash=request.getParameter("t4");
	PrintStream p = new PrintStream(new FileOutputStream("C:/Tomcat 9.0/webapps/pro/files/"+request.getParameter("filename")));
	p.print(new String(request.getParameter("text")));
	out.println("<h2>updated your file</h2>");
	

%>
<h2>Enter your Password to continue </h2>
<form action="Backup.jsp" method="post">
Password:
<textarea name="content" hidden> <%=content%></textarea>
<input type="hidden" name="file" value=<%=file%>>
<input type="hidden" name="owner" value=<%=owner%>>
<input type="hidden" name="hash" value=<%=hash%>>
<input type="password" name="password">
<input type="submit" value="Continue">
</form>
<%
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
