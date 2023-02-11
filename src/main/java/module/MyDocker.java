/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

import com.google.gson.Gson;
import model.Request;
import model.Response;
/**
 *
 * @author SANGSANG
 */

public class MyDocker {
    public String username;
    public String userType;
    public String host;
    public int port;
    public MyDocker(String host, int port, String username, String userType){
        this.host = host;
        this.port = port;
        this.username = username;
        this.userType = userType;
    }
    public String readImage(String containerName){
        String jsonResponse = "";
        try (Socket clientSocket = new Socket(this.host, this.port);
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()))) {

            Gson gson = new Gson();

            Request request = new Request("1",this.username,"LOAD_I", this.userType);
            request.setStartImage(containerName, "", "");
            String jsonRequest = gson.toJson(request);
            out.println(jsonRequest);

            jsonResponse = in.readLine();
            Response response = gson.fromJson(jsonResponse, Response.class);
            return response.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            return jsonResponse;
        }
    } 
    public String runImage(String imgId,String containerName, String exPort, String inPort){
        String jsonResponse = "";
        try (Socket clientSocket = new Socket(this.host, this.port);
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()))) {

            Gson gson = new Gson();

            Request request = new Request("1",this.username,"RUN_I", this.userType);
            request.setImageId(imgId);
            request.setStartImage(containerName, exPort, inPort);
            String jsonRequest = gson.toJson(request);
            out.println(jsonRequest);

            jsonResponse = in.readLine();
            Response response = gson.fromJson(jsonResponse, Response.class);
            System.out.println(jsonResponse);
            return response.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            return jsonResponse;
        }
    }
}