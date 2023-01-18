
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
    <link rel="stylesheet" href="addserverr.css" />
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

      <main class="content">
        
        <div class="row my-4">
          <div class="col-xl-12">
            <form action="" method="POST">
            <h1>Add Server</h1>
            <div class="row">
              <div class="col-9 input_area">
                  <div class="row">
                    <div class="col-9">
                      <div class="form-group">
                        <h5>
                          Server name
                        </h5>
                        <input type="text" class="form-control w-100" name="server_name"><br>
                    </div>
                      
                    </div>
                    
<!--                      <div class="form-group">
                        <h5>
                          Port
                        </h5>
                        <div class="mb-3">
                          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="port_number")"></textarea>
                   </div>
                       </div>-->
                  
                  
                    <div class="row">
                      <div class="col-md-6">
                        <h5  class="form-label">Server IP</h5>
                        <input type="text" class="form-control" name="server_ip" style="height: 46px;">
                      </div>
                      <div class="col-md-6">
                        <h5 for="inputPassword4" class="form-label">Permissions</h5>
                      <input type="text" class="form-control" name="permissions" style="height: 46px;">
                         
                             
                          </div><br>                              
                      
                  
                      </div>
                    </div>
                    
                  <br> 
                  <div class="row">
                    <h5>
                    Server Type
                  </h5>
                  
                  <form class="Searchform">
                    <div class="select"  style="width: 60%;">
                      <select id="format" name="type_server">
                        <option >Server type</option>
                        <option value="docker">Docker</option>
                        <option value="vm">VM</option>
                        <option value="backup">Backup</option>
                      </select>
                    </div>                                     
                  </form>
                  </div>
                  <div class="row">
                    <div class="col-xl-12 button-next my-4">
                      <button type="submit"class="btn btn-primary">Update</button>
                      <a href="manage-server.jsp" class="btn btn-default">Back</a>
                  </div>
                  </div>
                  
              </div>
            </div>
          </div>
        </div>
        </form>
        
      </main>
    </div>
    <script src="./bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <script>
      const menu_toggle = document.querySelector(".menu-toggle");
      const sidebar = document.querySelector(".sidebar");

      menu_toggle.addEventListener("click", () => {
        menu_toggle.classList.toggle("is-active");
        sidebar.classList.toggle("is-active");
      });

      const BTnext = document.getElementById("Next");
      BTnext.addEventListener("click",()=> {
        
      });
    </script>
  </body>
</html>
<%
    String a = request.getParameter("server_name");
    String b = request.getParameter("type_server");
    String c = request.getParameter("server_ip");
    String d = request.getParameter("permissions");
//    String e = request.getParameter("port_number");
    String host = "jdbc:mysql://localhost:3307/projectcloud1";
    Connection connect = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null && c!=null && d!=null){
    connect = DriverManager.getConnection(host,"root","");
    String data = "insert into server(server_name,type_server,server_ip,permissions) value(?,?,?,?)";
    stat = connect.prepareStatement(data);
    stat.setString(1,a);
    stat.setString(2,b);
    stat.setString(3,c);
    stat.setString(4,d);
//  stat.setString(5,e);
    stat.executeUpdate();
    response.sendRedirect("manage-server.jsp");
    }
%>
