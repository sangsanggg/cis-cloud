<%-- 
    Document   : manage-docker
    Created on : Nov 26, 2022, 2:34:50 AM
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
        </nav>
      </aside>

      <main class="content">
        <div class="groupbutton">
          <button type="button" class="btn btn-dark btn-lg">
            Upload image file
          </button>
          <a href="./manage-docker-image_list.jsp">
            <button type="button" class="btn btn-dark btn-lg">Image list</button></a>
          <a href="./manage-docker-container.jsp">
            <button type="button" class="btn btn-dark btn-lg">Container</button></a>
          <a href="./manage-docker-manage.jsp">
            <button type="button" class="btn btn-dark btn-lg">Manage</button>
          </a>
        </div>
        <div class="row my-4">
          <div class="col-xl-12">
            <form action="FTPServlet" method="POST" enctype="multipart/form-data">
            <h3>Upload Image File</h3>
            <div class="row">
              <div class="col input_area" style="height:870px;">
                
                <h5>Name</h5>
                <input type="text" class="form-control w-25" name="containerName" placeholder="Docker Container Name" style="height: 40px;">
                <h5><p>Upload File</p></h5>

                <div class="col-xl-12 item_card">
                  <div class="card" style="width: 500px">
                    <div class="card-body text-center">
                      <i class="fa-solid fa-cloud-arrow-up"></i>
                      <p>Select a file .tar file</p>
                      <input type="file" name="docker_file" class="form-control" id="inputGroupFile02" style="height: 40px; width: 100%;" accept=".tar"><br>
                    </div>
                  </div>
                </div>
                <br><h4>Port Mapping</h4><br>
                <h5>Select server</h5>
                <div class="select">
                     <%
	
	Statement s = null;
	Connection connect = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect =  DriverManager.getConnection("jdbc:mysql://localhost:3307/projectcloud1","root","");
		
		s = connect.createStatement();
		
		String sql = "SELECT * FROM  server ORDER BY server_id ASC";
		
		ResultSet rec = s.executeQuery(sql);
		%>
		
                <select name="cmbSever">
                        <option value="null">Select Server</option>
			<%while((rec!=null) && (rec.next())) { %>
                        <option value="<%= String.format("%s-%s", rec.getString("server_id"), rec.getString("server_ip"))%>"
                                
                                <%
                                if(request.getParameter("cmbSever")!=null)
                                {
                                    if(rec.getInt("server_id")==Integer.parseInt(request.getParameter("cmbSever")))
                                    {
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
	     
	    <%	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		
	%>
                    </select>
                </div><br>
                  
                <h5><p>Port</p></h5>
                
                <div class="col-xl-12 control_inputport">
                    <div class="row">
                      <div class="col-3">
                        
                      <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-sm">Host</span>
                        <input type="text" class="form-control" name="external"
                        aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
                        placeholder="8080" style="height: 45px;">
                      </div>  
                      </div>
                    TO
                    <div class="col-3">
                        <div class="input-group input-group-sm mb-3">
                          <span class="input-group-text" id="inputGroup-sizing-sm">Container</span>
                          <input type="text" class="form-control" name="internal"
                          aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
                          placeholder="8080" style="height: 45px;">
                        </div>  
                      </div>  
                    </div>

                    
                </div>
                <div class="col-xl-12 button-next my-4">
                    <button type="submit" class="btn btn-dark btn-lg" id="btndeploy">
                        Deploy the container
                        
                      </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        </form>
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

