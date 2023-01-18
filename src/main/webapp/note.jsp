<%-- 
    Document   : note
    Created on : Nov 13, 2022, 7:20:04 PM
    Author     : SANGSANG
--%>

<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.Statement"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="manage-user.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script
      src="https://kit.fontawesome.com/f1990b5319.js"
      crossorigin="anonymous"
    ></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <img src="image/logo.svg" class="img-logo" alt="" />
      
      <div class="title_Dashboard">
        <h2></h2>
      </div>
    </nav>

    <div class="app">
      <div class="menu-toggle">
        <div class="hamburger">
          <span></span>
        </div>
      </div>

      <aside class="sidebar" id="Sidebar">
        <div class="Profile_User">
          <div class="profile">
            <div class="profile_details">
              <img src="image/member-6 1.svg" />
              <div class="name_job">
                <div class="name"><b>Pronpan</b></div>
                <div class="job"><h3>Admin</h3></div>
              </div>
            </div>
            <i class="fa-solid fa-ellipsis" id="setting"></i>
          </div>
        </div>

        <nav class="menu">
          <a href="./dashboard.html" class="menu-item">
            <img src="image/icon-dashboard.svg" />
            <b>Dashboard</b>
          </a>
          <a href="./manage-docker.html" class="menu-item" id="VS">
            <img src="image/icon-virtual server1.svg" />
            <b>Manage Docker</b>
          </a>
          <a href="./manage-server.html" class="menu-item">
            <img src="image/icon-container server.svg" />
            <b>Manage Server</b>
          </a>
          <a href="./manage-user.html" class="menu-item">
            <img src="image/icon-user.svg" />
            <b>Manage User</b>
          </a>
          <a href="./manage-vm.html" class="menu-item">
            <img src="image/icon-user.svg" />
            <b>Manage VM</b>
          </a>
          <a href="./backup.html" class="menu-item">
            <img src="image/icon-user.svg" />
            <b>Backups</b>
          </a>

          
            <a href="#" class="menu-item">
              <img src="image/icon-profile.svg" />
              <b>Profile</b>
            </a>
            <a href="#" class="menu-item">
              <img src="image/icon-setting.svg" />
              <b>Setting</b>
            </a>
        </nav>
      </aside>
      <%
          String host = "jdbc:mysql://localhost:3307/projectcloud1";
          Statement stat = null;
          ResultSet res = null;
          Connection connect = null;
          PreparedStatement stmt = null;
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          connect = DriverManager.getConnection(host,"root","");
      %>
        <main class="content">
        <form action="" method="post">
            <%
                stat = connect.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String data = "select * from user where user_id='"+num+"'";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <input type="hidden" name ="id" value='<%=res.getString("user_id")%>'/>
            <h1>Note</h1><br>
            <div class="mb-2 w-75 ">
            <label for="exampleFormControlTextarea1" class="form-label">Description</label>
<!--            <div class="form-group">
                <div  style="width: 100%; height: 350px; background: #D9D9D9; color: black;  font-size: 16px;">  
                   <br>
                </div><br>
            </div>-->
              <div class="mb-3">
                     <textarea class="form-control" id="exampleFormControlTextarea1" rows="15" name="note"><%=res.getString("note")%></textarea>
              </div>
 </div>
            <%
               }
            %>
            <button type="submit" class="btn btn-primary" onclick="saveinfo()">Update text</button>
            <a href="manage-user.jsp" class="btn btn-default">Back</a>
           
        </form>
       </main>
<script>
                function saveinfo(){
                    alert("Update successfully");
                }
                
            </script>   
    </body>
</html>
<%
    String a = request.getParameter("id");
    String b = request.getParameter("note");
    if(a!=null && b!=null){
    String query = "UPDATE user set note=? where user_id='"+a+"'";
    stmt = connect.prepareStatement(query);
    stmt.setString(1,b);
    stmt.executeUpdate();
    response.sendRedirect("manage-user.jsp");
    }
%>
