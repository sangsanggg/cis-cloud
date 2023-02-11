<%-- 
    Document   : manage-docker-container
    Created on : Nov 26, 2022, 2:52:55 AM
    Author     : SANGSANG
--%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.Statement"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
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
        <%          Connection connect = null;
            ResultSet rec = null;
            Statement s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1", "root", "");
                s = connect.createStatement();
                String sql = "SELECT container.container_id,container_name,user.username,user.name,user.last_name, container.con_status, image.name_image, image.created, server.server_ip, container.internal_port,container.external_port, user.role  FROM container LEFT JOIN image on container.img_id = image.img_id LEFT JOIN server on server.server_id = image.server_id LEFT JOIN user on user.user_id = image.user_id;";
                rec = s.executeQuery(sql);
            } catch (Exception e) {
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
                    <a href="./manage-docker.jsp"><button type="button" class="btn btn-dark btn-lg">
                            Upload image file
                        </button></a>
                    <a href="./manage-docker-image_list.jsp"><button type="button" class="btn btn-dark btn-lg">
                            Image list</button></a>
                    <button type="button" class="btn btn-dark btn-lg">Container</button>
                    <a href="./manage-docker-manage.jsp">
                        <button type="button" class="btn btn-dark btn-lg">Manage</button>
                    </a>
                </div>
                <div class="row my-4">
                    <div class="col-xl-12">
                        <h3>Container</h3>
                        <div class="row">
                            <div class="col ">
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

                                            <th scope="col">Container Name</th>
                                            <th scope="col">State</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Created</th>
                                            <th scope="col">Port</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%while ((rec != null) && (rec.next())) {%>
                                        <tr>
                                             
                                            <td><%=rec.getString("container_name")%></td>
                                            <td>
                                                <% if (rec.getInt("con_status") == 1) { %>
                                                <button type="button" class="btn btn-success w-75" disabled >Running</button>
                                                <% } else { %>
                                                <button type="button" class="btn btn-dark w-75"  disabled >Stop</button>
                                                <% }%>
                                            </td>
                                            <td><%=rec.getString("name_image")%></td>

                                            <td><%=rec.getString("created")%></td>
                                            <td><%=rec.getString("external_port") + ":" + rec.getString("internal_port")%></td>

                                            <td>
                                                <% if (rec.getBoolean("con_status")) { %>
                                                <button type="button"  class="btn btn-secondary w-50"onclick="stop('<%=rec.getString("container_id")%>','<%=rec.getString("server_ip")%>')" >
                                                    <i class="fa-solid fa-circle-stop"></i> Stop
                                                </button>
                                                <% } else {%>
                                                <button type="button" class="btn btn-success w-25" onclick="start('<%=rec.getString("container_id")%>','<%=rec.getString("server_ip")%>')">
                                                    <i class="fa-solid fa-circle-play"></i> Start
                                                </button>
                                                
                                                   <button type="button" class="btn btn-danger" onclick="deleteinfo('<%=rec.getString("container_id")%>','<%=rec.getString("server_ip")%>')">
                                                    <i class="fa-solid fa-trash"></i> Delete
                                                </button>
                                                <% } %>

                                            </td>
                                        </tr>
                                        <tr>
                                            <% }%>
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
            const start = (containerID,serverIP) => {
                console.log("start : ",containerID, serverIP);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/cis-cloud/DockerServlet", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function() {
                  if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText);
                    var response = JSON.parse(xhr.responseText);
                    if(!response.error){
                        alert("start success");
                        location.reload();
                    }else{
                        alert("start fail");
                    }
                  }
                };
                var requestData = { "containerId": containerID, "serverIP": serverIP};
              
                xhr.send(JSON.stringify(requestData));
            };
            
            

        </script>   
        <script>
            const stop = (containerID,serverIP) => {
                console.log("stop : ",containerID, serverIP);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/cis-cloud/stopContainer", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function() {
                  if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText);
                    var response = JSON.parse(xhr.responseText);
                    if(!response.error){
                        alert("stop success");
                        location.reload();
                    }else{
                        alert("stop fail");
                    }
                  }
                };
                var requestData = { "containerId": containerID, "serverIP": serverIP};
              
                xhr.send(JSON.stringify(requestData));
            };
             
        </script>  
        <script>
             const deleteinfo = (containerID,serverIP) => {
                console.log("delete : ",containerID, serverIP);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/cis-cloud/deleteContainer", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function() {
                  if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText);
                    var response = JSON.parse(xhr.responseText);
                    if(!response.error){
                        alert("delete success");
                        location.reload();
                    }else{
                        alert("delete fail");
                    }
                  }
                };
                var requestData = { "containerId": containerID, "serverIP": serverIP};
              
                xhr.send(JSON.stringify(requestData));
            };
            
        </script>
        
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

