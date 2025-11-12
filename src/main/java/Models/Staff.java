/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Dell
 */
public class Staff extends Account {

    private int staff_id;
    private Date birthday;
    private String gender;
    private String address;
    private String position;
    private Date begin_work;
    private Date end_work;

    public Staff() {
    }

    public Staff(int staff_id, int acc_id, String username, String password, String fullname,
            String phone_number, String email, Date birthday, String gender, String address,
            String position, Date begin_work, Date end_work, int code_reset, int isDelete) {
        super(acc_id, username, password, fullname, phone_number, email, code_reset, isDelete);
        this.staff_id = staff_id;
        this.birthday = birthday;
        this.gender = gender;
        this.address = address;
        this.position = position;
        this.begin_work = begin_work;
        this.end_work = end_work;

    }
    
    public Staff(int staff_id, int acc_id, String username, String password, String fullname,
            String phone_number, String email, Date birthday, String gender, String address,
            String position, Date begin_work, int code_reset, int isDelete) {
        super(acc_id, username, password, fullname, phone_number, email, code_reset, isDelete);
        this.staff_id = staff_id;
        this.birthday = birthday;
        this.gender = gender;
        this.address = address;
        this.position = position;
        this.begin_work = begin_work;

    }

    public Staff(String username, String password, String fullname, String phone_number, String email, Date birthday, String gender, String address, String position, Date begin_work) {
        super(username, password, fullname, phone_number, email);
        this.birthday = birthday;
        this.gender = gender;
        this.address = address;
        this.position = position;
        this.begin_work = begin_work;
    }
    
    
    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Date getBegin_work() {
        return begin_work;
    }

    public void setBegin_work(Date begin_work) {
        this.begin_work = begin_work;
    }

    public Date getEnd_work() {
        return end_work;
    }

    public void setEnd_work(Date end_work) {
        this.end_work = end_work;
    }

    

}
