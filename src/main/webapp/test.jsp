<%-- 
    Document   : test
    Created on : Jan 15, 2023, 9:06:22 PM
    Author     : SANGSANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="upload.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="zipFile">
            <input type="submit" value="Upload">
        </form>
    </body>
</html>
