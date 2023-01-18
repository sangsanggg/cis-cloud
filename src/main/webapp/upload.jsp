<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="javax.servlet.annotation.MultipartConfig" %>

<%
    Part filePart = request.getPart("zipFile");
    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    InputStream fileContent = filePart.getInputStream();
    Path path = Paths.get("C:\\uploadedFiles\\" + fileName);
    Files.copy(fileContent, path);
%>
