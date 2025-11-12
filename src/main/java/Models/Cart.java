/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Vu MInh Uyen
 */
public class Cart {

    private int cus_id;
    private int pro_id;
    private int pro_quantity;
    private double cart_price;

    public Cart() {
    }

    public Cart(int cus_id, int pro_id, int pro_quantity, double cart_price) {
        this.cus_id = cus_id;
        this.pro_id = pro_id;
        this.pro_quantity = pro_quantity;
        this.cart_price = cart_price;
    }

    

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public int getPro_quantity() {
        return pro_quantity;
    }

    public void setPro_quantity(int pro_quantity) {
        this.pro_quantity = pro_quantity;
    }

    public double getCart_price() {
        return cart_price;
    }

    public void setCart_price(double cart_price) {
        this.cart_price = cart_price;
    }



}
