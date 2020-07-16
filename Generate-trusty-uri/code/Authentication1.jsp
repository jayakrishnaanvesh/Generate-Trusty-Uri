<%@ page import="java.sql.*"%>
<%
   	String username=request.getParameter("userid");    
	  
   	String Password=request.getParameter("pass");
	

	
    try{
		           Class.forName("com.mysql.jdbc.Driver");
                    
					Connection connection =null;
                    
                    
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
			application.setAttribute("owner",username);
			String sql="SELECT * FROM owner where username='"+username+"' and password='"+Password+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
		
			if(rs.next())
			{
				
				String status="Authorized";
				String sql1="SELECT * FROM owner where username='"+username+"' and status='"+status+"'";
			    Statement stmt1 = connection.createStatement();
			     ResultSet rs1 =stmt1.executeQuery(sql1);
		        	if(rs1.next())
			         {
			           application.setAttribute("owner",username);
				       response.sendRedirect("dataOwnerMain.jsp");
		           	 }
				    else
			         {
			           application.setAttribute("owner",username);
				       response.sendRedirect("dataOwnerMain1.jsp");
			         }
				
			}
			else
			{
				response.sendRedirect("wrongLogin.jsp");
			}
		
		
		
		
		
		
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>