/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.Chart;
import Models.OrderDetail;
import Models.chartPro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

    Connection conn;

    public OrderDetailDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public LinkedList<OrderDetail> getAllOrderDetails() {
        LinkedList<OrderDetail> orderDetailList = new LinkedList<>();
        String sql = "select * from [order_detail]";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                OrderDetail odt = new OrderDetail(rs.getInt("o_id"), rs.getInt("pro_id"), rs.getInt("quantity"));
                orderDetailList.add(odt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetailList;
    }

    public OrderDetail getOrderDetailByID(int o_id) {
        OrderDetail obj = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from [order_detail] where o_id=?");
            ps.setInt(1, o_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                obj = new OrderDetail(rs.getInt("o_id"), rs.getInt("pro_id"), rs.getInt("quantity"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public int addOrderDetail(OrderDetail obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [order_detail] values(?, ?, ?)");
            ps.setInt(1, obj.getO_id());
            ps.setInt(2, obj.getPro_id());
            ps.setInt(3, obj.getQuantity());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int editOrderDetail(int o_id, OrderDetail obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update [order_detail] set quantity=? where o_id=?");
            ps.setInt(1, obj.getQuantity());
            ps.setInt(2, o_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int deleteOrderDetail(int o_id) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("delete from [order_detail] where o_id=?");
            ps.setInt(1, o_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public LinkedList<OrderDetail> getAllOrderDetailsByOrderID(int o_id) {
        LinkedList<OrderDetail> orderDetailList = new LinkedList<>();
        String sql = "select * from [order_detail] where o_id = ?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, o_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                OrderDetail odt = new OrderDetail(rs.getInt("o_id"), rs.getInt("pro_id"), rs.getInt("quantity"));
                orderDetailList.add(odt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetailList;
    }

    public List<chartPro> getChartDataProduct() {
        List<chartPro> chartDataListProduct = new ArrayList<>();

        // Tạo câu truy vấn SQL
        String sql = "SELECT p.pro_name, SUM(od.quantity) AS quantity\n"
                + "FROM order_detail od\n"
                + "INNER JOIN orders o ON od.o_id = o.o_id\n"
                + "INNER JOIN product p ON od.pro_id = p.pro_id\n"
                + "GROUP BY o.o_date, p.pro_name\n"
                + "ORDER BY o.o_date ASC;";

        // Thực thi câu truy vấn và xử lý kết quả
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql);  ResultSet resultSet = preparedStatement.executeQuery()) {

            // Duyệt qua các dòng kết quả
            while (resultSet.next()) {
                // Lấy dữ liệu từ kết quả
//                String date = resultSet.getString("o_date");
                String name = resultSet.getString("pro_name");
                int quantity = resultSet.getInt("quantity");
//                System.out.println("......" + date);
                System.out.println("......" + quantity);

                // Tạo đối tượng Chart và thêm vào danh sách
                chartDataListProduct.add(new chartPro(name, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Trả về danh sách dữ liệu của biểu đồ
        return chartDataListProduct;
    }

    public List<chartPro> getChartDataDay() {
        List<chartPro> chartDataListDay = new ArrayList<>();

        // Tạo câu truy vấn SQL
        String sql = "SELECT YEAR([o_date]) AS year, SUM(od.quantity) AS quantity\n"
                + "    FROM order_detail od\n"
                + "          INNER JOIN orders o ON od.o_id = o.o_id\n"
                + "WHERE status = N'Đã giao'\n"
                + "       GROUP BY YEAR([o_date])";

        // Thực thi câu truy vấn và xử lý kết quả
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql);  ResultSet resultSet = preparedStatement.executeQuery()) {

            // Duyệt qua các dòng kết quả
            while (resultSet.next()) {
                // Lấy dữ liệu từ kết quả
                String year = resultSet.getString("year");
                int quantity = resultSet.getInt("quantity");

                // Tạo đối tượng Chart và thêm vào danh sách
                chartDataListDay.add(new chartPro(year, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Trả về danh sách dữ liệu của biểu đồ
        return chartDataListDay;
    }
}
