<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.nio.file.Paths,java.nio.file.Files,java.nio.charset.StandardCharsets,javax.script.*,java.sql.*,javax.sql.*,java.util.*,java.io.*,java.util.concurrent.Executors,java.util.concurrent.ScheduledExecutorService,java.util.concurrent.TimeUnit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
      height: 600px;
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
      
      <div class="col-sm-2 sidenav">
          <ul>
		     Sidebar Menu
            <li><a href="index.jsp">Home</a></li>
            <li><a href="endUserLogin.html">End User</a></li>
            <li><a href="dataOwnerLogin.html">Data Owner</a></li>
            <li><a href="webServerLogin.html">Admin</a></li>
            <li><a href="projectDetails.html">About Project</a></li>
          </ul>
        </div>
      <div class="col-sm-8 text-left"> 
	  <br/>
	  <center>
	  <img src="main.png" align="center">
	  <center>
      <h3>MAIN PAGE</h3>
      <p>The current Web has no general mechanisms to make digital artifacts such as datasets, code, texts, and images 
verifiable and permanent. For digital artifacts that are supposed to be immutable, there is moreover no commonly accepted method to
enforce this immutability. These shortcomings have a serious negative impact on the ability to reproduce the results of processes that
rely onWeb resources, which in turn heavily impacts areas such as science where reproducibility is important. To solve this problem, we
propose trusty URIs containing cryptographic hash values. We show how trusty URIs can be used for the verification of digital artifacts,
in a manner that is independent of the serialization format in the case of structured data files such as nanopublications.We demonstrate
how the contents of these files become immutable, including dependencies to external digital artifacts and thereby extending the range
of verifiability to the entire reference tree. Our approach sticks to the core principles of the Web, namely openness and decentralized
architecture, and is fully compatible with existing standards and protocols. Evaluation of our reference implementations shows that
these design goals are indeed accomplished by our approach, and that it remains practical even for very large files.</p>
    </div>
    
	<div class="container-fluid text-center" >
 

  </div>
 <%
Runnable runnable = new Runnable() {
    public void run() {
      // task to run goes here
    	String file="C:/Tomcat 9.0/webapps/pro/"+"c.txt";
    	String content="",c="";
    	try {
    		
    	    Class.forName("com.mysql.jdbc.Driver");
            
			Connection connection =null;
            
            
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
			Statement st=connection.createStatement();
			   ResultSet rs=st.executeQuery("select fname,TRAPDOOR,owner from OWNERFILE;");
			   while(rs.next()){
				   System.out.println(rs.getString(1)+" "+rs.getString(2));
				   InputStream is=new FileInputStream("C:/Tomcat 9.0/webapps/pro/files/"+rs.getString(1));
				   BufferedReader br = new BufferedReader(new InputStreamReader(is));
		    	    StringBuilder sb = new StringBuilder();
		    	    String line = br.readLine();
		    	    while (line != null) {
		    	        sb.append(line).append("\n");
		    	        line = br.readLine();
		    	    }
		    	    
		    	    ScriptEngineManager manager = new ScriptEngineManager();
				    ScriptEngine engine = manager.getEngineByName("JavaScript");
				    engine.eval(Files.newBufferedReader(Paths.get("C:/Tomcat 9.0/webapps/pro/blake512.js"), StandardCharsets.UTF_8));
				    Invocable inv = (Invocable) engine;	    	  
				 c=sb.toString();
			    content=c.substring(0, c.length() - 1);
				 
				 String con=(String)inv.invokeFunction("blake512", content,"asdfasdfasdfqwee",true);
				 System.out.println(con);
				 if(con.equalsIgnoreCase(rs.getString(2)))
				 {
					 PreparedStatement st1=connection.prepareStatement("update atkfile set fstat=? where fname=? and oname=?");
					st1.setString(1,"safe");
					st1.setString(2,rs.getString(1));
					st1.setString(3,rs.getString(3));
				    st1.executeUpdate();
				 }
				 else{
					 PreparedStatement st1=connection.prepareStatement("update atkfile set fstat=? where fname=? and oname=?");
						st1.setString(1,"attacked");
						st1.setString(2,rs.getString(1));
						st1.setString(3,rs.getString(3));
					    st1.executeUpdate();
					 
				 }
				 //System.out.println("Hello !!");
			   }
			  
    	} 
    	catch(Exception e){
    		System.out.println("file cannot be opened"+e);
    	}
      
    }
  };
  ScheduledExecutorService service = Executors
                  .newSingleThreadScheduledExecutor();
  service.scheduleAtFixedRate(runnable, 0, 1, TimeUnit.MINUTES);
%>

</body>

</html>

