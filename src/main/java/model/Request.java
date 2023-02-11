/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author SANG
 */

public class Request {
    private final String username;
    private final String id;
    private final String userType;
    private String type;
    private String imageId;
    private String containerId;
    private String containerName;
    private String exPort;
    private String inPort;
    public Request(String id,String username, String type, String userType) {
        this.username = username;
        this.id = id;
        this.type = type;
        this.userType = userType;
    }
    public String getUserType(){
        return this.userType;
    }
    public void setStartImage(String containerName,String exPort, String inPort){
        this.containerName = containerName;
        this.exPort = exPort;
        this.inPort = inPort;
    }
    public String getContainerName(){
        return this.containerName;
    }
    public String getExPort(){
        return this.exPort;
    }
    public String getInPort(){
        return this.inPort;
    }
    public void setImageId(String imageId){
        this.imageId = imageId;
    }
    public void setContainerId(String containerId){
        this.containerId = containerId;
    }
    public void setType(String type){
        this.type = type;
    }
    public String getUsername() {
        return this.username;
    }
    public String getId() {
        return this.id;
    }
    public String getType() {
        return this.type;
    }
    public String getImageId(){
        return this.imageId;
    }
    public String getContainerId(){
        return this.containerId;
    }
}
