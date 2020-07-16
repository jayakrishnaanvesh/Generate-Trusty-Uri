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
        </div>            <h2><span>Search Result <span class="style2"></span></span></h2>
          
	  <p> 
	  <%@ page import = "java.util.Date" %>
	  <%@ page import = "java.sql.*" %>

	  
	  <%	  int i;
	  String s1,s2,s3;
			  
			  String key=request.getParameter("keyword");
	Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
	
      	try 
	{
              %>
          <h3>Result</h3>
			       <table class="table-condensed table-hover" width="542" border="1" align="left" cellpadding="0" cellspacing="0">
				   <tr>
					<td width="79" height="35"><div align="center" class="style5 style6">File Type </div></td>
					<td width="212"><div align="center" class="style7">Image Name </div></td>
					<td width="99"><div align="center" class="style7">Owner</div></td>
					<td width="142"><div align="center" class="style7">Request Status</div></td>
					</tr>
				  <%
			  
      		String query3="select * from file1 where fname like '%"+key+"%'"; 
            Statement st3=connection.createStatement();
            ResultSet rs3=st3.executeQuery(query3);
	   while ( rs3.next() )
	      {
		   s1=rs3.getString(4);
		   s2=rs3.getString(2);	
		%>
		<tr>
			<td height="26"><div align="center">jpeg</div></td>
			<td><div align="center"> <%=s1%> </div></td>
			<td><div align="center"> <%=s2%> </div></td>
			<td><a href="reqImage.jsp?file=<%=s1%>&owner=<%=s2%>">request</a></td>
		</tr>

		<%
			}
	   %>
			<tr>
			<td height="9"> </td>
			<td> </td>
			<td> </td>
			<td> </td>
			</tr>			
			 <%
			 
           connection.close();
          }catch(Exception e)
          {
            out.println(e.getMessage());
          }
	   %>
	</table>


      </p>
	  
      <p align="right">&nbsp;</p>
      <p align="right">&nbsp;</p>
      <p align="right"><a href="searchFile.jsp">Back</a></p>
        </div>
      </div>
      
</body>
</html>
