<%-- 
    Document   : index.jsp
    Created on : Nov 11, 2022, 5:44:17 PM
    Author     : SANGSANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CIS CLOUD LOGIN</title>
        <link rel="stylesheet" href="login.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap" rel="stylesheet">
    </head>

    <body>
        <%
            if (session.getAttribute("name") != null) {
                response.sendRedirect("dashboard.jsp");
            }

        %>
        <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
        <div class="container h-100">
            <div class="row">
                <div class="col-lg-6 m-auto">
                    <!-- <div class="background"> -->
                    <h1 class="sign-in-to">Sign In to</h1>
                    <span class="cis-cloud">CIS Cloud
                        <img src="image/icon-cloud-login.svg" class="icon-cloud-login pb-3">
                    </span>
                    <div class="des-thai1">ระบบคลาวด์ภาควิชาวิทยาการคอมพิวเตอร์และสารสนเทศ</div>
                    
                </div>
                <div class="col-lg-5 m-auto">
                    <form action="LoginServlet" method="POST">
                        <p class="username">Username</p>
                        <!-- <input type="text" placeholder="       Enter Username" class="username-box"> -->
                        <input type="text" class="form-control" name="username" id="exampleInputEmail1" placeholder="Enter Username" required>
                        <p class="Password">Password</p>
                        <input type="password" id="inputPassword5" name="password" class="form-control" placeholder="Enter Password" required>
                        <div id="passwordHelpBlock" class="form-text">
                            Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                        </div>
<!--                        <p class="Role">Role</p>
                        <select class="form-select" name="role" id="form-select"aria-label="Default select example">
                            <option selected>Select Role</option>
                            <option value="Admin">Admin</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Student">Student</option>
                        </select>-->
                        <button type="submit" id="myButton" class="btn btn-secondary button-signin fs-5" value="login">Login</button>
                       

                </div>
                </form>
            </div>
        </div>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="text/javascript">
            var status = document.getElementById("status").value;
            
            if (status == "failed") {
                Swal.fire({
                    
                    icon: 'error',
                    title: 'Wrong username or password',
                    showConfirmButton: false,
                    timer: 1500
                })
            }
        </script>


    </body>
</html>