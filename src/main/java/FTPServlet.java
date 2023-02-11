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
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import module.MyFTP;
import module.MyDocker;
import model.Response;


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
        //get data form request
        PrintWriter out = response.getWriter();
        //get request data
        String server = request.getParameter("cmbSever");
        String containerName = request.getParameter("containerName");
        Part filePart = request.getPart("docker_file");
        String externalPort = request.getParameter("external");
        String internalPort = request.getParameter("internal");
        //get .tar file data
        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();
        
        //useFTP
        if(server.equals("null")){
           out.print("select server");
        }
        String[] ss = server.split("-");
        String serverID = ss[0];
        String serverIP = ss[1];
        MyFTP ftp = new MyFTP(serverIP,"student-docker","student",21, "6204062630084");
        ftp.connect();
        ftp.saveFile(containerName,"image.tar", fileContent);
        ftp.disconnect();

        //docker
        MyDocker docker = new MyDocker(serverIP, 8080, "6204062630084", "student-docker");
        //load docker image
        String imageId = docker.readImage(containerName);
        //create container
        String containerId = docker.runImage(imageId, containerName, externalPort, internalPort);
        //out put
        out.printf("File: %s | Server: %s | Name: %s | Internal: %s | External: %s | image ID: %s | container ID: %s",fileName,serverID, containerName, externalPort, internalPort, imageId, containerId);
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
