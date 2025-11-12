/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.ImportProHistory;
import Models.ImportProduct;
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
public class ImportProductDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ImportProductDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImportProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ImportProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int AddImportPro(ImportProduct imp) {
        int count = 0;
        String sql = "insert into ImportProduct values(?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, imp.getSup_id());
            ps.setInt(2, imp.getPro_id());
            ps.setInt(3, imp.getQuantity());
            ps.setDate(4, imp.getCreate_date());
            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ImportProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public LinkedList<ImportProduct> getAllImp() {
        LinkedList<ImportProduct> list = new LinkedList<>();
        String sql = "select * from ImportProduct";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ImportProduct imp = new ImportProduct(rs.getInt("imp_id"), rs.getInt("sup_id"), rs.getInt("pro_id"),
                        rs.getInt("quantity"), rs.getDate("create_date"));
                list.add(imp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImportProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public LinkedList<ImportProHistory> getImportProHis() {
        LinkedList<ImportProHistory> list = new LinkedList<>();
        String sql = "  SELECT \n"
                + "    IP.imp_id,\n"
                + "    IP.pro_id,\n"
                + "    P.pro_name,\n"
                + "    IP.sup_id,\n"
                + "    S.company_name,\n"
                + "    IP.quantity,\n"
                + "    IP.create_date\n"
                + "FROM \n"
                + "    ImportProduct IP\n"
                + "JOIN \n"
                + "    supplier S ON IP.sup_id = S.sup_id\n"
                + "JOIN \n"
                + "    product P ON IP.pro_id = P.pro_id;";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ImportProHistory his = new ImportProHistory(rs.getInt("imp_id"), rs.getInt("pro_id"),
                        rs.getInt("sup_id"), rs.getString("pro_name"), rs.getString("company_name"), rs.getInt("quantity"), rs.getDate("create_date"));
                list.add(his);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImportProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
