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
public class ProductHistory {

    private int pro_his_id;
    private int staff_id;
    private int pro_id;
    private int cat_id;
    private String pro_name;
    private String pro_image;
    private String origin;
    private String brand;
    private Double mass;
    private String ingredient;
    private int pro_quantity;
    private Double pro_price;
    private Double discount;
    private String pro_description;
    private int isDelete;
    private String action;
    private Date create_date;

    public ProductHistory() {
    }

    public ProductHistory(int pro_his_id, int staff_id, int pro_id, int cat_id,
            String pro_name, String pro_image, String origin, String brand, Double mass,
            String ingredient, int pro_quantity, Double pro_price, Double discount,
            String pro_description, int isDelete, String action, Date create_date) {
        this.pro_his_id = pro_his_id;
        this.staff_id = staff_id;
        this.pro_id = pro_id;
        this.cat_id = cat_id;
        this.pro_name = pro_name;
        this.pro_image = pro_image;
        this.origin = origin;
        this.brand = brand;
        this.mass = mass;
        this.ingredient = ingredient;
        this.pro_quantity = pro_quantity;
        this.pro_price = pro_price;
        this.discount = discount;
        this.pro_description = pro_description;
        this.isDelete = isDelete;
        this.action = action;
        this.create_date = create_date;
    }

    public int getPro_his_id() {
        return pro_his_id;
    }

    public void setPro_his_id(int pro_his_id) {
        this.pro_his_id = pro_his_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getPro_image() {
        return pro_image;
    }

    public void setPro_image(String pro_image) {
        this.pro_image = pro_image;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Double getMass() {
        return mass;
    }

    public void setMass(Double mass) {
        this.mass = mass;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    public int getPro_quantity() {
        return pro_quantity;
    }

    public void setPro_quantity(int pro_quantity) {
        this.pro_quantity = pro_quantity;
    }

    public Double getPro_price() {
        return pro_price;
    }

    public void setPro_price(Double pro_price) {
        this.pro_price = pro_price;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public String getPro_description() {
        return pro_description;
    }

    public void setPro_description(String pro_description) {
        this.pro_description = pro_description;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

}
