<%-- 
    Document   : editserver
    Created on : Nov 14, 2022, 8:24:28 PM
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
          <a href="./dashboard.jsp" class="menu-item">
            <img src="image/icon-dashboard.svg" />
            <b>Dashboard</b>
          </a>
          <a href="./manage-docker.jsp" class="menu-item" id="VS">
            <img src="image/icon-virtual server1.svg" />
            <b>Manage Docker</b>
          </a>
          <a href="./manage-server.jsp" class="menu-item">
            <img src="image/icon-container server.svg" />
            <b>Manage Server</b>
          </a>
          <a href="./manage-user.jsp" class="menu-item">
            <img src="image/icon-user.svg" />
            <b>Manage User</b>
          </a>
          <a href="./manage-vm.jsp" class="menu-item">
            <img src="image/icon-user.svg" />
            <b>Manage VM</b>
          </a>
          <a href="./backup.jsp" class="menu-item">
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
                String data = "select * from server where server_id='"+num+"'";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <input type="hidden" name ="id" value='<%=res.getString("server_id")%>'/>
            <h1>Edit</h1><br>
            <div class="form-group">
                <label>Sever name</label>
                <input type="text" class="form-control w-50" name="servername" value='<%=res.getString("server_name")%>'/><br>
            </div>
            <div class="form-group">
                <label>Type Server</label>
                <input type="text" class="form-control w-50" name="typeserver" value='<%=res.getString("type_server")%>'/><br>
            </div>
            <div class="form-group">
                <label>Server IP</label>
                <input type="text" class="form-control w-50" name="serverip" value='<%=res.getString("server_ip")%>'/><br>
            </div>
            <div class="form-group">
                <label>Permissions</label>
                <input type="text" class="form-control w-50" name="permissions" value='<%=res.getString("permissions")%>'/><br>
            </div>
            <%
               }
            %>
            <button type="submit"class="btn btn-primary" onclick="saveinfo()">Update</button>
            <a href="manage-server.jsp" class="btn btn-default">Back</a>
           
        </form>
       </main>
           
            <script>
                function saveinfo(){
                    alert("Update Success");
                }
                
            </script>    
    </body>
</html>
<%
    String a = request.getParameter("id");
    String b = request.getParameter("servername");
    String c = request.getParameter("typeserver");
    String d = request.getParameter("serverip");
    String e = request.getParameter("permissions");
    if(a!=null && b!=null && c!=null && d!=null && e!=null){
    String query = "UPDATE server set server_name=?,type_server=?,server_ip=?,permissions=? where server_id='"+a+"'";
    stmt = connect.prepareStatement(query);
    stmt.setString(1,b);
    stmt.setString(2,c);
    stmt.setString(3,d);
    stmt.setString(4,e);
    stmt.executeUpdate();
    response.sendRedirect("manage-server.jsp");
    }
%>
