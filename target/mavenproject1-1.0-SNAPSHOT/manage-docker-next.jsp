<%-- 
    Document   : manage-docker-next
    Created on : Nov 26, 2022, 2:42:23 AM
    Author     : SANGSANG
--%>

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
        <div class="groupbutton">
          <a href="./manage-docker.jsp"><button type="button" class="btn btn-dark btn-lg">
            Upload image file
          </button></a>
          <a href="./manage-docker-image_list.jsp"><button type="button" class="btn btn-dark btn-lg">
            Image list</button></a>
          <a href="./manage-docker-container.jsp">
            <button type="button" class="btn btn-dark btn-lg">Container</button></a>
          <a href="./manage-docker-manage.jsp">
            <button type="button" class="btn btn-dark btn-lg">Manage</button>
          </a>
        </div>
        <div class="row my-4">
          <div class="col-xl-12">
            <h3>Upload Image File</h3>
            <div class="row">
              <div class="col input_area">
                <a href="./manage-docker.jsp"><i class="fa-solid fa-circle-arrow-left"></i></a><br>
                <br><h4>Port Mapping</h4><br>
                <h5>Select server</h5>
                <div class="select">
                    <select name="format" id="format">
                      <option selected disabled>Select Server</option>
                      <option value="pdf">server_01</option>
                      <option value="pdf">server_02</option>
                      <option value="pdf">server_03</option>
                      <option value="pdf">server_04</option>
                      <option value="pdf">server_05</option>
                      
                    </select>
                </div><br>
                  
                <h5><p>Port</p></h5>
                
                <div class="col-xl-12 control_inputport">
                    <div class="row">
                      <div class="col-3">
                        
                      <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-sm">Host</span>
                        <input type="text" class="form-control" 
                        aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
                        placeholder="8080" style="height: 45px;">
                      </div>  
                      </div>
                    TO
                    <div class="col-3">
                        <div class="input-group input-group-sm mb-3">
                          <span class="input-group-text" id="inputGroup-sizing-sm">Container</span>
                          <input type="text" class="form-control" 
                          aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
                          placeholder="8080" style="height: 45px;">
                        </div>  
                      </div>  
                    </div>
<!--                    <div class="row">
                        <div class="col-3">
                          
                        <div class="input-group input-group-sm mb-3">
                          <span class="input-group-text" id="inputGroup-sizing-sm">Host</span>
                          <input type="text" class="form-control" 
                          aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
                          placeholder="8080" disabled>
                        </div>  
                      </div>
                      TO
                      <div class="col-3">
                          <div class="input-group input-group-sm mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-sm">Container</span>
                            <input type="text" class="form-control" 
                            aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
                            placeholder="8080" disabled>
                          </div>  
                        </div>  
                      </div>-->
                    
                </div>
                <div class="col-xl-12 button-next my-4">
                    <button type="button" class="btn btn-dark btn-lg" id="btndeploy">
                        Deploy the container
                        
                      </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- <table class="table table-secondary">
            <thead>
              <tr>
                <th scope="col">Server</th>
                <th scope="col">Server IP</th>
                <th scope="col">Type Server</th>
                <th scope="col">Port</th>
                <th scope="col">Permissions</th>
                <th scope="col">Status</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>server_01</td>
                <td>192.168.212</td>
                <td>docker</td>
                <td>22</td>
                <td>Teacher</td>
                <td>Full</td>
                <td>
                  <button type="button" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                  <button type="button" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Delete</button>
                </td>
              </tr>
              <tr>
                <td>server_02</td>
                <td>192.168.214</td>
                <td>docker</td>
                <td>22</td>
                <td>Teacher</td>
                <td>Empty</td>
                <td>
                  <button type="button" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                  <button type="button" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Delete</button>
                </td>
              </tr>
              <tr>
                <td>server_03</td>
                <td>192.168.211</td>
                <td>VM</td>
                <td>23</td>
                <td>Teacher</td>
                <td>Full</td>
                <td>
                  <button type="button" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                  <button type="button" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Delete</button>
                </td>
              </tr>
              <tr>
                <td>server_04</td>
                <td>192.168.165</td>
                <td>VM</td>
                <td>80</td>
                <td>Student</td>
                <td>Full</td>
                <td>
                  <button type="button" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                  <button type="button" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Delete</button>
                </td>
              </tr>
              <tr>
                <td>server_05</td>
                <td>192.168.182</td>
                <td>docker</td>
                <td>22</td>
                <td>Student</td>
                <td>Full</td>
                <td>
                  <button type="button" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                  <button type="button" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Delete</button>
                </td>
              </tr>
              
            </tbody>
          </table> -->
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
    </script>
  </body>
</html>

