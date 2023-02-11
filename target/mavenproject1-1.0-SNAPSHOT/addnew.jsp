<%-- 
    Document   : addnew
    Created on : Nov 13, 2022, 2:40:14 AM
    Author     : SANGSANG
--%>

<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%
            if (session.getAttribute("name") == null) {
                response.sendRedirect("index.jsp");
            }

        %>
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
                <div class="name"><b><%=session.getAttribute("name")%></b></div>
                                <div class="job"><%=session.getAttribute("role")%></div>
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
          <a href="./backup.html" class="menu-item">
            <img src="image/icon-user.svg" />
            <b>Backups</b>
          </a>

          
            <a class="menu-item" href="Logout">
                        <img src="image/icon-profile.svg" />
                        <b>Logout</b>
                    </a>
        </nav>
      </aside>
        <main class="content">
        <form action="" method="post">
            <h1>Add New User</h1><br>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control w-50" name="username" placeholder="Enter username"/><br>
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control w-50" name="name" placeholder="Enter Name"/><br>
            </div>
            <div class="form-group">
                <label>last Name</label>
                <input type="text" class="form-control w-50" name="lastname" placeholder="lastName"/><br>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control w-50" name="password" placeholder="Enter password"/><br>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select class="form-select w-50" name="role" id="form-select"aria-label="Default select example">
                    <option>Select Role</option>
                    <option value="Admin">Admin</option>
                    <option value="Teacher">Teacher</option>
                    <option value="Student">Student</option>
                  </select>
            </div><br>
            <button type="submit"class="btn btn-primary" onclick="saveinfo()">Submit</button>
            <a href="manage-user.jsp" class="btn btn-default">Back</a>
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
    String a = request.getParameter("username");
    String b = request.getParameter("name");
    String c = request.getParameter("lastname");
    String d = request.getParameter("password");
    String e = request.getParameter("role");
    String host = "jdbc:mysql://localhost:3307/projectcloud1";
    Connection connect = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null && c!=null && d!=null && e!=null){
    connect = DriverManager.getConnection(host,"root","");
    String data = "insert into user(username,name,last_name,password,role) value(?,?,?,?,?)";
    stat = connect.prepareStatement(data);
    stat.setString(1,a);
    stat.setString(2,b);
    stat.setString(3,c);
    stat.setString(4,d);
    stat.setString(5,e);
    stat.executeUpdate();
    response.sendRedirect("manage-user.jsp");
    }
%>