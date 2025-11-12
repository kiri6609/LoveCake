/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class OrderStatusHistory {
    private int o_his_id;
    private int o_id;
    private int staff_id;
    private String status;
    private String action;
    private Date create_date;

    public OrderStatusHistory() {
    }

    public OrderStatusHistory(int o_his_id, int o_id, int staff_id, String status, String action, Date create_date) {
        this.o_his_id = o_his_id;
        this.o_id = o_id;
        this.staff_id = staff_id;
        this.status = status;
        this.action = action;
        this.create_date = create_date;
    }

    public int getO_his_id() {
        return o_his_id;
    }

    public int getO_id() {
        return o_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public String getStatus() {
        return status;
    }

    public String getAction() {
        return action;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setO_his_id(int o_his_id) {
        this.o_his_id = o_his_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }
}
