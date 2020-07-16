<%@ page language="java" %>
<HTML>
<head>
<style>
#clock{
   background-image:url('');
   background-size:cover;
   background-position: center;
   height: 250px; width: 250px;
   border: 1px solid #bbb;
}
</style>
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
<FORM ENCTYPE="multipart/form-data" ACTION="repImage2.jsp" METHOD=POST>

<center>
<table class="table-condensed table-hover" border="1">
<tr>
<center><td colspan="2" align="center"><B>UPLOAD THE FILE</B><center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>

<td><INPUT NAME="file" TYPE="file" id="getval"></td><td colspan="2" align="center"><input type="hidden" name="fname" value=<%=request.getParameter("file")%>/> </td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Upload"> </td></tr>
<table>
</center>
</FORM>
<script>
document.getElementById('getval').addEventListener('change', readURL, true);
function readURL(){
   var file = document.getElementById("getval").files[0];
   var reader = new FileReader();
   reader.onloadend = function(){
      document.getElementById('clock').style.backgroundImage = "url(" + reader.result + ")";        
	  document.getElementById('data').value=reader.result;
   }
   if(file){
      reader.readAsDataURL(file);
    }else{
    }
}
</script>
<div id='clock'></div>
</body>
</HTML>