<%-- 
    Document   : manage-docker-manage
    Created on : Nov 26, 2022, 2:55:15 AM
    Author     : SANGSANG
--%>
<%@page import="java.sql.*" %>
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
      <%
            if (session.getAttribute("name") == null) {
                response.sendRedirect("index.jsp");
            }

        %>
      <%
            Connection connect = null;
            ResultSet rec = null;
            Statement s = null;
            
            try{
                    Class.forName("com.mysql.jdbc.Driver");
                    connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1","root","");
                    s = connect.createStatement();
                    String sql = "SELECT container.container_id,container_name,user.username,user.name,user.last_name, container.con_status, image.name_image, image.created, server.server_ip, container.internal_port,container.external_port, user.role  FROM container LEFT JOIN image on container.img_id = image.img_id LEFT JOIN server on server.server_id = image.server_id LEFT JOIN user on user.user_id = image.user_id;";
                    rec = s.executeQuery(sql);
            }catch (Exception e){
                    out.println(e.getMessage()); 
                    e.printStackTrace();
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

      <aside class="sidebar">
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

          <a class="menu-item" href="Logout">
                        <img src="image/icon-profile.svg" />
                        <b>Logout</b>
                    </a>
          </a>
        </nav>
      </aside>

      <main class="content">
        <div class="groupbutton">
          <a href="./manage-docker.jsp"
            ><button type="button" class="btn btn-dark btn-lg">
              Upload image file
            </button></a
          >
          <a href="./manage-docker-image_list.jsp"
            ><button type="button" class="btn btn-dark btn-lg">
              Image list
            </button></a
          >
          <a href="./manage-docker-container.jsp"><button type="button" class="btn btn-dark btn-lg">Container
          </button>
      </a>
          <button type="button" class="btn btn-dark btn-lg">Manage</button>
        </div>
        <div class="row my-4">
          <div class="col-xl-12">
            <h3>Manage</h3>
            <div class="row">
              <div class="col">
                <!-- <button type="button" class="btn btn-dark"><i class="fa-solid fa-circle-play"></i> Start</button>
                <button type="button" class="btn btn-dark"><i class="fa-solid fa-circle-stop"></i> Stop</button>
                <button type="button" class="btn btn-dark"><i class="fa-solid fa-circle-xmark"></i> Remove</button> -->
                <form class="Searchform">
                  <input
                    style="font-family: 'Font Awesome 6 Free'; font-weight: 600"
                    type="text"
                    placeholder=" &#xf002; Search" id="searchBox-2"
                  />
                </form>
                <table class="table table-striped" id="table-2">
                  <thead>
                    <tr>

                      <th scope="col">Name</th>
                      <th scope="col">Container Name</th>
                      <th scope="col">Image</th>
                      <th scope="col">State</th>
                      <th scope="col">Created</th>
                      <th scope="col">IP</th>
                      <th scope="col">Port</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <%while((rec!=null)&&(rec.next())){ %>
                    <tr>

                      <td><%=rec.getString("name")+ " " + rec.getString("last_name")%></td>
                      <td><%=rec.getString("container_name")%></td>
                       <td><%=rec.getString("name_image")%></td>
                      <td>
                        <button type="button" class="btn btn-dark" disabled>
                          Running
                        </button>
                      </td>
                      <td><%=rec.getString("created")%></td>
                      <td><%=rec.getString("server_ip")%></td>
                      <td><%=rec.getString("internal_port")+ ":" + rec.getString("external_port")%></td>
<!--                      <td><%=rec.getString("role")%></td>-->
                      <td>
                        <button type="button" class="btn btn-success">
                          <i class="fa-solid fa-circle-play"></i> Start
                        </button>
                        <button type="button"  class="btn btn-secondary">
                          <i class="fa-solid fa-circle-stop"></i> Stop
                        </button>
                        <a href="delete-docker-manage.jsp?container_id=<%=rec.getString("container_id")%><button type="button" class="btn btn-danger" onclick="deleteinfo()"><i class="fa-solid fa-trash"></i> Delete</a></button>
                      </td>
                    </tr>
                    <tr>
                      <% } %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

        
      </main>
    </div>
    <script src="./bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <script>
                function deleteinfo(){
                    alert("Successfully Delete");
                }
                
            </script>   
    <script>
      const menu_toggle = document.querySelector(".menu-toggle");
      const sidebar = document.querySelector(".sidebar");

      menu_toggle.addEventListener("click", () => {
        menu_toggle.classList.toggle("is-active");
        sidebar.classList.toggle("is-active");
      });
    </script>
    <script>
            var searchBox_2 = document.getElementById("searchBox-2");
            searchBox_2.addEventListener("keyup",function(){
            var keyword = this.value;
            keyword = keyword.toUpperCase();
            var table_2 = document.getElementById("table-2");
            var all_tr = table_2.getElementsByTagName("tr");
            for(var i=0; i<all_tr.length; i++){
                    
                    var name_column = all_tr[i].getElementsByTagName("td")[0];
                    var email_column = all_tr[i].getElementsByTagName("td")[2];
                    if(name_column && email_column){
                        var name_value = name_column.textContent || name_column.innerText;
                        var email_value = email_column.textContent || email_column.innerText;
                        name_value = name_value.toUpperCase();
                        email_value = email_value.toUpperCase();
                        if((name_value.indexOf(keyword) > -1) || (email_value.indexOf(keyword) > -1)){
                            all_tr[i].style.display = ""; // show
                        }else{
                            all_tr[i].style.display = "none"; // hide
                        }
                    }
                }
        }) ;     
    </script>
  </body>
</html>

