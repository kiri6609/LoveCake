/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.ProductHistory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class ProductHistoryDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductHistoryDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int addProHistory(ProductHistory ph) {
        int count = 0;
        String sql = "INSERT INTO product_history VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);

            ps.setInt(1, ph.getStaff_id());
            ps.setInt(2, ph.getPro_id());
            ps.setInt(3, ph.getCat_id());
            ps.setString(4, ph.getPro_name());
            ps.setString(5, ph.getPro_image());
            ps.setString(6, ph.getOrigin());
            ps.setString(7, ph.getBrand());
            ps.setDouble(8, ph.getMass());
            ps.setString(9, ph.getIngredient());
            ps.setInt(10, ph.getPro_quantity());
            ps.setDouble(11, ph.getPro_price());
            ps.setDouble(12, ph.getDiscount());
            ps.setString(13, ph.getPro_description());
            ps.setInt(14, ph.getIsDelete());
            ps.setString(15, ph.getAction());
            ps.setDate(16, ph.getCreate_date());

            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public LinkedList<ProductHistory> getAllProHis() {
        LinkedList<ProductHistory> list = new LinkedList<>();
        String sql = "select * from [product_history]";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductHistory ph = new ProductHistory(rs.getInt("pro_his_id"), rs.getInt("staff_id"), rs.getInt("pro_id"), rs.getInt("cat_id"), rs.getString("pro_name"),
                        rs.getString("pro_image"), rs.getString("origin"), rs.getString("brand"), rs.getDouble("mass"), rs.getString("ingredient"), rs.getInt("pro_quantity"),
                        rs.getDouble("pro_price"), rs.getDouble("discount"), rs.getString("pro_description"), rs.getInt("isDelete"), rs.getString("action"), rs.getDate("create_date"));
                list.add(ph);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

}
