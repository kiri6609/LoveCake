/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author HP
 */
public class NewsHistory {
    private int news_his_id;
    private int news_id;
    private int staff_id;
    private String action;
    private String title;
    private String image_url;
    private String title_content;
    private String content1;
    private String content2;
    private String content3;
    private Date create_date;
    private int isDelete;

    public NewsHistory() {
    }

    public NewsHistory(int news_his_id, int news_id, int staff_id, String action, String title, String image_url, String title_content, String content1, String content2, String content3, Date create_date, int isDelete) {
        this.news_his_id = news_his_id;
        this.news_id = news_id;
        this.staff_id = staff_id;
        this.action = action;
        this.title = title;
        this.image_url = image_url;
        this.title_content = title_content;
        this.content1 = content1;
        this.content2 = content2;
        this.content3 = content3;
        this.create_date = create_date;
        this.isDelete = isDelete;
    }

    public int getNews_his_id() {
        return news_his_id;
    }

    public void setNews_his_id(int news_his_id) {
        this.news_his_id = news_his_id;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getTitle_content() {
        return title_content;
    }

    public void setTitle_content(String title_content) {
        this.title_content = title_content;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public String getContent3() {
        return content3;
    }

    public void setContent3(String content3) {
        this.content3 = content3;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }
    
    
    
}
