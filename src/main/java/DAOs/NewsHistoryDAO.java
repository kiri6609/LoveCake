/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.NewsHistory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class NewsHistoryDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public NewsHistoryDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NewsHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(NewsHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public LinkedList<NewsHistory> getAll() {
        LinkedList<NewsHistory> list = new LinkedList<>();
        String sql = "Select * from news_history";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                NewsHistory newsHistoty = new NewsHistory(rs.getInt("news_his_id"), rs.getInt("news_id"), rs.getInt("staff_id"),
                        rs.getString("action"), rs.getString("title"), rs.getString("image_url"), rs.getString("title_content"),
                        rs.getString("content1"), rs.getString("content2"), rs.getString("content3"), rs.getDate("create_date"), rs.getInt("isDelete"));
                list.add(newsHistoty);
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsHistoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public int AddNewsHis(NewsHistory newsHis) {
        int count = 0;
        String sql = "insert into [news_history] values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, newsHis.getNews_id());
            ps.setInt(2, newsHis.getStaff_id());
            ps.setString(3, newsHis.getAction());
            ps.setString(4, newsHis.getTitle());
            ps.setString(5, newsHis.getImage_url());
            ps.setString(6, newsHis.getTitle_content());
            ps.setString(7, newsHis.getContent1());
            ps.setString(8, newsHis.getContent2());
            ps.setString(9, newsHis.getContent3());
            ps.setDate(10, new java.sql.Date(newsHis.getCreate_date().getTime()));
            ps.setInt(11, 0);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public void AddNewsHistory(int news_id, int staff_id, String action, String title, String image_url, String title_content, String content1, String content2, String content3, Date create_date) {
        String sql = "INSERT INTO [news_history] value ([news_id], [staff_id], [title], [image_url], [title_content], [content1], [content2], [content3], [create_date], [isDelete]) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, news_id);
            ps.setInt(2, staff_id);
            ps.setString(3, action);
            ps.setString(4, title);
            ps.setString(5, image_url);
            ps.setString(6, title_content);
            ps.setString(7, content1);
            ps.setString(8, content2);
            ps.setString(9, content3);
            ps.setDate(10, new java.sql.Date(create_date.getTime()));
            ps.setInt(11, 0);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
}
