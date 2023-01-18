<%-- 
    Document   : save
    Created on : Oct 25, 2022, 12:49:28 AM
    Author     : SANGSANG
--%>

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
		
		String strUser_id = request.getParameter("user_id");
		String strUsername = request.getParameter("username");
		String strnName = request.getParameter("name");
                String strnlastName = request.getParameter("lastname");
		String strPassword = request.getParameter("password");
		String strRole = request.getParameter("role");
		
		
		String sql = "UPDATE user " +
				"SET username = '"+ strUsername + "' " +
				", name = '"+ strnName + "' " +
				", password = '"+ strPassword  + "' " +
                                ", lastname = '"+ strnlastName  + "' " +
				", role = '"+ strRole + "' " +
				" WHERE user_id = '" + user_id + "' ";
         s.execute(sql);
        
         out.println("Record Update Successfully");
	  		
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
</html>
