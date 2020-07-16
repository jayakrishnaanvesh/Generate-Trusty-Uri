<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
					ResultSet rs=null;
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
PreparedStatement psmnt = connection.prepareStatement("update file1 set hash=? where fname=?");
psmnt.setString(1,request.getParameter("hash"));
psmnt.setString(2,request.getParameter("path"));
int s = psmnt.executeUpdate();
%>
<p>hello</p>
<%
if(s>0){
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
   out.println(e);
}
response.sendRedirect("dataOwnerMain.jsp");
%>