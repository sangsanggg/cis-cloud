/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import model.Response;
import module.MyDocker;
import java.sql.SQLException;

/**
 *
 * @author SANGSANG
 */
public class stopContainer extends HttpServlet {

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
            out.println("<title>Servlet DockerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DockerServlet at " + request.getContextPath() + "</h1>");
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
        // Read the request body as a string
        System.out.println("POST");
        HttpSession session = request.getSession();
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestData = sb.toString();

        // Use Gson to convert the request data to a Java object
        Gson gson = new Gson();
        RequestData data = gson.fromJson(requestData, RequestData.class);
        System.out.println(data.serverIP + " " + data.containerId);
        //

        //start
        MyDocker docker = new MyDocker(data.serverIP, 8080, "6204062630084", "student");

        String resp = docker.stopContainer(data.containerId);
        //convert resp string to obj
        Response respObj = gson.fromJson(resp, Response.class);

        Connection connect = null;
        ResultSet rec5 = null;
        Statement s5 = null;

        try {
            //    String e = request.getParameter("port_number");
            String host = "jdbc:mysql://localhost:3307/projectcloud1";
            PreparedStatement stat = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            //check variable
            connect = DriverManager.getConnection(host, "root", "");
            //updata container
            if (!respObj.getError()) {
                String updateContainer = "UPDATE container set con_status = 0 where container_id = ?;";
                stat = connect.prepareStatement(updateContainer);
                stat.setString(1, data.containerId);
                stat.executeUpdate();
            }

        } catch (Exception e) {
            out.println(e.getMessage());
            e.printStackTrace();
            System.out.println("Error : " + e.getMessage());
        }

        // Write the response as a JSON string
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(resp);
        out.flush();
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

class RequestData {

    String serverIP;
    String containerId;
}

class ResponseData {

    String message;
}
