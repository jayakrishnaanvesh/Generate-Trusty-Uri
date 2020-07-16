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
      </div>
	  </div>
	  </nav>
	   <div class="jumbotron">
  <div class="container text-center">
    <h3>MAKING DIGITAL ARTIFACTS ON THE WEB VERIFIABLE AND RELIABLE</h3>  
		Information security
  </div>
</div>
	  
          <h2><span>New User Registration</span></h2>
          <div class="clr"></div>
        
		<%
		String str="user";
		%>
		
          <p> 
		  <form action="insertData.jsp?uname=<%=str%>" method="post" id="sendemail" >
            <ul class="list-group">
              <li class="list-group-item">
                <label for="name">
                <div align="left">User Name (required)</div>
                </label>
                <div align="left">
                  <input id="name" type="text"  name="userid" class="text" />
                </div>
              </li>
              <li class="list-group-item">
                <label for="password">
                <div align="left">Password (required)</div>
                </label>
                <div align="left">
                  <input type="password" id="password" name="pass" class="text" />
                </div>
              </li>
              <li class="list-group-item">
                <label for="email">
                <div align="left">Email Address (required)</div>
                </label>
                <div align="left">
                  <input id="email" type="text" name="email" class="text" />
                </div>
              </li>
              <li class="list-group-item">
                <label for="mobile">
                <div align="left">Mobile Number (required)</div>
                </label>
                <div align="left">
                  <input type="text" id="mobile" name="mobile" class="text" />
                </div>
              </li>
              <li class="list-group-item">
                <label for="address">
                <div align="left">Your Address</div>
                </label>
                <div align="left">
                  <textarea id="address" name="address" rows="3" culs="50"></textarea>
                </div>
              </li>
              <li class="list-group-item">
                <label for="dob">
                <div align="left">Date of Birth (required)</div>
                </label>
                <div align="left">
                  <input id="dob" type="text" name="dob" class="text" />
                </div>
              </li>
              <li class="list-group-item">
                <label for="gender">
                <div align="left">Select Gender (required)</div>
                </label>
                <div align="left">
                  <select id="s1" name="gender" style="width:480px;" class="text">
                    <option>--Select--</option>
                    <option>Male</option>
                    <option>Female</option>
                  </select>
                </div>
              </li>
              <li class="list-group-item">
                <label for="pincode">
                <div align="left">Enter Pincode (required)</div>
                </label>
                <div align="left">
                  <input id="pincode" type="text" name="pincode" class="text" />
                </div>
              </li>
              <li class="list-group-item">
                <label for="location">
                <div align="left">Enter Location (required)</div>
                </label>
                <div align="left">
                  <input id="loc" type="text" name="location" class="text" />
                </div>
              </li>
              
                
                       <li>&nbsp;&nbsp;&nbsp;&nbsp; <input name="submit" class="btn btn-success" type="submit" value="REGISTER" /></li>
              
                    <li>
                      <div align="right"><a href="endUserLogin.html">Back</a></div>
                    </li>
                  
                </ul>
              </ul>
              </li>
              
            </ul>
          </form>
		  </p>
		 
</body>
</html>
