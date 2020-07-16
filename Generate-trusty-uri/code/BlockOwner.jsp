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
          <h2><span>All End Users... </span></h2>
          <p>
		  <table  class="table-condensed table-hover" width="582" border="1"  cellpadding="0" cellspacing="0" font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
           <tr>
			 <td  width="47" valign="baseline" height="0" style="color: #2c83b0;">File</td>
             <td  width="107" valign="baseline" height="0" style="color: #2c83b0;">Attacker</td>
             <td  width="86" valign="baseline" height="0" style="color: #2c83b0;">IP ADDRESS</td>
             <td  width="83" valign="baseline" height="0" style="color: #2c83b0;">Block</td>
           </tr>
<%@ page import="java.sql.*"%>
<%
     String s1,s2,s3,s4,s5,s6,s7,s8,s9,s0;
	 int i=0;
		try 
		 {
			 Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");
		   String query="select distinct file,owner,atkr,ip from atkd"; 
		   Statement st=connection.createStatement();
		   ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			{
			s1=rs.getString(1);
			
			s2=rs.getString(2);
			s3=rs.getString(3);
			s4=rs.getString(4);
%>
                      <tr>
					  <form action="BlockOwner2.jsp">
					  <td height="106"><div align="center">
					    <%=s1%>
					    </div></td>
                      <td><div align="center">
                      <input type="text" name="atkr" value="<%=s3%>"/>
                      </div></td>
                      <td><div align="center">
                       <input type="text" name="ip" value="<%=s4%>"/>
                      </div></td>
					  <td><div align="center">
                       <input type="submit" value="Block">
                      </div></td>	
						</form>
		              </tr>					
				<%
				
			} 
		   PreparedStatement s=connection.prepareStatement("select distinct img, atkr,ip from atkimg1");
		   ResultSet r=s.executeQuery();
			while (r.next())
			{
			s6=r.getString(1);
			s7=r.getString(2);
			s8=r.getString(3);
%>
                      <tr>
					  <form action="BlockOwner2.jsp">
					  <td height="106"><div align="center">
					    <%=s6%>
					    </div></td>
                      
                      <td><div align="center">
                      <input type="text" name="atkr" value="<%=s7%>"/>
                      </div></td>
					  <td><div align="center">
                      <input type="text" name="ip" value="<%=s8%>"/>
                      </div></td>
					  <td><div align="center">
                       <input type="submit" value="Block">
                      </div></td>	
						</form>
		              </tr>
				<%
				
			}
			
							connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
                      <tr>
                      
                        <td  valign="baseline" height="0">&nbsp;</td>
                        <td  valign="baseline" height="0">&nbsp;</td>
                        <td  valign="baseline" height="0">&nbsp;</td>
                        <td  valign="baseline" height="0">&nbsp;</td>
						
                      </tr>
          </table></p>
          
                    <p align="right"><a href="webServerMain.jsp">Back</a></p>
        </div>
       
        
       
</body>
</html>
