<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
	
</head>
<body>
	
	<%	
	Connection connect = null;
	Statement s = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect =  DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1","root","");
		
		s = connect.createStatement();
		
		String strImageID = request.getParameter("img_id");
		
		
		String sql = "DELETE FROM image " +
				" WHERE img_id = '" + strImageID + "' ";
         s.execute(sql);
          
          response.sendRedirect("manage-docker-image_list.jsp");
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
</body>
</html><%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
	
</head>
<body>
	
	<%	
	Connection connect2 = null;
	Statement s2 = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect2 =  DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1","root","");
		
		s2 = connect2.createStatement();
		
		String strContainerID = request.getParameter("container_id");
		
		
		String sql = "DELETE FROM container " +
				" WHERE container_id = '" + strContainerID + "' ";
         s2.execute(sql);
          
          response.sendRedirect("manage-docker-manage.jsp");
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s2!=null){
				s2.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
</body>
</html>