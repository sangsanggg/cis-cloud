<%-- 
    Document   : manage-server
    Created on : Nov 14, 2022, 6:20:55 PM
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
    <link rel="stylesheet" href="manage-server.css" />
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
                    String sql = "SELECT * FROM server order by server_id ASC";
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
              <img src="image/member-6 1.svg">
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
        <h1>Manage Server</h1>
        <div class="row">
            <div class="backup_title">
              <div class="col">
                <div class="searchbar">
                  
                  <form class="Searchform">
                    <!-- <div class="select">
                      <select name="format" id="format">
                        <option selected disabled>Server type</option>
                        <option value="pdf">Docker</option>
                        <option value="txt">VM</option>
                        
                      </select>
                    </div> -->
  
                    <!-- <input
                      style="font-family: 'Font Awesome 6 Free'; font-weight: 600"
                      type="text"
                      placeholder=" &#xf002; Search"
                    /> -->
                    <div class="col-2">
                      <a href="addserverr.jsp" class="btn btn-dark" style="padding: 10px;">Add new server</a>
                  </div>
                  <input style="font-family: 'Font Awesome 6 Free'; font-weight: 600" type="text" id="searchBox-2"
                  placeholder=" &#xf002; Search"
                />
                    
                  </form>
                </div>
              </div>
            </div>
          </div>
  
          <table class="table table-striped" id="table-2">
               
            <thead>
              <tr>
                <th scope="col" style="text-align: center">No</th>
                <th scope="col">Server name</th>
                <th scope="col">Type Server</th>
                <th scope="col">Server IP</th>
                <th scope="col">Port</th>
                <th scope="col">Permissions</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
                <%while((rec!=null)&&(rec.next())){ %>
               <tr>
                <td style="text-align: center"><%=rec.getString("server_id")%></td>
                <td><%=rec.getString("server_name")%></td>
                <td><%=rec.getString("type_server")%></td>
                <td><%=rec.getString("server_ip")%></td>
                <td><a href='showport-server.jsp?u=<%=rec.getString("server_id")%>' class="btn btn-dark" >Show</button></td>
                <td><%=rec.getString("permissions")%></td>
                
                <td>
                  <a href='editserver.jsp?u=<%=rec.getString("server_id")%>' class="btn btn-success" ><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                  <a href="deleteserver.jsp?server_id=<%=rec.getString("server_id")%><button type="button" class="btn btn-danger" onclick="deleteinfo()"><i class="fa-solid fa-trash"></i> Delete</a></button>
                  <a href='noteserver.jsp?u=<%=rec.getString("server_id")%>' class="btn btn-secondary" ><img src="./image/Vector note.svg"> Note</a>
                </td>
              </tr>
               <% } %>
              
            </tbody>
          </table>
      </main>
    </div>
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
                    var name_column = all_tr[i].getElementsByTagName("td")[1];
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