<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Owner Upload</title>
<script language="javascript" type='text/javascript'>
     function loadFile()
    {
	    var fileToLoad = document.getElementById("file").files[0];
	    var fileReader = new FileReader();
	    fileReader.onload = function(fileLoadedEvent) 
    {
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("blake512Input").value = textFromFileLoaded;
	};
	    fileReader.readAsText(fileToLoad, "UTF-8");
    }
</script>
<script src="blake512.js"></script><script src="testBlakeHash.js"></script>
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
          <h2><span>Owner Data Upload<span class="style1"> </span></span></h2>
         
          <p>
		  <form id="form1" name="form1" method="post" action="upLoad1.jsp">
          <table width="598"  border="1.5"  cellpadding="0" cellspacing="0">
             <tr>
              <td width="155" height="37"><div align="center"><span class="style4 style2 style3">Select File </span></div></td>
              <td width="437"><div align="center">
                <input required="required" type="file" name="t42" id="file"  onchange="loadFile()" />
              </div></td>
             </tr>
             <tr>
              <td height="34" class="style4 style2 style3"><div align="center">File Name </div></td>
              <td><div align="center">
                <input required="required" name="tt" type="text" id="t42" size="50"/>
              </div></td>
             </tr>
             <tr>
              <td height="258">&nbsp;</td>
              <td><div align="center">
                <textarea name="text" id="blake512Input" cols="50" rows="15"></textarea>
              </div></td>
			  </tr>
			  <tr>
			  <td><div align="center"> Salt value</div></td>
              <td><input id="blake512Salt" name="blake512Salt" type="text" value="asdfasdfasdfqwee" length="16" readonly ></td>
             </tr>
             <tr>
              <td height="37"><div align="center"><span class="style4 style2 style3">Digital Artifacts</span></div></td>
              <td><div align="center">
                <textarea name="t4" id="hash" cols="50" rows="5" value="" required="required" readonly="readonly" ></textarea>
              </div></td>
             </tr>
             <tr>
              <td><div align="right"></div></td>
              <td><input id="blakeHashButton" type="button" onclick="testBlakeHash()" value="Hash!">
              <input type="submit" name="Submit" value="Continue" /></td>
             </tr>
          </table>
          </form>
		  </p>
          
       
      
</body>
</html>
