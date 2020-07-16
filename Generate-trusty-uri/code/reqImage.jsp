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
           <li><a href="endUserMain.jsp">End User Main</a></li>
            <li><a href="endUserLogin.html">Log Out</a></li>
          </ul>
        </div> 
          <h2><span>Request Status<span class="style2"></span></span></h2>
          
	  <p> 
	  <%@ page import = "java.util.Date" %>
	  <%@ page import = "java.sql.*" %>

	  
	  <%	  int i=1;
	  String s1,s2,s3;
			  s1=request.getParameter("file");
			  s2=request.getParameter("owner");
			  s3=(String)application.getAttribute("user");
		
	Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
	
      	try 
	{
            PreparedStatement p=connection.prepareStatement("select * from reqimg where owner=? and file=? and user=? "); 
            p.setString(1,s2);
            p.setString(2,s1);
            p.setString(3,s3);			
			ResultSet rs=p.executeQuery();
			while(rs.next()){
				i=0;
			} 
			if(i==1){
      		PreparedStatement pstmt =connection.prepareStatement("insert into reqimg values(?,?,?,?)");
			pstmt.setString(1,"no");
			pstmt.setString(2,s2);
			pstmt.setString(3,s3);
			pstmt.setString(4,s1);
			pstmt.executeUpdate();
			 %>
	  <h3>request submitted successfully</h3>
	  <%
			}
			else{
				%>
				<h3>This file has been already requested</h3>
				<%
			}
	
     
           connection.close();
    }catch(Exception e)
          {
            out.println(e.getMessage());
          }
	   %>

</body>
</html>
