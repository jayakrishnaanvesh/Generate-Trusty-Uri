<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<title>Verify file</title>
<script src="blockhash-js-master/png.js/zlib.js"></script>
  <script src="blockhash-js-master/png.js/png.js"></script>
  <script src="blockhash-js-master/jpgjs/jpg.js"></script>

  <script src="blockhash-js-master/blockhash.js"></script>

 
<link rel="stylesheet" type="text/css" href="main.css">

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

      
          <h2><span>Search Result <span class="style2"></span></span></h2>
          
	  <p> 
	  <%@ page import = "java.util.Date" %>
	  <%@ page import = "java.sql.*" %>

          <h3>Result</h3>
			       <table class="table-condensed table-hover" border=1>
				   <tr>
					<td > File Name</div></td>
					<td > PATH</div></td>
					<td >ORIGINAL HASH</div></td>
					<td >File Status</div></td>
					<td></td>
					</tr>
					<tr>
					<td ><%=request.getParameter("file")%></div></td>
					<td ><%=request.getParameter("path")%></div></td>
					<!--td ><%=request.getParameter("h1")%></div></td>-->
					<td ><%=request.getParameter("hash")%></div></td>
					<%
					String status="not";
					if(request.getParameter("h1").equals(request.getParameter("hash")))
					{
						status="safe";
					%>
					<td width="142"><div align="center" class="style7"><%=status%></div></td>
					<%
					}
					else{
						status="attacked";
					try{	
						Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
   					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	

					PreparedStatement psm = connection.prepareStatement("update atkdimage set status='attacked' where file=?");
psm.setString(1,request.getParameter("file"));
					psm.executeUpdate();}
					catch(Exception e){
						out.println(e);
					}
	
					%>
					<td width="142"><div align="center" class="style7"><%=status%></div></td>
					<td><a href="Rep.jsp?img=<%=request.getParameter("file")%>">Replace</a></td>
					</tr>
					<%}%>
	</table>


      </p>
	  
      <p align="right">&nbsp;</p>
      <p align="right">&nbsp;</p>
      <p align="right"><a href="searchFile.jsp">Back</a></p>
        </div>
      </div>
      
</body>
<div class="sidebar">
        <div class="gadget">
          <h2>Sidebar Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
           <li><a href="dataOwnerMain.jsp">DataOwner Main</a></li>
            <li><a href="dataOwnerLogin.html">Log Out</a></li>
          </ul>
        </div>
</html>
