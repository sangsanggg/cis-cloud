<%-- 
    Document   : manage-user
    Created on : Oct 16, 2022, 3:19:25 AM
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
            <%
                stat = connect.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String data = "select * from user where user_id='"+num+"'";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <input type="hidden" name ="id" value='<%=res.getString("user_id")%>'/>
           
            <h1>Edit</h1><br>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control w-50" name="username" value='<%=res.getString("username")%>'/><br>
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control w-50" name="name" value='<%=res.getString("name")%>'/><br>
            </div>
            <div class="form-group">
                <label>last Name</label>
                <input type="text" class="form-control w-50" name="lastname" value='<%=res.getString("last_name")%>'/><br>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input id="passtest" type="password" class="form-control w-50" name="password" value='<%=res.getString("password")%>'/><br>
            </div>
            <div class="form-group" id="hideValueRole">
                
                <input  id="RoleValue" type="password" class="form-control w-50" name="password" value='<%=res.getString("role")%>'/><br>
            </div>
            
            <div class="form-group">
                <label>Role</label>
                
                <select class="form-select w-50" name="role" id="form-select" aria-label="Default select example" value='<%=res.getString("role")%>'/>
                <option disabled="true" selected>Select Role</option>
                    <option value="Admin" id ="Admin">Admin</option>
                    <option value="Teacher" id="Teacher">Teacher</option>
                    <option value="Student" id="Student">Student</option>
                  </select>
                
            </div><br>
            
            <%
               }
            %>
            <button type="submit"class="btn btn-primary" id="Next">Update</button>
            <a href="manage-user.jsp" class="btn btn-default">Back</a>
           
        </form>
           
       </main>
           <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                
                let form = document.forms['my-form'];
                let menu = form.role;
                let options = form.role.options;
                
//                console.log(options);
                
                
                
                
                <%-- function saveinfo(){
                    alert("Update Success");
                }--%>
                const hidepass = document.getElementById("RoleValue");
                const testselectore = document.getElementById("RoleValue").value;
                const btnupdate = document.getElementById("Next");
//                console.log(testselectore);
                const hideValueRole = document.getElementById("hideValueRole");
                hideValueRole.style.display = "none";
                
                if(testselectore == 'Student'){
                    options[3].selected = true;
                }
                else if(testselectore == 'Teacher'){
                    options[2].selected = true;
                }
                else if(testselectore == 'Admin'){
                    options[1].selected = true;
                }
                
                
                btnupdate.addEventListener("click",()=>{
                            <%--Swal.fire({
                    icon: 'success',
                    title: 'Your work has been saved',
                    showConfirmButton: false,
                    timer: 1500
});--%>
                });
            </script>    
    </body>
</html>
<%
    String a = request.getParameter("id");
    String b = request.getParameter("username");
    String c = request.getParameter("name");
    String d = request.getParameter("lastname");
    String e = request.getParameter("password");
    String f = request.getParameter("role");
    if(a!=null && b!=null && c!=null && d!=null && e!=null){
    String query = "UPDATE user set username=?,name=?,last_name=?,password=?,role=? where user_id='"+a+"'";
    stmt = connect.prepareStatement(query);
    stmt.setString(1,b);
    stmt.setString(2,c);
    stmt.setString(3,d);
    stmt.setString(4,e);
    stmt.setString(5,f);
    stmt.executeUpdate();
    response.sendRedirect("manage-user.jsp");
    
    }
%>