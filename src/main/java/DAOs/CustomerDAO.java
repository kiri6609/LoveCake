/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Customer;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class CustomerDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CustomerDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Customer getCustomer(int acc_id) {
        Customer cus = null;
        String sql = "select * from customer where acc_id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acc_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cus = new Customer(rs.getInt("cus_id"), rs.getInt("acc_id"),
                        rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("avatar"), rs.getString("phone_number"),
                        rs.getString("email"), rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cus;
    }

//    UYEN CODE
    public int countCustomers() throws SQLException {
        int count = 0;

        try {
            //tạo câu truy vấn SQL để đếm số lượng khách hàng
            String query = "SELECT COUNT(*) AS totalCustomers FROM customer";
            // chuẩn bị câu truy vấn
            ps = conn.prepareStatement(query);
            // thực thi câu truy vấn
            rs = ps.executeQuery();
            // xử lý kết quả trả về
            if (rs.next()) {
                count = rs.getInt("totalCustomers");
            }
        } catch (SQLException ex) {
            // Xử lý ngoại lệ
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Trả về số lượng khách hàng
        return count;
    }

    public LinkedList<Customer> getAll() {
        LinkedList<Customer> list = new LinkedList<>();
        String sql = "Select * from customer";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Customer cus = new Customer(rs.getInt("cus_id"), rs.getInt("acc_id"),
                        rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("avatar"), rs.getString("phone_number"),
                        rs.getString("email"), rs.getInt("code_reset"), rs.getInt("isDelete"));
                list.add(cus);
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public int createCus(Customer cus) {
        int count = 0;
        String sql = "insert into customer values(?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cus.getAcc_id());
            ps.setString(2, cus.getUsername());
            ps.setString(3, Utils.Hashing.getMd5(cus.getPassword()));
            ps.setString(4, cus.getFullname());
            ps.setString(5, cus.getAvatar());
            ps.setString(6, cus.getPhone_number());
            ps.setString(7, cus.getEmail());
            ps.setInt(8, 0);
            ps.setInt(9, 0);
            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public int editPassword(String password, String email) {
        int count = 0;
        String sql = "update Customer set password=? where email=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, Utils.Hashing.getMd5(password));
            ps.setString(2, email);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public LinkedList<Customer> getAllCus() {
        LinkedList<Customer> listCus = new LinkedList<>();
        String sql = "select * from customer";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer(rs.getInt("cus_id"), rs.getInt("acc_id"),
                        rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("avatar"), rs.getString("phone_number"),
                        rs.getString("email"), rs.getInt("code_reset"), rs.getInt("isDelete"));
                listCus.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listCus;
    }

    public int deleteCus(int cus_id) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("delete from customer where cus_id=?");
            ps.setInt(1, cus_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int updateCus(Customer cus) {
        int count = 0;
        String sql = "UPDATE customer SET acc_id =? , username =? , password=?, fullname = ? , avatar = ? , phone_number = ?, email = ? , code_reset= ? , isDelete= ? WHERE cus_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cus.getAcc_id());
            ps.setString(2, cus.getUsername());
            ps.setString(3, cus.getPassword());
            ps.setString(4, cus.getFullname());
            ps.setString(5, cus.getAvatar());
            ps.setString(6, cus.getPhone_number());
            ps.setString(7, cus.getEmail());
            ps.setInt(8, 0);
            ps.setInt(9, 0);
            ps.setInt(10, cus.getCus_id());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int deleteCusAdmin(int cus_id) {
        int count = 0;
        String sql = "UPDATE customer SET isDelete= 1 WHERE cus_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cus_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    //KHOA's CODE
    // Them tim customer bang cusid
    /**
     *
     * @param cus_id
     * @return
     */
    public Customer getCustomerByCusID(int cus_id) {
        Customer obj = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from [customer] where cus_id=?");
            ps.setInt(1, cus_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                obj = new Customer(rs.getInt("cus_id"), rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("avatar"), rs.getString("phone_number"), rs.getString("email"), rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public static void main(String[] args) {
        CustomerDAO cdao = new CustomerDAO();
        LinkedList<Customer> list = new LinkedList<>();
        try {
            list = cdao.getAllCus();
            System.out.println(list.get(1).getAcc_id());

        } catch (Exception e) {
            System.out.println("noooo");
        }

    }
}
