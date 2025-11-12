/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Controllers.ProductController;
import Models.ProductImages;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu MInh Uyen
 */
public class ProductImagesDAO {

    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductImagesDAO() {
        try {
            connection = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int addProductImage(ProductImages productImage) {
        int count = 0;
        String query = "INSERT INTO product_images VALUES (?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, productImage.getPro_id());
            ps.setString(2, productImage.getImage_url());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public LinkedList<ProductImages> getProductImagesByProductId(int productId) {
        LinkedList<ProductImages> productImages = new LinkedList<>();
        String query = "SELECT * FROM product_images WHERE pro_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImages productImage = new ProductImages(rs.getInt("pro_img_id"), rs.getInt("pro_id"), rs.getString("image_url"));
                productImages.add(productImage);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);      
        }

        return productImages;
    }


    public int editProImages(int piId, String image) {
        int count = 0;
        String sql = "update product_images set image_url=? where pro_img_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, image);
            ps.setInt(2, piId);

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public int deleteProductImageByProductId(int productId) {
        int count = 0;
        String query = "DELETE FROM product_images WHERE pro_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
