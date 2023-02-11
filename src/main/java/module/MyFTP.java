/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;
import com.google.gson.Gson;
import jakarta.servlet.ServletOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
/**
 *
 * @author SANGSANG
 */
public class MyFTP {
    private final FTPClient ftpClient;
    public String hostname;
    public String password;
    public String username;
    public int port;
    private String myUsername;
    private Gson gson;
    public MyFTP(String hostname, String username, String password, int port, String myUsername){
        this.hostname = hostname;
        this.username = username;
        this.password = password;
        this.myUsername = myUsername;
        this.port = port;
        this.gson = new Gson();
        this.ftpClient = new FTPClient();
        this.ftpClient.setUseEPSVwithIPv4(false);
    }
    public void connect(){
        try {
            this.ftpClient.connect(this.hostname, this.port);
            this.ftpClient.login(this.username, this.password);
            this.ftpClient.enterLocalPassiveMode();
            this.ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
  
            if (!this.ftpClient.changeWorkingDirectory(this.myUsername)) {
                this.ftpClient.makeDirectory(this.myUsername);
                this.ftpClient.changeWorkingDirectory(this.myUsername);
            }else{
                this.ftpClient.changeWorkingDirectory(username);
            }
        } catch (IOException ex) {
        }
    }
    public void disconnect () throws IOException{
        this.ftpClient.logout();
        if (this.ftpClient.isConnected()) {
            try {
                this.ftpClient.disconnect();
            } catch (IOException ex) {
            }
        }
    }
    public void saveFile(String folderName,String filename, InputStream fileContent) throws IOException{
        try {
            this.ftpClient.makeDirectory(folderName);
            this.ftpClient.storeFile("/"+this.myUsername+"/"+folderName+"/"+filename, fileContent);
        } catch (IOException ex) {
            
        }
    }
    public boolean checkFile(String folderName, String fileName) throws IOException {
        FTPFile[] files = ftpClient.listFiles("/"+this.myUsername+"/"+folderName);
        return files.length != 1;
    }
    public void uploadFile(String filename, InputStream fileContent) throws IOException{
        try {
            this.ftpClient.storeFile("/"+this.myUsername+"/"+filename, fileContent);
        } catch (IOException ex) {
        } 
    }
    public void downloadFile(HttpServletResponse response,String remotePath) throws IOException{
        try {
            ServletOutputStream sos = response.getOutputStream();
            ftpClient.retrieveFile(remotePath, sos);
            sos.flush();
            sos.close();
        } catch (IOException ex) {
        }
    }
}
