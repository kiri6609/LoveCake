/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class ProductImages {
    private int pro_img_id;
    private int pro_id;
    private String image_url;

    public ProductImages() {
    }

    public ProductImages(int pro_img_id, int pro_id, String image_url) {
        this.pro_img_id = pro_img_id;
        this.pro_id = pro_id;
        this.image_url = image_url;
    }

    public int getPro_img_id() {
        return pro_img_id;
    }

    public void setPro_img_id(int pro_img_id) {
        this.pro_img_id = pro_img_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
    
    
}
