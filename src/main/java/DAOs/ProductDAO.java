/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class ProductDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    /**
     *
     */
    public ProductDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Product getProById(int id) {

        String sql = "select * from product where pro_id=?";
        Product pro = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }

    /**
     *
     * @param cat_name
     * @return linkedlist<Product>
     * show all product of cat name ex: all product of cat name = Bot lam banh
     */
    public LinkedList<Product> getListProByCatName(String cat_name) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "SELECT *\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE categories.cat_name = ? and isDelete=0;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, cat_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     * show all product at link 'danh muc san pham'
     *
     * @return
     */
    public LinkedList<Product> getAllPro() {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "select * from product where isDelete=0";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
     public LinkedList<Product> getTop4Pro() {
         LinkedList<Product> list = new LinkedList<>();
         String sql = "select top 4 * from product where isDelete = 0 order by create_date DESC";
         try {

             ps = conn.prepareStatement(sql);
             rs = ps.executeQuery();
             while (rs.next()) {
                 Product pro = new Product(rs.getInt("pro_id"),
                         rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                         rs.getString("origin"), rs.getString("brand"),
                         rs.getDouble("mass"), rs.getString("ingredient"),
                         rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                         rs.getDouble("discount"),
                         rs.getNString("pro_description"), rs.getDate("create_date"),
                         rs.getInt("isDelete"));
                 list.add(pro);
             }
         } catch (SQLException ex) {
             Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
         }

         return list;
     }


    /**
     * show all product at link 'danh muc san pham'
     *
     * @return
     */
    public LinkedList<Product> getAllProAdmin() {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "select * from product";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     *
     * @return
     */
    public int getTotalPro() {
        int count = 0;
        String sql = "select COUNT(*) from product where isDelete=0";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    /**
     *
     * @param typeCategories
     * @return
     */
    public int getTotalProByTypeCategories(String typeCategories) {
        int count = 0;
        String sql = "SELECT count(*)\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE typeCategories=? and isDelete=0;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, typeCategories);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    /**
     *
     * @param index
     * @return
     */
    public LinkedList<Product> pagingAllPro(int index) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "select * from product where isDelete=0\n"
                + "order by pro_id\n"
                + "offset ? rows fetch next 16 rows only";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 16);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    /**
     *
     * @param index
     * @return
     */
    public LinkedList<Product> pagingProByCategories(int index, String typeCategories) {
        LinkedList<Product> list = new LinkedList<>();

        String sql = "SELECT *\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE categories.typeCategories = ? and isDelete=0\n"
                + "order by pro_id\n"
                + "offset ? rows fetch next 16 rows only";

        try {
            ps = conn.prepareStatement(sql);

            ps.setString(1, typeCategories);
            ps.setInt(2, (index - 1) * 16);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    /**
     *
     * @param cat_name
     * @return
     */
    public LinkedList<Product> get4ProByCatName(String cat_name) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "SELECT top 4*\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE categories.cat_name = ? and product.isDelete=0;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, cat_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     *
     * @param typeCategories
     * @return
     */
    public LinkedList<Product> get4ProByTypeCategories(String typeCategories) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "SELECT top 4*\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE typeCategories = ? and product.isDelete=0;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, typeCategories);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     * KHOA code
     *
     * @param pro_name
     * @return linkedlist<Product>
     * show all product of pro_name
     */
    public LinkedList<Product> getListProByProName(String pro_name) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "select * from product where isDelete=0 and pro_name like N'%" + pro_name + "%';";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public int addPro(Product pro) {
        int count = 0;
        String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, pro.getCat_id());
            ps.setString(2, pro.getPro_name());
            ps.setString(3, pro.getPro_image());
            ps.setString(4, pro.getOrigin());
            ps.setString(5, pro.getBrand());
            ps.setDouble(6, pro.getMass());
            ps.setString(7, pro.getIngredient());
            ps.setInt(8, pro.getPro_quantity());
            ps.setDouble(9, pro.getPro_price());
            ps.setDouble(10, pro.getDiscount());
            ps.setString(11, pro.getPro_description());
            ps.setDate(12, pro.getCreate_date());
            ps.setInt(13, pro.getIsDelete());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int editPro(Product pro) {
        int count = 0;
        String sql = "UPDATE product SET cat_id = ?,pro_name = ?, pro_image = ?, origin = ?, brand = ?, mass = ?, ingredient = ?, pro_quantity = ?,\n"
                + "pro_price =?, discount = ?, pro_description = ?, create_date =?, isDelete = ? WHERE pro_id = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pro.getCat_id());
            ps.setString(2, pro.getPro_name());
            ps.setString(3, pro.getPro_image());
            ps.setString(4, pro.getOrigin());
            ps.setString(5, pro.getBrand());
            ps.setDouble(6, pro.getMass());
            ps.setString(7, pro.getIngredient());
            ps.setInt(8, pro.getPro_quantity());
            ps.setDouble(9, pro.getPro_price());
            ps.setDouble(10, pro.getDiscount());
            ps.setString(11, pro.getPro_description());
            ps.setDate(12, pro.getCreate_date());
            ps.setInt(13, pro.getIsDelete());
            ps.setInt(14, pro.getPro_id());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int deletePro(int id) {
        int count = 0;
        String sql = "UPDATE product SET isDelete = 1 WHERE pro_id = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    /**
     * KHOA code
     *
     * @param pro_id Lay sp bang ProID
     */
    public Product getProductByID(int pro_id) {
        Product pro = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from [product] where pro_id=?");
            ps.setInt(1, pro_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }

    public Product getProduct(int pro_id) {
        Product product = null;
        String sql = "select * from product where pro_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pro_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product(rs.getInt("pro_id"), rs.getInt("cat_id"), rs.getString("pro_name"),
                        rs.getString("pro_image"), rs.getString("origin"), rs.getString("brand"), rs.getDouble("mass"),
                        rs.getString("ingredient"), rs.getInt("pro_quantity"), rs.getDouble("pro_price"), rs.getDouble("discount"),
                        rs.getString("pro_description"), rs.getDate("create_date"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    /**
     * KHOA code
     *
     */
    public int editProQuan(int pro_id, Product obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update [product] set pro_quantity=? where pro_id=?");
            ps.setInt(1, obj.getPro_quantity());
            ps.setInt(2, pro_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public LinkedList<Product> getProductHot() {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "SELECT TOP 5\n"
                + "               p.pro_id,\n"
                + "              p.cat_id,\n"
                + "               p.pro_name,\n"
                + "               p.pro_image,\n"
                + "                p.origin,\n"
                + "                p.brand,\n"
                + "                p.mass,\n"
                + "              p.ingredient,\n"
                + "               p.pro_quantity,\n"
                + "                p.pro_price,\n"
                + "               p.discount,\n"
                + "               p.pro_description,\n"
                + "              p.create_date,\n"
                + "              p.isDelete,\n"
                + "                SUM(od.quantity) AS total_quantity_sold\n"
                + "                FROM \n"
                + "                   [swp].[dbo].[order_detail] od\n"
                + "               INNER JOIN \n"
                + "                   [swp].[dbo].[product] p ON od.pro_id = p.pro_id\n"
                + "              GROUP BY \n"
                + "               p.pro_id, p.cat_id, p.pro_name, p.pro_image, p.origin, p.brand, \n"
                + "               p.mass, p.ingredient, p.pro_quantity, p.pro_price, p.discount, \n"
                + "                p.pro_description, p.create_date, p.isDelete\n"
                + "               ORDER BY \n"
                + "                total_quantity_sold DESC;";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
  //Nam CODE
    public ResultSet getIdProHot(){
        ResultSet rs = null;
        String sql = "Select TOP 5 pro_id from [order_detail] group by pro_id";
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.getProduct(21).getPro_name());
    }

}
