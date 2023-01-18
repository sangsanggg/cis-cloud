<%-- 
    Document   : send image
    Created on : Jan 15, 2023, 6:09:36 PM
    Author     : SANGSANG
--%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%
    String savePath = "C:\\uploads";
    File fileSaveDir = new File(savePath);
    if (!fileSaveDir.exists()) {
        fileSaveDir.mkdir();
    }   
    out.println(request.getContentType());
//    Part part = request.getPart("file");
//    try {
//        Part part = request.getPart("file");
//        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//        part.write(savePath + File.separator + fileName);
//       
//    } catch (IOException | ServletException e) {
//        out.println("Error: " + e.getMessage());
//    }
%>

