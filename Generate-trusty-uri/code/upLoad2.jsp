<html xmlns="http://www.w3.org/1999/xhtml">
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
<p>

<%@ page import ="java.util.Date,java.sql.*,java.sql.Connection" %>
 <%@ page import ="javax.crypto.Cipher" %> 
<%@ page import ="java.security.KeyPairGenerator,java.security.KeyPair,java.security.Key" %>
<%@ page import ="java.text.SimpleDateFormat" %>

 <%@ page import ="javax.crypto.spec.SecretKeySpec" %>
 
 <%@ page import ="java.util.Base64" %>
 
 <%@ page import ="java.security.MessageDigest,java.security.DigestInputStream" %>
 
 <%@ page import ="java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.io.BufferedInputStream" %>
 

<%

    try 
	{
      		
      		String keys = "ef50a0ef2c3e3a5f";
      		
      		
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue,"AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE,key);
      			
    
		 Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
					ResultSet rs=null;
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");			
						
      		String file=request.getParameter("t42");
      		String cont=request.getParameter("text2");
      		String mac =request.getParameter("t4");
			String str=request.getRequestURL()+"";
			String owner=(String)application.getAttribute("owner");

      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      	    	KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
				Cipher encoder = Cipher.getInstance("RSA");
				KeyPair kp = kg.generateKeyPair();
				Key pubKey = kp.getPublic();
				byte[] pub = pubKey.getEncoded();

				String pk = String.valueOf(pub);
				String rank = "0";
			
				String task = "Upload";
				
				String str1 = "insert into transaction(user,fname,sk,task,dt) values('"+owner+"','"+file+"','"+pk+"','"+task+"','"+dt+"')";
		     	connection.createStatement().executeUpdate(str1);
				
      String str2 = "insert into  webserver(owner,fname,ct,trapdoor,sk,url,rank,dt) values ('"+owner+"','"+file+"','"+cont+"','"+mac+"','"+pk+"','"+str+"','"+rank+"','"+dt+"')"; 
	  connection.createStatement().executeUpdate(str2);
	  
	    String str3 = "insert into  ownerfile(owner,fname,ct,trapdoor,sk,url,rank,dt) values ('"+owner+"','"+file+"','"+cont+"','"+mac+"','"+pk+"','"+str+"','"+rank+"','"+dt+"')";	        
		connection.createStatement().executeUpdate(str3);
	    
      String str4="insert into atkfile values('"+file+"','"+owner+"','safe')";
	  connection.createStatement().executeUpdate(str4);
	  String eV = new String(Base64.getEncoder().encode(file.getBytes()));
	  PreparedStatement pstmt =connection.prepareStatement("insert into reada values(?,?,?)");
			pstmt.setString(1,file);
			pstmt.setString(2,"guestAccess1.jsp?Sourcedoc="+eV+"&owner="+owner);
			pstmt.setString(3,owner);
			pstmt.executeUpdate();
	
%>
		<div class="alert alert-success">
 <center> <strong>Success!</strong> File Uploaded successfully <center>
</div>
		<p>  <a href="dataOwnerMain.jsp">BACK</a></p>

		  
		  
		  <%
		  
           connection.close();
          }
         
          catch(Exception e)
          {
			  out.println(e);
            %>			
		<div class="alert alert-warning">
  <center><strong>Warning!</strong> File Uploaded failed<center>
</div>
		<p> <center> <a href="dataOwnerMain.jsp">BACK</a><center></p>

			
			<%
          }
		  
          %>
	
</p>
					
          
     
  </div>
</div>
</body>
</html>
