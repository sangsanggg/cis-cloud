/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author SANGSANG
 */
public class Response {
    private final boolean error;
    private String message;
    private String type;
    public Response( boolean error, String message,String type) {
        this.error = error;
        this.message = message;
        this.type = type;
    }
    public Response( boolean error, String message) {
        this.error = error;
        this.message = message;
    }
    public void setType(String type){
        this.type = type;
    }
    public String getType(){
        return this.type;
    }
    public String getMessage(){
        return this.message;
    }
    public boolean getError(){
        return this.error;
    }
}
