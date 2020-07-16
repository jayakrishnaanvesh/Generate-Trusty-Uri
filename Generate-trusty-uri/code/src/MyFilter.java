import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;
import javax.sql.*;
 
// Implements Filter class
public class MyFilter implements Filter  {
   public void  init(FilterConfig config) 
                         throws ServletException{
      // Get init parameter 
      String testParam = config.getInitParameter("test-param"); 
 
      //Print the init parameter 
      System.out.println("Test Param: " + testParam); 
   }
   public void  doFilter(ServletRequest request, 
                 ServletResponse response,
                 FilterChain chain) 
                 throws java.io.IOException, ServletException {
 
      // Get the IP address of client machine.   
      String ipAddress = request.getRemoteAddr();
       PrintWriter out= response.getWriter();  
      // Log the IP address and current timestamp.
      out.println("IP "+ ipAddress + ", Time "
                                       + new java.util.Date().toString());
try{ 
 Class.forName("com.mysql.jdbc.Driver");
			Connection connection =null;
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/makingdigitalartifacts","root","ANVESH143!");	
			Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery("select ip from blocked");
		   int i=1;
		   while(rs.next()){
			   if(rs.getString("ip").equals(ipAddress))
				   i=0;
		   }

		   if(i==1){
      // Pass request back down the filter chain
      chain.doFilter(request,response);
		   }
		   else
		   {
			   out.println("you have been blocked");
		   }
	}
catch(Exception e){}
   }
   public void destroy( ){
      /* Called before the Filter instance is removed 
      from service by the web container*/
   }
}