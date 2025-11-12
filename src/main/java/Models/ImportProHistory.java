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
public class ImportProHistory {

    private int imp_id;
    private int pro_id;
    private int sup_id;
    private String pro_name;
    private String company_name;
    private int quantity;
    private Date create_date;

    public ImportProHistory() {
    }

    public ImportProHistory(int imp_id, int pro_id, int sup_id, String pro_name, String company_name, int quantity, Date create_date) {
        this.imp_id = imp_id;
        this.pro_id = pro_id;
        this.sup_id = sup_id;
        this.pro_name = pro_name;
        this.company_name = company_name;
        this.quantity = quantity;
        this.create_date = create_date;
    }

    public int getImp_id() {
        return imp_id;
    }

    public void setImp_id(int imp_id) {
        this.imp_id = imp_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public int getSup_id() {
        return sup_id;
    }

    public void setSup_id(int sup_id) {
        this.sup_id = sup_id;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
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
