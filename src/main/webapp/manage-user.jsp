<%-- 
    Document   : manage-user
    Created on : Oct 16, 2022, 3:19:25 AM
    Author     : SANGSANG
--%>
<%@page import="java.sql.*" %>
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
        <%
            Connection connect = null;
            ResultSet rec = null;
            Statement s = null;
            
            try{
                    Class.forName("com.mysql.jdbc.Driver");
                    connect = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1","root","");
                    s = connect.createStatement();
                    String sql = "SELECT * FROM user order by user_id ASC";
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
            </a>
        </nav>
      </aside>

      <main class="content">
        <div class="row">
          <div class="col-10">
              <h1>User List</h1><br>
              <h4>Import File (.CSV) </h4>
              <div class="input-group mb-3">
                    <input type="file" accept=".csv" class="form-control" id="inputGroupFile02">
                    <label class="input-group-text" for="inputGroupFile02">Upload</label>
               </div>
          </div>
        
        </div>
        
        <div class="row">
            <div class="backup_title">
              <div class="col">
                <div class="searchbar">
                  <form class="Searchform">
                    <div class="col-3">
                        <a href="addnew.jsp" class="btn btn-dark" style="padding: 10px; margin">Add new user</a>
                    </div>
  
                    <input
                      style="font-family: 'Font Awesome 6 Free'; font-weight: 600"
                      type="text" id="searchBox-2"
                      placeholder=" &#xf002; Search"
                    />
                    <%--    <button type="button" class="btn btn-dark">Search</button> --%>
                  </form>
                </div>
              </div>
            </div>
          </div>
  
          <table class="table table-striped" id="table-2">
            <thead>
              <tr>
                <th scope="col" style="text-align: center">No</th>
                <th scope="col">Username</th>
                <th scope="col">Name</th>
                <th scope="col">Password</th>
                <th scope="col">Role</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
                
              <%while((rec!=null)&&(rec.next())){ %>
              <tr>
                <td style="text-align: center"><%=rec.getString("user_id")%></td>
                <td><%=rec.getString("username")%></td>
                <td><%=rec.getString("name")+ " " + rec.getString("last_name")%></td>
                <td><%=rec.getString("password")%></td>
                <td><%=rec.getString("role")%></td>
                
                <td>
                  <a href='edit.jsp?u=<%=rec.getString("user_id")%>' class="btn  btn-primary" ><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                  <a href="delete.jsp?user_id=<%=rec.getString("user_id")%><button type="button" class="btn btn-danger" onclick="deleteinfo()"><i class="fa-solid fa-trash"></i> Delete</a></button>
                  <a href='note.jsp?u=<%=rec.getString("user_id")%>' class="btn btn-secondary" ><img src="./image/Vector note.svg"> Note</a>
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
        });      
    </script>
    
    <script>
        <%-- window.onload = () =>{
            // (A) FILE READER + HTML ELEMENTS
            var reader = new FileReader(),
                inputGroupFile02 = document.getElementById("inputGroupFile02"),
                table_2 = document.getElementById("table-2");

            // (B) READ CSV ON FILE PICK
            inputGroupFile02.onchange = () => reader.readAsText(inputGroupFile02.files[0]);

            // (C) READ CSV & GENERATE TABLE
            reader.onloadend = () => {
              let csv = reader.result;
              table.innerHTML = "";
              let rows = csv.split("\r\n");
              for (let row of rows) {
                let cols = row.match(/(?:\"([^\"]*(?:\"\"[^\"]*)*)\")|([^\",]+)/g);
                if (cols != null) {
                  let tr = table.insertRow();
                  for (let col of cols) {
                    let td = tr.insertCell();
                    td.innerHTML = col.replace(/(^"|"$)/g, "");
                  }
                }
              }
            };
        };
--%>
        
    </script>
    </body>
</html>
