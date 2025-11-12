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
public class ImportProduct {

    private int imp_id;
    private int sup_id;
    private int pro_id;
    private int quantity;
    private Date create_date;

    public ImportProduct() {
    }

    public ImportProduct(int imp_id, int sup_id, int pro_id, int quantity, Date create_date) {
        this.imp_id = imp_id;
        this.sup_id = sup_id;
        this.pro_id = pro_id;
        this.quantity = quantity;

        this.create_date = create_date;
    }

    public int getImp_id() {
        return imp_id;
    }

    public void setImp_id(int imp_id) {
        this.imp_id = imp_id;
    }

    public int getSup_id() {
        return sup_id;
    }

    public void setSup_id(int sup_id) {
        this.sup_id = sup_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

}
