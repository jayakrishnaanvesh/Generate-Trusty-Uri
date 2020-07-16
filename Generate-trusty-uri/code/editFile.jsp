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
<div class="col-sm-2 sidenav">
		     <ul class="sb_menu">
			 Sidebar Menu
           
			<li><a href="dataOwnerMain.jsp">DataOwner Main</a></li>
            <li><a href="dataOwnerLogin.html">Log Out</a></li>
       
          </ul>
        </div>
          <h2><span>View Owner Files<span class="style2"></span></span></h2>
          
	  <p> 
	  <%@ page import = "java.util.Date" %>
	  <%@ page import = "java.sql.*" %>
	  
 <%@ include file="connect.jsp" %>	
<%@ page import = "java.security.Key"%>
<%@ page import="javax.crypto.spec.SecretKeySpec,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
 <%@ page import ="java.util.Base64" %>
 

<%

    try 
	{
      		
      		String keys = "ef50a0ef2c3e3a5f";
      		
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue,"AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE,key);
      			
	  int i=1;
	  String s3;
			  s3=(String)application.getAttribute("owner");
		
	Class.forName("com.mysql.jdbc.Driver");
                    
					//Connection connection =null;
                    
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
					%>
	<table class="table-condensed table-hover" border=1>
	<tr>
	<td>file</td>
	<td>edit link</td>
	<td>date</td>
	</tr>
	<tr>
	<%
            PreparedStatement p=connection.prepareStatement("select * from ownerfile where owner =?"); 
            p.setString(1,s3);		
			ResultSet rs=p.executeQuery();
			while(rs.next()){
			String file=rs.getString("fname");
			String eV = new String(Base64.getEncoder().encode(file.getBytes()));
			String date=rs.getString("dt");
			%>
			<td><%=file%></td>
			<%
			PreparedStatement pstmt =connection.prepareStatement("select * from reada where file=?");
			pstmt.setString(1,file);
			ResultSet r=pstmt.executeQuery();
			if(r.next()){
			%>
			<td><a href="guestAcess2.jsp?Sourcedoc=<%=eV%>&oid=<%=s3%>" >Click here</a></td>
			<td><%=date%></td>
			</tr>
			<%
			}
			
			}
      		
			 %>
			 </table>
	  <%
	
     
           connection.close();
    }
	catch(Exception e)
          {
            out.println(e.getMessage());
          }
	   %>

</body>
</html>
