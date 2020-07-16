<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read Link</title>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="blake512.js"></script><script src="testBlakeHash.js"></script>
<script src="download.js"></script>
<script language="javascript" type='text/javascript'>
function downl(){
	//console.log("hello");
	var cont=document.getElementById("text");
	var fil=document.getElementById("filename");
	download(cont.value,fil.value,"text/plain");
	}
</script>
</head>
<body>
<h1>Read File</h1>
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
String owner=request.getParameter("owner");
String content="";
BufferedReader br = new BufferedReader(new FileReader("C:/Tomcat 9.0/webapps/pro/files/"+dV));
    StringBuilder sb = new StringBuilder();
    String line = br.readLine();
    while (line != null) {
        sb.append(line);
        sb.append("\n");
        line = br.readLine();
    }
    content=sb.toString();
%>
<form >
FileName:
<input type="text" id="filename" name="filename" value=<%=dV%>  readonly/><br/><br/>
Owner:
<input type="text" name="owner" value=<%=owner%>  readonly/><br/><br/>
File <br/>
<textarea class="form-control" id="text" name="text" id="blake512Input" cols="150" rows="30" readonly><%= content%></textarea><br/><br/>
<span>Download</span>
<input type="button" class="btn btn-primary" value="download" onclick="downl()">
</form>
<%
} 
catch(Exception e){
	out.println("file cannot be opened"+e);
}
%>
</body>
</html>