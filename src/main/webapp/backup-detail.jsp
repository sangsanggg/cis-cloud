<%-- 
    Document   : backup-detail
    Created on : Nov 26, 2022, 3:35:49 AM
    Author     : SANGSANG
--%>

<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.Statement"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CIS CLOUD - Backup</title>
    <link rel="stylesheet" href="manage-docker.css" />
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

      <aside class="sidebar">
        <div class="Profile_User">
          <div class="profile">
            <div class="profile_details">
              <img src="image/member-6 1.svg" />
              <div class="name_job">
                <div class="name"><b>Pronpan</b></div>
                <div class="job">Admin</div>
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
          <a href="./manage-server.jsp" class="menu-item">
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
          <form action="" method="post" name="my-form">
              
        <div class="row my-4">
          <div class="col-xl-12">
            <h1>Backups</h1>
            <div class="row">
                <div class="col-8 input_area" style="width: 100%; height: 550px;">
                <a href="./backup.jsp"><i class="fa-solid fa-circle-chevron-left" style="font-size: 25px ;"></i></a>
                <div class="input-group mb-3">
<!--                    <form action="UploadServlet" method="POST" enctype="multipart/form-data">-->
                    <input type="file" class="form-control" id="inputGroupFile02" name="file">
                  <label class="input-group-text" for="inputGroupFile02"
                    >Upload</label
                  >
                  </form>
                </div>
                <table class="table table-secondary">
                  <thead>
                    <tr>
                      <th scope="col">File name</th>
                      <th scope="col">Created</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                      <%
                stat = connect.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String data = "select * from backup where user_id='"+num+"'";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
                      <tr>
                      <td><%=res.getString("file_path")%></td>
                      <td><%=res.getString("created")%></td>
                      <td>
                        <button type="button" class="btn btn-success">
                          <i class="fa-solid fa-download"></i> Download
                        </button>
                        <button type="button" class="btn btn-danger">
                          <i class="fa-solid fa-trash"></i> Delete
                        </button>
                      </td>
                    </tr>
                      
                      <% } %>
                    
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
         
          </form>
      </main>
    </div>

    
    <script>
      const menu_toggle = document.querySelector(".menu-toggle");
      const sidebar = document.querySelector(".sidebar");

      menu_toggle.addEventListener("click", () => {
        menu_toggle.classList.toggle("is-active");
        sidebar.classList.toggle("is-active");
      });

     
    </script>
  </body>
</html>
