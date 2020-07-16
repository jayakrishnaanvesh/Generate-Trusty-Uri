<%@ include file="connect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.*"%>
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
      </div>
	  </div>
	  </nav>
	   <div class="jumbotron">
  <div class="container text-center">
    <h3>MAKING DIGITAL ARTIFACTS ON THE WEB VERIFIABLE AND RELIABLE</h3>  
		Information security
  </div>
</div>
            <%
			        String user=request.getParameter("uname");
					
				    ArrayList list = new ArrayList();
					
					ServletContext context = getServletContext();
					
					String dirName =context.getRealPath("Gallery/");
					
					String paramname,uname,pass,email,mno,addr,dob,gender,pincode,location,image,bin;
				
					FileInputStream fs=null;
					
					File file1 = null;	
					
					uname=request.getParameter("userid");
					pass=request.getParameter("pass");
					email=request.getParameter("email");
					mno=request.getParameter("mobile");
					addr=request.getParameter("address");
					dob=request.getParameter("dob");
					gender=request.getParameter("gender");
					pincode=request.getParameter("pincode");
					location=request.getParameter("location");
					//out.println(uname);
							
						int f = 0;
				try{
			        Class.forName("com.mysql.jdbc.Driver");
                    
					//Connection connection =null;
                    
					ResultSet rs=null;
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");			
						
		if(user.equalsIgnoreCase("user"))
						{
						FileInputStream fs1 = null;
			 			String query1="select * from user  where username='"+uname+"'"; 
						Statement st1=connection.createStatement();
						ResultSet rs1=st1.executeQuery(query1);
						
							
					if ( rs1.next() )
					   {
					   		
				%>
				<br/><div class="alert alert-warning">
  <center><strong>Warning!</strong> User name already exists.<center>
</div>	
							
							<p><center><a href="newUserRegister.jsp">Back</a><center></p>
				
							
				<%
					   }
					   else
					   {
					   String status="Authorized";
PreparedStatement ps=connection.prepareStatement("insert into user(username,password,email,mobile,address,dob,gender,pincode,location,status,image) values(?,?,?,?,?,?,?,?,?,?,?)");
						ps.setString(1,uname);
						ps.setString(2,pass);
						ps.setString(3,email);	
						ps.setString(4,mno);
						ps.setString(5,addr);
						ps.setString(6,dob);
						ps.setString(7,gender);
						ps.setString(8,pincode);
						ps.setString(9,location);
						ps.setString(10,status);
				//ps.setBinaryStream(11, (InputStream)fs, (int)(file1.length()));	
				//		ps.setString(11,sk);		
						
							ps.setObject(11,null);
						
						int x=ps.executeUpdate();
						if(x>0){
							
						
			%>
			<br/>
				<div class="alert alert-success">
  <center><strong>Success!</strong> Registered successfully</center>
</div>

			<p><center><a href="endUserLogin.html">Back</a></center></p>
			
			<%
					}
						}
						
						}
						
						
						
						
						
						
						
						
						
				else{		//Owner Register 
						
						FileInputStream fs1 = null;
						String query1="select * from owner  where username='"+uname+"'"; 
						Statement st1=connection.createStatement();
						ResultSet rs1=st1.executeQuery(query1);
						
					         if ( rs1.next() )
					           {
							   
					   		    
				              %>	
<div class="alert alert-warning">
  <strong>Warning!</strong> Owner name already exists.
</div>							  
						     	<p><a href="newOwnerRegister.jsp">Back</a></p>
	               			  <%
							  
					           }
					         else
					    {
					   String status="Authorized";
PreparedStatement ps=connection.prepareStatement("insert into owner(username,password,email,mobile,address,dob,gender,pincode,location,status,image) values(?,?,?,?,?,?,?,?,?,?,?)");
						ps.setString(1,uname);
						ps.setString(2,pass);
						ps.setString(3,email);	
						ps.setString(4,mno);
						ps.setString(5,addr);
						ps.setString(6,dob);
						ps.setString(7,gender);
						ps.setString(8,pincode);
						ps.setString(9,location);
						ps.setString(10,status);
				//		ps.setBinaryStream(11, (InputStream)fs, (int)(file1.length()));	
				//		ps.setString(11,sk);		
						
							ps.setObject(11,null);
					  
						
						int x=ps.executeUpdate();
						if(x>0)
						{
							
							
		         	%>
					<div class="alert alert-success">
  <strong>Success!</strong> Registered successfully
</div>

			<p><a href="dataOwnerLogin.html">Back</a></p>
			        <%
				        }
					}
					}//Owner Register closed
						
						} 
					catch (Exception e) 
					{
						out.println(e.getMessage());
					}
			%>
</body>