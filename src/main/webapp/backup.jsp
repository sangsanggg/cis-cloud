<%-- 
    Document   : backup
    Created on : Nov 26, 2022, 3:00:19 AM
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
        <link rel="stylesheet" href="backup.css" />
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
              Connection connect = null;
              ResultSet rec = null;
              Statement s = null;
            
              try{
                      Class.forName("com.mysql.jdbc.Driver");
                      connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1","root","");
                      s = connect.createStatement();
                      String sql = "SELECT DISTINCT backup.user_id,name,last_name FROM backup,user WHERE user.user_id = backup.user_id order by backup_id ASC";
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

            <main class="content">
                <h1>Backups</h1>
                <div class="container-fluid" style=" height: 100%;">
                    <div class="row">
                        <%while((rec!=null)&&(rec.next())){ %>
                        <div class="col-2" style="height:200px">
                            <a href='backup-detail.jsp?u=<%=rec.getString("user_id")%>' class="btn" style="width : 15%; display: inline; height: 15%;">
                                <div class="item_card" >
                                    <div class="card text-center" id="folder">
                                        <div class="card-body">
                                            <i class="fa-solid fa-folder"></i>
                                            <h5 class="card-title"><%=rec.getString("name")%> <%=rec.getString("last_name")%></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <% } %>
                    </div>
                </div>
                <div class="row">
                    <div class="backup_title">
                        <div class="col-6">
                            <div class="searchbar">

                            </div>
                        </div>
                    </div>
                </div>

                <!--<div class="row my-4">
                    <div class="col-xl-12">
                        <div class="col-xl-12 control_card">
                            <div class="col-xl-12 item_card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title"></div>-->


                <!-- row folder -->

                <!--<div class="row my-4">
                    
                  <div class="col-2 item_card">
                    <div class="card text-center" id="folder">
                      <div class="card-body">
                        <i class="fa-solid fa-folder"></i>
                        <h5 class="card-title">Pornpan saechua</h5>
                      </div>
                    </div>
                  </div>
                  <div class="col-2 item_card">
                    <div class="card text-center" >
                      <div class="card-body">
                        <i class="fa-solid fa-folder"></i>
                        <h5 class="card-title">Pornpan saechua</h5>
                      </div>
                    </div>
                  </div>
                  <div class="col-2 item_card">
                    <div class="card text-center">
                      <div class="card-body">
                        <i class="fa-solid fa-folder"></i>
                        <h5 class="card-title">Pornpan saechua</h5>
                      </div>
                    </div>
                  </div>
                  <div class="col-2 item_card">
                    <div class="card text-center">
                      <div class="card-body">
                        <i class="fa-solid fa-folder"></i>
                        <h5 class="card-title">Pornpan saechua</h5>
                      </div>
                    </div>
                  </div>
                  <div class="col-2 item_card">
                    <div class="card text-center">
                      <div class="card-body">
                        <i class="fa-solid fa-folder"></i>
                        <h5 class="card-title">Pornpan saechua</h5>
                      </div>
                    </div>
                  </div>
                  <div class="col-2 item_card">
                    <div class="card text-center">
                      <div class="card-body">
                        <i class="fa-solid fa-folder"></i>
                        <h5 class="card-title">Pornpan saechua</h5>
                      </div>
                    </div>
                  </div>
                </div>-->

                <!--<%while((rec!=null)&&(rec.next())){ %>
               <div class="item_card" style="display: flex; box-sizing: border-box;">
                   <div class="card text-center" id="folder" style="display: block; box-sizing: border-box;">
                       <div class="card-body" style="display: block; box-sizing: border-box;">
                           <i class="fa-solid fa-folder"></i>
                           <h5 class="card-title"><%=rec.getString("user_id")%></h5>
                       </div>
                   </div>
               </div>

                <% } %>-->


        </div>
    </div>
</div>
</div>
</div>



</div>


</main>
</div>

<script>
    const menu_toggle = document.querySelector(".menu-toggle");
    const sidebar = document.querySelector(".sidebar");

    const folder = document.getElementById("folder");
    const FD = document.querySelector(".card");

    FD.addEventListener("click", () => {
        location.replace('./backup-detail.jsp');
        console.log(FD);
    });



    const gotoFD = () => {
        location.replace('./backup-detail.jsp');
    }

    folder.addEventListener("click", () => {
        location.replace('./backup-detail.jsp');
        console.log(FD);
    });

    menu_toggle.addEventListener("click", () => {
        menu_toggle.classList.toggle("is-active");
        sidebar.classList.toggle("is-active");
    });
</script>
</body>
</html>

