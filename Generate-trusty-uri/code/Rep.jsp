<%@ page import="java.nio.file.Paths,java.nio.file.Files,java.nio.charset.StandardCharsets,javax.script.*,java.sql.*,javax.sql.*,java.util.*,java.io.*,java.util.concurrent.Executors,java.util.concurrent.ScheduledExecutorService,java.util.concurrent.TimeUnit" %>
<%
String path="C:/Tomcat 9.0/webapps/pro/img/"+request.getParameter("img");
new File(path).delete();
File source=new File("C:/Tomcat 9.0/webapps/pro/imgback/"+request.getParameter("img"));
File dest=new File("C:/Tomcat 9.0/webapps/pro/img/"+request.getParameter("img"));
 Files.copy(source.toPath(), dest.toPath());
response.sendRedirect("dataOwnerMain.jsp");
 %>