/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Staff;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class StaffDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public StaffDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Staff getStaff(int acc_id) {
        Staff Staff = null;
        String sql = "select * from staff where acc_id=? and isdelete=0";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acc_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff = new Staff(rs.getInt("staff_id"), rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone_number"), rs.getString("email"),
                        rs.getDate("birthday"), rs.getString("gender"), rs.getString("address"),
                        rs.getString("position"), rs.getDate("begin_work"), rs.getDate("end_work"), rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Staff;
    }

    public int countStaffs() throws SQLException {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS totalStaffs FROM staff";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("totalStaffs");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;

    }

    public int countStaff2() throws SQLException {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS totalStaffs FROM staff";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("totalStaffs");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;

    }

    public ResultSet getAllStaff() {
        ResultSet rs = null;
        String sql = "select staff_id, username, fullname, gender, position, isDelete from staff";
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Staff addNewStaff(Staff obj) {
        int count = 0;
        String sql = "Insert into staff(acc_id, username, password, fullname, phone_number, email, birthday, gender, address, position, begin_work, isDelete) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, obj.getAcc_id());
            ps.setString(2, obj.getUsername());
            ps.setString(3, Utils.Hashing.getMd5(obj.getPassword()));
            ps.setString(4, obj.getFullname());
            ps.setString(5, obj.getPhone_number());
            ps.setString(6, obj.getEmail());
            ps.setDate(7, obj.getBirthday());
            ps.setString(8, obj.getGender());
            ps.setString(9, obj.getAddress());
            ps.setString(10, obj.getPosition());
            ps.setDate(11, obj.getBegin_work());
            ps.setInt(12, obj.getIsDelete());

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : obj;
    }

    public Staff editStaff(int staff_id, Staff staff) {
        int count = 0;
        String sql = "Update staff set username = ?, password = ?, fullname = ?, phone_number = ?, email = ?, birthday = ?, gender = ?, address = ?, position = ?, begin_work = ? where staff_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staff.getUsername());
            ps.setString(2, staff.getPassword());
            ps.setString(3, staff.getFullname());
            ps.setString(4, staff.getPhone_number());
            ps.setString(5, staff.getEmail());
            ps.setDate(6, staff.getBirthday());
            ps.setString(7, staff.getGender());
            ps.setString(8, staff.getAddress());
            ps.setString(9, staff.getPosition());
            ps.setDate(10, staff.getBegin_work());
            ps.setInt(11, staff_id);

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : staff;
    }

    public Staff getStaffById(int staff_id) {
        Staff obj = null;
        String sql = "Select * from staff where staff_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, staff_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                obj = new Staff(rs.getInt("staff_id"), rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone_number"), rs.getString("email"),
                        rs.getDate("birthday"), rs.getString("gender"), rs.getString("address"),
                        rs.getString("position"), rs.getDate("begin_work"), rs.getDate("end_work"), rs.getInt("code_reset"), rs.getInt("isDelete"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public int editPassword(String password, String email) {
        int count = 0;
        String sql = "update Staff set password=? where email=?";
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

    public int updateStaff(Staff staff) {
        int count = 0;
        String sql = "UPDATE staff SET acc_id =? , username =? , password=?, fullname = ? ,"
                + " phone_number = ?, email = ? ,birthday =? ,gender=?,address=?,"
                + "position=?,begin_work=?,end_work=?, code_reset= ? , isDelete= ? WHERE staff_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, staff.getAcc_id());
            ps.setString(2, staff.getUsername());
            ps.setString(3, staff.getPassword());
            ps.setString(4, staff.getFullname());
            ps.setString(5, staff.getPhone_number());
            ps.setString(6, staff.getEmail());
            ps.setDate(7, staff.getBirthday());
            ps.setString(8, staff.getGender());
            ps.setString(9, staff.getAddress());
            ps.setString(10, staff.getPosition());
            ps.setDate(11, staff.getBegin_work());
            ps.setDate(12, staff.getEnd_work());
            ps.setInt(13, 0);
            ps.setInt(14, 0);
            ps.setInt(15, staff.getStaff_id());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public String getFullNameByID(int staff_id) {
        String fullName = null;
        String sql = "SELECT fullname FROM staff WHERE staff_id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, staff_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                fullName = rs.getString("fullname");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fullName;
    }

    public boolean isDelete(int staff_id, Date current) {
        int count = 0;
        String sql = "Update staff set isDelete = 1, end_work = ? where staff_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDate(1, current);
            ps.setInt(2, staff_id);

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? false : true;

    }

}
