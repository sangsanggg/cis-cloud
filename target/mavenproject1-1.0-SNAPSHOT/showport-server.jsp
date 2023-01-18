<%-- 
    Document   : showport-server
    Created on : Dec 25, 2022, 2:12:23 PM
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
<main class="content">
        <h1>Show Port</h1>
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
                <th scope="col" style="text-align: center">Server Name</th>
<!--            <th scope="col">Server Name</th>-->
                <th scope="col">Port Number</th>
                <th scope="col">Status</th>
              </tr>
            </thead>
            <tbody>
                <%
          String host = "jdbc:mysql://localhost:3307/projectcloud1";
          Statement stat1 = null;
          ResultSet res1 = null;
          Connection connect = null;
          PreparedStatement stmt = null;
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          connect = DriverManager.getConnection(host,"root","");
      %>
            <%
                stat1 = connect.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
//              String data = "select * from port where server_id='"+num+"'";
                String data = "select * from server,port where server.server_id=port.server_id AND server.server_id='"+num+"' ";
                res1 = stat1.executeQuery(data);
                
            %>
                <%while((res1!=null)&&(res1.next())){ %>
               <tr>
                <td style="text-align: center"><%=res1.getString("server_name")%></td>
<!--            <td ><%=res1.getString("server_id")%></td>-->
                <td ><%=res1.getString("port_number")%></td>
                <td><%=res1.getString("status")%></td>
                
              </tr>
               <% } %>
           
            </tbody>
          </table>
             <a href="manage-server.jsp" class="btn btn-dark">Back</a>
               
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