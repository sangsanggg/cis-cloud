/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.model.Image;
import com.github.dockerjava.core.DockerClientBuilder;


/**
 *
 * @author SANGSANG
 */
@WebServlet(urlPatterns = {"/FTPServlet"})
@MultipartConfig
public class FTPServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FTPServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FTPServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String folderName = request.getParameter("username");
        Part filePart = request.getPart("docker_file");
        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();
        FTPClient ftpClient = new FTPClient();
        ftpClient.setUseEPSVwithIPv4(false);//remove if use IPV6
        String containerName = String.format("username_%s", folderName );
        String externalPort = request.getParameter("external");
        String internalPort = request.getParameter("internal");
        try {
            ftpClient.connect("127.0.0.1", 21);
            ftpClient.login("B1", "root");
            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            ftpClient.makeDirectory(folderName); // create new folder
            ftpClient.changeWorkingDirectory(folderName); // move to new folder
            ftpClient.storeFile(fileName, fileContent);
            //generate batch file
            StringBuilder sb = new StringBuilder();
            sb.append("@echo off\n\n");
            sb.append("REM Run the image\n");
            String a = String.format("docker run -d --name %s -p %s:%s my_image\n\n",containerName, externalPort, internalPort);
            sb.append(a);
            String batCommand = sb.toString();
            //
            ftpClient.storeFile("run_docker.bat", new ByteArrayInputStream(batCommand.getBytes()));
            response.sendRedirect("/mavenproject1/manage-docker-image_list.jsp"); 
        } catch (IOException e) {
            out.println("Error uploading file: " + e.getMessage());
        } finally {
            fileContent.close();
            ftpClient.disconnect();
        }  
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
