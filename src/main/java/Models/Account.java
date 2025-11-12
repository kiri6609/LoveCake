/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Dell
 */
public class Account {

    private int acc_id;
    private String username;
    private String password;
    private String fullname;
    private String phone_number;
    private String email;
    private int code_reset;
    private int isDelete;

    public Account() {
    }

    public Account(int acc_id, String username, String password, String fullname, String phone_number, String email, int code_reset, int isDelete) {
        this.acc_id = acc_id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.phone_number = phone_number;
        this.email = email;
        this.code_reset = code_reset;
        this.isDelete = isDelete;
    }
    
//    NAM CODE
    public Account(String username, String password, String fullname, String phone_number, String email) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.phone_number = phone_number;
        this.email = email;
    }
    
    
    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCode_reset() {
        return code_reset;
    }

    public void setCode_reset(int code_reset) {
        this.code_reset = code_reset;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }

}
