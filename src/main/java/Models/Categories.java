/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Dell
 */
public class Categories {

    private int cat_id;
    private String cat_name;
    private String typeCategories;
    private String cat_description;

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getCat_name() {
        return cat_name;
    }

    public void setCat_name(String cat_name) {
        this.cat_name = cat_name;
    }

    public String getTypeCategories() {
        return typeCategories;
    }

    public void setTypeCategories(String typeCategories) {
        this.typeCategories = typeCategories;
    }

    public String getCat_description() {
        return cat_description;
    }

    public void setCat_description(String cat_description) {
        this.cat_description = cat_description;
    }

    public Categories() {
    }

    public Categories(int cat_id, String cat_name, String typeCategories, String cat_description) {
        this.cat_id = cat_id;
        this.cat_name = cat_name;
        this.typeCategories = typeCategories;
        this.cat_description = cat_description;
    }

}
