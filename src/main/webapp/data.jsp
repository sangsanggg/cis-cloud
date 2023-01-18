<%-- 
    Document   : data
    Created on : Nov 10, 2022, 7:53:25 PM
    Author     : SANGSANG
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection connect = null;
            ResultSet rec = null;
            Statement s = null;
            try{
                    Class.forName("com.mysql.jdbc.Driver");
                    connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1","root","");
                    s = connect.createStatement();
                    String sql = "SELECT * FROM user WHERE username="+"'"+request.getParameter("username")+"'"+"and password="+"'"+request.getParameter("password")+"'"+"and role="+"'"+request.getParameter("role")+"'";
                    rec = s.executeQuery(sql);
                    if(rec.next()){
                        session.setAttribute("username",request.getParameter("username"));
                        response.sendRedirect("welcome.jsp");
                    }
                    else{
                        out.println("wrong username and password...");
                    }
            }catch (Exception e){
                    out.println(e.getMessage()); 
                    e.printStackTrace();
           }

        %>
    </body>
</html>
