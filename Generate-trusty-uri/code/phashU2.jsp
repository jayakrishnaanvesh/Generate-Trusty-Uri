<html>
<head>
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="main.css">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 400px;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color:#444;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
	.jumbotron {
		background-color:#308080;
      margin-bottom: 0;
	  color:white;
    }
	input[type=text], select {
    width: 50%;
    padding: 5px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=password], select {
    width: 50%;
    padding: 5px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
  </style>
  </head>
  <body>
     <nav class="navbar navbar-inverse">
  <div  class="container-fluid">
  <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp">Logo</a>
    </div>
	 <div class="collapse navbar-collapse" id="myNavbar" >
      <ul class="nav navbar-nav" >
          <li class="nav-button-home"><a href="index.jsp">Home</a></li>
          <li class="nav-button-services"><a href="endUserLogin.html">EndUser</a></li>
          <li class="nav-button-services"><a href="dataOwnerLogin.html">DataOwner</a></li>
          <li class="nav-button-services"><a href="webServerLogin.html">Admin</a></li>
          <li class="nav-button-services"><a href="projectDetails.html">AboutProject</a></li>
		  <li></li>
        </ul>
		<ul class="nav navbar-nav" >
		<li><a href="webServerLogin.html">Log Out</a></li>
		</ul>
      </div>
	  </div>
	  </nav>
	   <div class="jumbotron">
  <div class="container text-center">
    <h3>MAKING DIGITAL ARTIFACTS ON THE WEB VERIFIABLE AND RELIABLE</h3>  
		Information security
  </div>
</div>
<%@ page import="java.nio.file.Paths,java.nio.file.Files,java.nio.charset.StandardCharsets,javax.script.*,java.sql.*,javax.sql.*,java.util.*,java.io.*,java.util.concurrent.Executors,java.util.concurrent.ScheduledExecutorService,java.util.concurrent.TimeUnit" %>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
					
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
					PreparedStatement ps = connection.prepareStatement("select * from file1 where fname=?");
ps.setString(1,request.getParameter("path"));
ResultSet rs=ps.executeQuery();
while(rs.next()){
	PreparedStatement pst = connection.prepareStatement("select * from owner where username=?");
pst.setString(1,rs.getString("owner"));
ResultSet rs2=pst.executeQuery();
while(rs2.next()){
	String Password=request.getParameter("pass");
	if(rs2.getString("password").equals(Password)){

PreparedStatement psmnt = connection.prepareStatement("update file1 set hash=? where fname=?");
psmnt.setString(1,request.getParameter("hash"));
psmnt.setString(2,request.getParameter("path"));
int s = psmnt.executeUpdate();
String path="C:/Tomcat 9.0/webapps/pro/imgback/"+request.getParameter("path");
new File(path).delete();
File source=new File("C:/Tomcat 9.0/webapps/pro/img/"+request.getParameter("path"));
File dest=new File("C:/Tomcat 9.0/webapps/pro/imgback/"+request.getParameter("path"));
 Files.copy(source.toPath(), dest.toPath());
%>
<p>hello</p>
<%
	}
else{
		
                 String owner=(String)application.getAttribute("owner");   
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
PreparedStatement psm = connection.prepareStatement("insert into atkimg1 values(?,?,?)");
psm.setString(1,request.getParameter("path"));
psm.setString(2,(String)application.getAttribute("owner"));
psm.setString(3,request.getRemoteAddr());
psm.executeUpdate();
	
%>
<h3>You entered wrong password </h3>
<%
}
}
}
}catch(Exception e){
   out.println(e.getMessage());
}
%>
<a href="dataOwnerMain.jsp">back</a>