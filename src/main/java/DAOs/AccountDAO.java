/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
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
 * @author Dell
 */
public class AccountDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AccountDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccount(String us, String pass) {

        Account acc = null;
        String sql = "select * from account where username=? and password=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, us);
            ps.setString(2, Utils.Hashing.getMd5(pass));
            rs = ps.executeQuery();
            if (rs.next()) {
                acc = new Account(rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone_number"), rs.getString("email"),
                        rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;

    }

    public boolean checkEmailExists(String email) {
        String sql = "SELECT COUNT(*) AS count FROM account WHERE email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Xử lý ngoại lệ, nếu cần
        }
        return false;
    }
    public boolean checkUsernameExists(String username) {
        String sql = "SELECT COUNT(*) AS count FROM account WHERE username = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Xử lý ngoại lệ, nếu cần
        }
        return false;
    }

    public boolean checkPhoneExists(String phone) {
        String sql = "SELECT COUNT(*) AS count FROM account WHERE phone_number = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Xử lý ngoại lệ, nếu cần
        }
        return false;
    }

    public Account getAccByEmail(String email) {

        Account acc = null;
        String sql = "select * from account where email=? and isDelete=0";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                acc = new Account(rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone_number"), rs.getString("email"),
                        rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;

    }

    public int editPassword(String password, String email) {
        int count = 0;
        String sql = "update Account set password=? where email=?";
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

    public int getResetCodeByEmail(String email) {
        String sql = "select code_reset from Account where email=?";
        int otp = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                otp = Integer.parseInt(rs.getString("code_reset"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return otp;
    }

    public int createAcc(Account acc) {
        int count = 0;
        String sql = "insert into account values(?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, acc.getUsername());
            ps.setString(2, Utils.Hashing.getMd5(acc.getPassword()));
            ps.setString(3, acc.getFullname());
            ps.setString(4, acc.getPhone_number());
            ps.setString(5, acc.getEmail());
            ps.setInt(6, 0);
            ps.setInt(7, 0);
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

    public LinkedList<String> getAllUserName() {
        LinkedList<String> list = new LinkedList<>();
        String sql = "select username from account";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("username");
                list.add(name);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public LinkedList<Account> getAll() {
        LinkedList<Account> list = new LinkedList<>();
        String sql = "Select * from account";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Account acc = new Account(rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone_number"), rs.getString("email"),
                        rs.getInt("code_reset"), rs.getInt("isDelete"));
                list.add(acc);
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public LinkedList<String> getAllEmail() {
        LinkedList<String> list = new LinkedList<>();
        String sql = "select email from account";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                list.add(email);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public LinkedList<String> getAllEmailToResetPass() {
        LinkedList<String> list = new LinkedList<>();
        String sql = "select email from account where isDelete = 0";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                list.add(email);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public LinkedList<String> getAllPhone() {
        LinkedList<String> list = new LinkedList<>();
        String sql = "select phone_number from account";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String phone = rs.getString("phone_number");
                list.add(phone);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int updateOTP(String otp, String email) {
        int count = 0;
        String sql = "update Account set code_reset=? where email=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, otp);
            ps.setString(2, email);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public int deleteAcc(int acc_id) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("delete from account where acc_id=?");
            ps.setInt(1, acc_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int updateAcc(Account acc) {
        int count = 0;
        String sql = "UPDATE account SET username =? , password=?, fullname = ? , phone_number = ?, email = ? , code_reset= ? , isDelete= ? WHERE acc_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUsername());
            ps.setString(2, acc.getPassword());
            ps.setString(3, acc.getFullname());
            ps.setString(4, acc.getPhone_number());
            ps.setString(5, acc.getEmail());
            ps.setInt(6, 0);
            ps.setInt(7, 0);
            ps.setInt(8, acc.getAcc_id());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Account updateAccStaff(int acc_id, Account acc) {
        int count = 0;
        String sql = "Update account set username = ?, password = ?, fullname = ?, phone_number = ?, email = ? where acc_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUsername());
            ps.setString(2, acc.getPassword());
            ps.setString(3, acc.getFullname());
            ps.setString(4, acc.getPhone_number());
            ps.setString(5, acc.getEmail());
            ps.setInt(6, acc_id);

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : acc;
    }

    public boolean checkPassword(String password) {
        String sql = "SELECT * FROM account WHERE password = ?";
        try (
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, Utils.Hashing.getMd5(password));
            System.out.println("...pass nhap vao :" + password);
            try ( ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // nếu có kết quả trả về, mật khẩu khớp
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isDelete(int acc_id, Date current) {
        int count = 0;
        String sql = "Update account set isDelete = 1 where acc_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, acc_id);

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? false : true;
    }

    public int deleteAccAdmin(int acc_id) {
        int count = 0;
        String sql = "UPDATE account SET isDelete= 1 WHERE acc_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acc_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}
