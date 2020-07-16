<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.nio.file.Paths,java.nio.file.Files,java.nio.charset.StandardCharsets,javax.script.*,java.sql.*,javax.sql.*,java.util.*,java.io.*,java.util.concurrent.Executors,java.util.concurrent.ScheduledExecutorService,java.util.concurrent.TimeUnit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>hi</p>
<%
Runnable runnable = new Runnable() {
    public void run() {
      // task to run goes here
    	String file="C:/Tomcat 9.0/webapps/jsp/"+"c.txt";
    	String content="",c="";
    	try {
    		
    	    Class.forName("com.mysql.jdbc.Driver");
            
			Connection connection =null;
            
            
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
			Statement st=connection.createStatement();
			   ResultSet rs=st.executeQuery("select fname,TRAPDOOR,owner from OWNERFILE;");
			   while(rs.next()){
				   System.out.println(rs.getString(1)+" "+rs.getString(2));
				   InputStream is=new FileInputStream("C:/Tomcat 9.0/webapps/jsp/files/"+rs.getString(1));
				   BufferedReader br = new BufferedReader(new InputStreamReader(is));
		    	    StringBuilder sb = new StringBuilder();
		    	    String line = br.readLine();
		    	    while (line != null) {
		    	        sb.append(line).append("\n");
		    	        line = br.readLine();
		    	    }
		    	    
		    	    ScriptEngineManager manager = new ScriptEngineManager();
				    ScriptEngine engine = manager.getEngineByName("JavaScript");
				    engine.eval(Files.newBufferedReader(Paths.get("C:/Tomcat 9.0/webapps/jsp/blake512.js"), StandardCharsets.UTF_8));
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
<a href="upload.jsp">hi </a>
</body>
</html>