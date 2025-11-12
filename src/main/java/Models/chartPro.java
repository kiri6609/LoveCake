/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author DELL
 */
public class chartPro {

//    private String date;
    private String nameOrDate;
    private int quantity;

    public chartPro() {
    }

    public chartPro(String nameOrDate, int quantity) {
//        this.date = date;
        this.nameOrDate = nameOrDate;
        this.quantity = quantity;
    }

//    public String getDate() {
//        return date;
//    }
//
//    public void setDate(String date) {
//        this.date = date;
//    }

    public String getNameOrDate() {
        return nameOrDate;
    }

    public void setNameOrDate(String nameOrDate) {
        this.nameOrDate = nameOrDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   

}
