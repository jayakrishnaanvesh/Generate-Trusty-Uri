<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Write Link</title>
<script src="blake512.js"></script><script src="testBlakeHash.js"></script>
</head>
<body>
<h1>Edit File</h1>
<%@ include file="connect.jsp" %>	
<%@ page import = "java.security.Key"%>
<%@ page import="javax.crypto.spec.SecretKeySpec,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
 <%@ page import ="java.util.Base64" %>
<%
		  	
		    	try 
				{
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue1 = keys.getBytes();
      					Key key1 = new SecretKeySpec(keyValue1,"AES");
      					Cipher c1 = Cipher.getInstance("AES");
      					c1.init(Cipher.DECRYPT_MODE, key1);
String file=request.getParameter("Sourcedoc");
String dV = new String(Base64.getDecoder().decode(file.getBytes()));
String owner=request.getParameter("oid");
String content="";

BufferedReader br = new BufferedReader(new FileReader("C:/Tomcat 9.0/webapps/pro/files/"+dV));

    StringBuilder sb = new StringBuilder();
    String line = br.readLine();
    while (line != null) {
        sb.append(line);
        sb.append("\n");
        line = br.readLine();
    }
    //content=sb.toString();
    	String c=sb.toString();
			    content=c.substring(0, c.length() - 1);
%>
<form action="uconfirm.jsp" method="post">
FileName:
<input type="text" name="filename" value=<%=dV%>  readonly/><br/><br/>
Owner:
<input type="text" name="owner" value=<%=owner%>  readonly/><br/><br/>
File <br/>
<textarea class="form-control" name="text" id="blake512Input" cols="150" rows="30"><%= content%></textarea><br/><br/>
Salt:
<input id="blake512Salt" name="blake512Salt" type="text" value="asdfasdfasdfqwee" length="16" readonly ><br/><br/>
Hash:
<textarea name="t4" id="hash" cols="50" rows="3" value="" required="required" readonly="readonly" ></textarea><br/><br/>
<input id="blakeHashButton" class="btn btn-primary" type="button" onclick="testBlakeHash()" value="Hash!"><br/><br/>
<input class="btn btn-primary" type="submit" value="Continue"/>
</form>
<%
}
catch(Exception e){
	out.println("file cannot be opened");
}
%>
</body>
</html>