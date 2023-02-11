<%-- 
    Document   : dashboard
    Created on : Nov 26, 2022, 2:12:27 AM
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
        <script src="js/app-ajax.js" type="text/javascript"></script>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CIS CLOUD - Backup</title>
        <link rel="stylesheet" href="dashboard.css" />
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

                    <a class="menu-item" href="Logout">
                        <img src="image/icon-profile.svg" />
                        <b>Logout</b>
                    </a>


                </nav>
            </aside>

            <main class="content">
                <!-- <div class="groupbutton">
                  <button type="button" class="btn btn-dark btn-lg">
                    <i class="fa-solid fa-cloud"></i>
                    Overview
                  </button>
                  <button type="button" class="btn btn-dark btn-lg">
                    <i class="fa-solid fa-database"></i>
                    Storage
                  </button>
                  <button type="button" class="btn btn-dark btn-lg">
                    <i class="fa-solid fa-download"></i>
                    Backups
                  </button>
                  <button type="button" class="btn btn-dark btn-lg">
                    <i class="fa-solid fa-sliders"></i>
                    Configuration
                  </button>
                </div> -->
                <%
                    Connection connect = null;
                    ResultSet rec5 = null;
                    Statement s5 = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1", "root", "");
                        s5 = connect.createStatement();
                        String sql = "SELECT DISTINCT COUNT(server_id) as result_server FROM server";
                        rec5 = s5.executeQuery(sql);
                    } catch (Exception e) {
                        out.println(e.getMessage());
                        e.printStackTrace();
                    }

                %>
                <div class="row my-4">
                    <div class="col-xl-8">
                        <div class="col-xl-12 control_card">
                            <div class="col-6 item_card">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="fa-solid fa-server"></i>
                                        <h5 class="card-title">จำนวนเครื่อง Server</h5>
                                        <%while ((rec5 != null) && (rec5.next())) {%>
                                        <h5 class="crad-text" style="color: gray">Total : <%=rec5.getString("result_server")%></h5>
                                    </div>
                                </div>
                            </div>
                            <% }
                                connect.close();
                                rec5.close();
                            %>


                            <%
                                ResultSet rec6 = null;
                                Statement s6 = null;

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1", "root", "");
                                    s6 = connect.createStatement();
                                    String sql = "SELECT DISTINCT COUNT(user_id) as result_user FROM user;";
                                    rec6 = s6.executeQuery(sql);
                                } catch (Exception e) {
                                    out.println(e.getMessage());
                                    e.printStackTrace();
                                }

                            %>    
                            <div class="col-6 item_card">
                                <div class="card">
                                    <div class="card-body">
                                        <img src="image/imgGraph/user graph circle.svg" />
                                        <h5 class="card-title">จำนวนผู้ใช้</h5>
                                        <%while ((rec6 != null) && (rec6.next())) {%>
                                        <h5 class="crad-text" style="color: gray">Total : <%=rec6.getString("result_user")%></h5>
                                    </div>
                                </div>
                            </div>
                            <% }
                                connect.close();
                                rec5.close();
                            %>
                        </div>
                        <div class="col-xl-12 control_card">
                            <div class="col-xl-12 item_card">

                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title">

                                            <div class="col-8">
                                                <h4 class="">Server Overview</h4> 
                                                <form action="dashboard.jsp" method="POST">
                                            </div>
                                            <div class="select">

                                                <%
                                                    Statement s = null;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");

                                                        connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1", "root", "");

                                                        s = connect.createStatement();

                                                        String sql = "SELECT * FROM  server ORDER BY server_id ASC";

                                                        ResultSet rec = s.executeQuery(sql);
                                                %>

                                                <select name="cmbSever" onchange="this.form.submit();">
                                                    <option value="0">Select Server</option>
                                                    <%while ((rec != null) && (rec.next())) {%>
                                                    <option value="<%=rec.getInt("server_id")%>"

                                                            <%
                                                                if (request.getParameter("cmbSever") != null) {
                                                                    if (rec.getInt("server_id") == Integer.parseInt(request.getParameter("cmbSever"))) {
                                                                        out.println("selected");
                                                                    }
                                                                }
                                                            %>

                                                            ><%=rec.getString("server_name")%></option>
                                                    <%}
                                                        connect.close();
                                                        rec.close();

                                                    %>
                                                </select>		

                                                <%                } catch (Exception e) {
                                                        // TODO Auto-generated catch block
                                                        out.println(e.getMessage());
                                                        e.printStackTrace();
                                                    }


                                                %>

                                            </div> 
                                        </div>
                                        <%    Connection connect1 = null;
                                            Statement a = null;

                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");

                                                connect1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1", "root", "");

                                                a = connect1.createStatement();

                                                String sql = "select * fROM server where server_id=" + Integer.parseInt(request.getParameter("cmbSever"));

                                                ResultSet rec = a.executeQuery(sql);
                                        %>

                                        <div class="row my-4">
                                            <div class="col-3">
                                                <%while ((rec != null) && (rec.next())) {%>
                                                <h5 class="card-title">Memory</h5>
                                                <p class="crad-text"><%=rec.getString("memory")%></p>
                                            </div>
                                            <div class="col-3">
                                                <h5 class="card-title">Server IP</h5>
                                                <p class="crad-text"><%=rec.getString("server_ip")%></p>
                                            </div>
                                            <div class="col-3">
                                                <h5 class="card-title">Port</h5>
                                                <button type="button" class="btn btn-primary" id="show_port" onclick="getPorts()">Show port</button>

                                            </div>
                                            <div class="col-3">
                                                <h5 class="card-title">Permissions</h5>
                                                <p class="crad-text"><%=rec.getString("permissions")%></p>
                                            </div>
                                        </div>
                                        <div class="row my-4">
                                            <div class="col-4">
                                                <h5 class="card-title">Server Type</h5>
                                                <p class="crad-text"><%=rec.getString("type_server")%></p>
                                            </div>
                                            <div class="col-4">
                                                <h5 class="card-title">Disk space(Free/Total)</h5>
                                                <p class="crad-text"><%=rec.getString("disk_space")%></p>
                                            </div>
                                            <div class="col-4">
                                                <h5 class="card-title">Memory</h5>
                                                <p class="crad-text"><%=rec.getString("memory")%></p>
                                            </div>

                                        </div>
                                        <div class="row my-4">
                                            <div class="col-6">
                                                <h5 class="card-title">CPU</h5> 
                                                <img src="image/imgGraph/dashboard_cpu.svg" />
                                            </div>
                                            <div class="col-6">
                                                <h5 class="card-title">Memory</h5> 
                                                <img src="image/imgGraph/dashboard memory.svg" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%}
                                connect1.close();
                                rec.close();
                            %>

                        </div>
                    </div>
                    <%
                        } catch (Exception e) {
                            // TODO Auto-generated catch block
                            out.println(e.getMessage());
                            e.printStackTrace();
                        }


                    %>
                    <div class="col-xl-4" style="display: none;" id="showportright">

                        <div class="card" style="height: 100%;">
                            <div class="card-body graph">

                                <table class="table table-secondary">
                                    <thead>
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Port Use</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Thanawat</td>
                                            <td>22</td>
                                        </tr>
                                        <tr>
                                            <td>Pornpan</td>
                                            <td>22</td>
                                        </tr>
                                        <tr>
                                            <td>Pornpan</td>
                                            <td>2200</td>
                                        </tr>
                                        <tr>
                                            <td>Thanawat</td>
                                            <td>300</td>
                                        </tr>
                                        <tr>
                                            <td>Saharat</td>
                                            <td>222</td>
                                        </tr>
                                        <tr>
                                            <td>Jetsadaporn</td>
                                            <td>22</td>
                                        </tr>
                                        <tr>
                                            <td>Pornpan</td>
                                            <td>2200</td>
                                        </tr>
                                        <tr>
                                            <td>Thanawat</td>
                                            <td>300</td>
                                        </tr>
                                        <tr>
                                            <td>Saharat</td>
                                            <td>222</td>
                                        </tr>
                                        <tr>
                                            <td>Jetsadaporn</td>
                                            <td>22</td>
                                        </tr>




                                    </tbody>
                                </table>

                            </div>
                        </div>

                    </div>
                </div>
                <%              ResultSet rec = null;
                    Statement b = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1", "root", "");
                        b = connect.createStatement();
                        String sql = "SELECT user.username,user.name,user.last_name, container.con_status, image.name_image, image.created, server.server_ip, container.internal_port,container.external_port, user.role  FROM container LEFT JOIN image on container.img_id = image.img_id LEFT JOIN server on server.server_id = image.server_id LEFT JOIN user on user.user_id = image.user_id;";
                        rec = b.executeQuery(sql);
                    } catch (Exception e) {
                        out.println(e.getMessage());
                        e.printStackTrace();
                    }

                %>
                <div class="row">
                    <div class="col-12 mb-4 mb-lg-0">
                        <div class="card">
                            <h5 class="card-header">Docker</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Name</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">IP</th>
                                                <th scope="col">Port</th>
                                                <th scope="col">Ownership</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%while ((rec != null) && (rec.next())) {%>  
                                            <tr>
                                                <td><%=rec.getString("name") + " " + rec.getString("last_name")%></td>
                                               <td>
                                                <% if (rec.getInt("con_status") == 1) { %>
                                                <button type="button" class="btn btn-success w-75" disabled >Running</button>
                                                <% } else { %>
                                                <button type="button" class="btn btn-dark w-75"  disabled >Stop</button>
                                                <% }%>
                                            </td>
                                                <td><%=rec.getString("name_image")%></td>
                                                <td><%=rec.getString("server_ip")%></td>
                                                <td><%=rec.getString("internal_port") + ":" + rec.getString("external_port")%></td>
                                                <td><%=rec.getString("role")%></td>
                                            </tr>
                                            <% }
                                                connect.close();
                                                rec.close();
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <%
                    ResultSet rec2 = null;
                    Statement s2 = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1", "root", "");
                        s2 = connect.createStatement();
                        String sql = "SELECT A.user_id, A.username,A.name, A.last_name,A.image_size,B.container_size  , C.backup_size , ( A.image_size + B.container_size + C.backup_size ) as result_sum FROM (SELECT user.user_id,user.username,user.name,user.last_name, image.img_id,CASE WHEN COUNT(image.img_id) = 0 THEN 0 ELSE ROUND(SUM(image.size),2) END AS image_size  FROM user LEFT join image on user.user_id = image.user_id GROUP BY user.user_id) AS A INNER JOIN ( SELECT user.user_id,  CASE WHEN COUNT(container.container_id) = 0 THEN 0 ELSE ROUND(SUM(container.size),2) END AS container_size  FROM user LEFT JOIN image on user.user_id = image.user_id LEFT JOIN container on container.img_id = image.img_id GROUP BY user.user_id ) AS B ON  A.user_id = B.user_id LEFT JOIN (SELECT user.user_id,CASE WHEN COUNT(backup.backup_id) = 0 THEN 0 ELSE ROUND(SUM(backup.size),2)END AS backup_size FROM user LEFT JOIN backup on backup.user_id = user.user_id GROUP BY user.user_id) AS C ON A.user_id = C.user_id";
                        rec2 = s2.executeQuery(sql);
                    } catch (Exception e) {
                        out.println(e.getMessage());
                        e.printStackTrace();
                    }

                %>
                <div class="row">
                    <div class="col-12 mb-4 mb-lg-0">
                        <div class="card">
                            <h5 class="card-header">User Resource</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>

                                                <th scope="col">Username</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Resource</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%while ((rec2 != null) && (rec2.next())) {%>
                                            <tr>
                                                <td><%=rec2.getString("username")%></td>
                                                <td><%=rec2.getString("name") + " " + rec2.getString("last_name")%></td>
                                                <td><%=rec2.getString("result_sum")%> MB</td>
                                            </tr>
                                            <% }
                                                connect.close();
                                                rec2.close();
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-12 mb-4 mb-lg-0">
                        <div class="card">
                            <h5 class="card-header">Ativity Log</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col"></th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Action</th>
                                                <th scope="col">Target</th>
                                                <!--                        <th scope="col">Dependent</th>-->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <div class="checkbox-container">
                                                        <input checked type="checkbox" id="cb3" />
                                                        <label for="cb3"></label>
                                                    </div>
                                                </th>
                                                <td>THXWXT</td>
                                                <td>13 jan 15:48</td>
                                                <td>TakeBackup</td>
                                                <td>Backup</td>
                                                <!--                        <td>3194</td>-->
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <div class="checkbox-container">
                                                        <input checked type="checkbox" id="cb3" />
                                                        <label for="cb3"></label>
                                                    </div>
                                                </th>
                                                <td>THXWXT</td>
                                                <td>13 jan 15:48</td>
                                                <td>DestroyBackup</td>
                                                <td>Backup</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <div class="checkbox-container">
                                                        <input checked type="checkbox" id="cb3" />
                                                        <label for="cb3"></label>
                                                    </div>
                                                </th>
                                                <td>THXWXT</td>
                                                <td>13 jan 15:48</td>
                                                <td>DestroyBackup</td>
                                                <td>Backup</td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </main>
        </div>
        <script src="./bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
        <script>
                                                    const menu_toggle = document.querySelector(".menu-toggle");
                                                    const sidebar = document.querySelector(".sidebar");
                                                    const show_port = document.getElementById('show_port');
                                                    const showportright = document.getElementById('showportright');

                                                    var portUSE = [
                                                        {'port': '22'}
                                                    ];
                                                    show_port.addEventListener("click", () => {
                                                        showportright.style.display = "";
                                                    });




                                                    menu_toggle.addEventListener("click", () => {
                                                        menu_toggle.classList.toggle("is-active");
                                                        sidebar.classList.toggle("is-active");
                                                    });

                                                    const getPorts = () => {
                                                        let select = document.getElementsByName("cmbSever");
                                                        if (select.length === 0) {
                                                            return;
                                                        }
                                                        select = select[0];
                                                        const serverID = select.options[select.selectedIndex].value;
                                                        console.log("server id : ", serverID);

                                                    };

        </script>

    </body>
</html>

