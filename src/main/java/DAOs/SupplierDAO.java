/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Supplier;
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
public class SupplierDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public SupplierDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public LinkedList<Supplier> getListSupByproId(int pro_id) {
        LinkedList<Supplier> list = new LinkedList<>();
        String sql = "select * from [supplier] where pro_id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pro_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Supplier sup = new Supplier(rs.getInt("sup_id"), rs.getInt("pro_id"), rs.getString("company_name"),
                        rs.getString("address"), rs.getString("phone_number"), rs.getString("email"));
                list.add(sup);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public LinkedList<Supplier> getListSupplier() {
        LinkedList<Supplier> list = new LinkedList<>();
        String sql = "select * from [supplier]";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Supplier sup = new Supplier(rs.getInt("sup_id"), rs.getInt("pro_id"), rs.getString("company_name"),
                        rs.getString("address"), rs.getString("phone_number"), rs.getString("email"));
                list.add(sup);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public int addSupplier(Supplier sup) {
        int count = 0;
        String sql = "insert into supplier values(?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sup.getPro_id());
            ps.setString(2, sup.getCompany_name());
            ps.setString(3, sup.getAddress());
            ps.setString(4, sup.getPhone_number());
            ps.setString(5, sup.getEmail());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

}
