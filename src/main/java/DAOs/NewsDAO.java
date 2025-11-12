/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.News;
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
public class NewsDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public NewsDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public LinkedList<News> getAll() {
        LinkedList<News> list = new LinkedList<>();
        String sql = "Select * from news where isDelete = 0";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                News news = new News(rs.getInt("news_id"), rs.getInt("staff_id"), rs.getString("title"),
                        rs.getString("image_url"), rs.getString("title_content"), rs.getString("content1"),
                        rs.getString("content2"), rs.getString("content3"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(news);
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public News getNews(int news_id) {
        News news = null;
        String sql = "select * from news where news_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, news_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                news = new News(rs.getInt("news_id"), rs.getInt("staff_id"), rs.getString("title"),
                        rs.getString("image_url"), rs.getString("title_content"), rs.getString("content1"),
                        rs.getString("content2"), rs.getString("content3"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return news;
    }

    public News getTop1News() {
        News news = null;
        String sql = "SELECT TOP 1 * FROM news ORDER BY create_date DESC";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                news = new News(rs.getInt("news_id"), rs.getInt("staff_id"), rs.getString("title"),
                        rs.getString("image_url"), rs.getString("title_content"), rs.getString("content1"),
                        rs.getString("content2"), rs.getString("content3"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return news;
    }

    public LinkedList<News> getTop3News() {
        LinkedList<News> list = new LinkedList<>();
        String sql = "Select top 3 * from news";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                News news = new News(rs.getInt("news_id"), rs.getInt("staff_id"), rs.getString("title"),
                        rs.getString("image_url"), rs.getString("title_content"), rs.getString("content1"),
                        rs.getString("content2"), rs.getString("content3"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(news);
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public LinkedList<News> getTop5News() {
        LinkedList<News> list = new LinkedList<>();
        String sql = "Select top 5 * from news order by create_date ASC";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                News news = new News(rs.getInt("news_id"), rs.getInt("staff_id"), rs.getString("title"),
                        rs.getString("image_url"), rs.getString("title_content"), rs.getString("content1"),
                        rs.getString("content2"), rs.getString("content3"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(news);
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public int AddNews(News news) {
        int count = 0;
        String sql = "insert into [news] values(?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, 0);
            ps.setInt(2, news.getStaff_id());
            ps.setString(3, news.getTitle());
            ps.setString(4, news.getImage_url());
            ps.setString(5, news.getTitle_content());
            ps.setString(6, news.getContent1());
            ps.setString(7, news.getContent2());
            ps.setString(8, news.getContent3());
            ps.setDate(9, new java.sql.Date(news.getCreate_date().getTime()));
            ps.setInt(10, 0);
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

    public void AddNewNews(int staff_id, String title, String image_url, String title_content, String content1, String content2, String content3, Date create_date) {
        String sql = "INSERT INTO [news]([staff_id], [title], [image_url], [title_content], [content1], [content2], [content3], [create_date], [isDelete]) "
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, staff_id);
            ps.setString(2, title);
            ps.setString(3, image_url);
            ps.setString(4, title_content);
            ps.setString(5, content1);
            ps.setString(6, content2);
            ps.setString(7, content3);
            ps.setDate(8, new java.sql.Date(create_date.getTime()));
            ps.setInt(9, 0);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int UpdateNews(News news, int news_id) {
        int count = 0;
        String sql = "UPDATE [news]"
                + "SET [title] = ?,"
                + "    [image_url] = ?,"
                + "    [title_content] = ?,"
                + "    [content1] = ?,"
                + "    [content2] = ?,"
                + "    [content3] = ?,"
                + "    [create_date] = ? "
                + "WHERE [news_id] = ?;";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getImage_url());
            ps.setString(3, news.getTitle_content());
            ps.setString(4, news.getContent1());
            ps.setString(5, news.getContent2());
            ps.setString(6, news.getContent3());
            ps.setDate(7, new java.sql.Date(news.getCreate_date().getTime()));
            ps.setInt(8, news_id);
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

//    public void DeleteNews(int news_id) {
//        try {
//            String sql = "DELETE FROM news WHERE news_id = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, news_id);
//            ps.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    
    public boolean DeleteNews(int news_id) {
        int count = 0;
        String sql = "Update News set isDelete = 1 where news_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, news_id);

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count != 0);

    }

    public int getLatestNewsId() {
        int latestNewsId = 0;
        String sql = "SELECT MAX(news_id) AS news_id FROM news";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                latestNewsId = rs.getInt("news_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return latestNewsId;
    }

}
