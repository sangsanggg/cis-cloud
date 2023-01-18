<%-- 
    Document   : update
    Created on : Oct 25, 2022, 12:40:10 AM
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
		
		String sql = "SELECT * FROM  user WHERE user_id = '" + user_id + "'  ";
		
		ResultSet rec = s.executeQuery(sql);
		if(rec != null) {
			rec.next();
		%>
	<form name="frmUpdate" method="post" action="save.jsp?user_id=<%=rec.getString("user_id")%>">	
		Update Form
			<table width="428" border="1">	
			<tr>
				<th width="181">
				<div align="left">username </div></th>
				<td width="231"><%=rec.getString("username")%></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Name </div></th>
				<td><input type="text" name="txtName" size="20" value="<%=rec.getString("name")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">password </div></th>
				<td><input type="text" name="txtEmail" size="20" value="<%=rec.getString("password")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">role </div></th>
				<td><input type="text" name="txtCountryCode" size="2" value="<%=rec.getString("role")%>"></td>
			</tr>
		
			</table> 
		<input type="submit" value="Save">
		</form> 
		
		<% }
	  		
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
