/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Dell
 */
public class Customer extends Account {

    private int cus_id;
    private String avatar;

    public Customer() {
    }

    public Customer(int cus_id, int acc_id, String username, String password, String fullname, String avatar,String phone_number, String email, int code_reset, int isDelete) {
        super(acc_id, username, password, fullname, phone_number, email, code_reset, isDelete);
        this.cus_id = cus_id;
        this.avatar = avatar;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

   
}
