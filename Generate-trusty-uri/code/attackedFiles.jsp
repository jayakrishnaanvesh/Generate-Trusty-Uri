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
          <ul>
		     Sidebar Menu
            <li><a href="webServerMain.jsp">Server Main</a></li>
			<li><a href="webServerLogin.html">Log Out</a></li>
          </ul>
        </div>
          <h2><span>All Attacked Files</span></h2>
          <p>
  <table class="table-hover table-condensed" width="626" border="1" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td width="123">File Name </td>
    <td width="124">Owner Name </td>
    <td width="88">Status</td>
	 <td width="126">Notify Owner</td>
  </tr>
 <%@ page import="java.sql.*" %>
  <%
  
	String s1="",s2="",s3="",email="";
	int i=0,j=0,k=0;

    try 
	  {
		  Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");
      	String query="select * from atkfile where fstat='attacked' "; 
        Statement st=connection.createStatement();
        ResultSet rs=st.executeQuery(query);
	  while ( rs.next() )
	   {
		s1=rs.getString(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		PreparedStatement pstmt =connection.prepareStatement("select * from owner where username=? ");
		pstmt.setString(1,s2);
		ResultSet rs2=pstmt.executeQuery();
		while(rs2.next()){
		email=rs2.getString(4);
		%>

  <tr>
     <td><div align="center" class="style9"><%=s1%></div></td>
     <td><div align="center" class="style9"><%=s2%></div></td>
	 <td><div align="center" class="style9"><%=s3%></div></td>
	 <td><a href="mail.jsp?email=<%=email%>&file=<%=s1%>&owner=<%=s2%>" >Send Email</a></td>
  </tr>

<%
	   }}
	String que="select * from atkdimage where status='attacked' "; 
        Statement s=connection.createStatement();
        ResultSet rst=s.executeQuery(que);
	  while ( rst.next() )
	   {
		s1=rst.getString(1);
		s2=rst.getString(2);
		s3=rst.getString(3);
		PreparedStatement ps =connection.prepareStatement("select * from owner where username=? ");
		ps.setString(1,s2);
		ResultSet rkt=ps.executeQuery();
		while(rkt.next()){
		email=rkt.getString(4);
		%>

  <tr>
     <td><div align="center" class="style9"><%=s1%></div></td>
     <td><div align="center" class="style9"><%=s2%></div></td>
	 <td><div align="center" class="style9"><%=s3%></div></td>
	 <td><a href="mail2.jsp?email=<%=email%>&file=<%=s1%>&owner=<%=s2%>" >Send Email</a></td>
  </tr>

<%
	   }
	   }
%>     <tr>
         <td  valign="baseline" height="0">&nbsp;</td>
         <td  valign="baseline" height="0">&nbsp;</td>
         <td  valign="baseline" height="0">&nbsp;</td>
         <td  valign="baseline" height="0">&nbsp;</td>
       </tr>
					  <%
        connection.close();
        }  catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table> 
          </p>
          
                    <p align="right">&nbsp;</p>
                    <p align="right">&nbsp;</p>
                    <p align="right">&nbsp;</p>
                    <p align="right"><a href="webServerMain.jsp">Back</a></p>
        </div>
       
        
      </div>
      
</body>
</html>
