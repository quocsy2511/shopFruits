package dao;

import dbutils.DBUtils;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private static final String SEARCH = "SELECT productID, productName, price, image, quantity,"
            + " categoryID, importDate, usingDate FROM Products WHERE productName LIKE ?";

    private static final String DELETE = "DELETE Products "
            + "WHERE productID = ?";
    private static final String UPDATE = "UPDATE Products SET productName = ?, price = ?, image = ?, "
            + "quantity = ?, categoryID = ?, importDate = ?, usingDate = ?  WHERE productID = ? ";

    private static final String CHECK_DUPLICATE = "SELECT productName FROM Products "
            + "WHERE productID = ?";
    private static final String CREATE = "INSERT INTO [dbo].[Products]\n"
            + "           ([productID]\n"
            + "           ,[productName]\n"
            + "           ,[price]\n"
            + "           ,[image]\n"
            + "           ,[quantity]\n"
            + "           ,[categoryID]\n"
            + "           ,[importDate]\n"
            + "           ,[usingDate])\n"
            + "     VALUES\n"
            + "           (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String PRODUCT = "SELECT productID, productName, price, image, quantity, categoryID, importDate, usingDate FROM Products";
    private static final String PBC = "SELECT productID, productName, price, image, quantity, categoryID, importDate, usingDate FROM Products WHERE Products.categoryID = ?";
    private static final String SEARCH2 = "SELECT productID, productName, price, image, quantity, categoryID, importDate, usingDate FROM Products WHERE productName LIKE ? ";
    private static final String PRODUCT2 = "SELECT productID, productName, price, image, quantity, categoryID, importDate, usingDate FROM Products WHERE productID =?";
    private static final String PAB = "UPDATE Products SET quantity = quantity - ? WHERE productID=?";
    private static final String GET_PRODUCT_QUANTITY ="SELECT [quantity]FROM [dbo].[Products] WHERE productID=?";

    public List<ProductDTO> getListProduct(String search) throws SQLException {

        List<ProductDTO> ListProducts = new ArrayList<>();
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");

                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");

                    ListProducts.add(new ProductDTO(productID, productName, price, image, quantity, categoryID, importDate, usingDate));
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return ListProducts;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                String productID = product.getProductID();
                String productName = product.getProductName();
                double price = product.getPrice();
                String image = product.getImage();
                int quantity = product.getQuantity();
                String categoryID = product.getCategoryID();
                String importDate = product.getImportDate();
                String usingDate = product.getUsingDate();
                ptm.setString(1, productName);
                ptm.setDouble(2, price);
                ptm.setString(3, image);
                ptm.setInt(4, quantity);
                ptm.setString(5, categoryID);
                ptm.setString(6, importDate);
                ptm.setString(7, usingDate);
                ptm.setString(8, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean createProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getProductName());
                ptm.setDouble(3, product.getPrice());
                ptm.setString(4, product.getImage());
                ptm.setInt(5, product.getQuantity());
                ptm.setString(6, product.getCategoryID());
                ptm.setString(7, product.getImportDate());
                ptm.setString(8, product.getUsingDate());
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<ProductDTO> getAllProducts() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(PRODUCT);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                String categoryID = rs.getString("categoryID");
                String importDate = rs.getString("importDate");
                String usingDate = rs.getString("usingDate");

                list.add(new ProductDTO(productID, productName, price, image, quantity, categoryID, importDate, usingDate));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;
    }

    public List<ProductDTO> getProductsByCategoryID(int categoryID) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(PBC);
            ptm.setInt(1, categoryID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                String categoryId = rs.getString("categoryID");
                String importDate = rs.getString("importDate");
                String usingDate = rs.getString("usingDate");

                list.add(new ProductDTO(productID, productName, price, image, quantity, productID, importDate, usingDate));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;
    }

    public List<ProductDTO> search(String keyword) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH2);
            ptm.setString(1, "%" + keyword + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                String categoryID = rs.getString("categoryID");
                String importDate = rs.getString("importDate");
                String usingDate = rs.getString("usingDate");

                list.add(new ProductDTO(productID, productName, price, image, quantity, categoryID, importDate, usingDate));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;
    }

    public ProductDTO getProductByID(String product2ID) throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(PRODUCT2);
            ptm.setString(1, product2ID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                String categoryID = rs.getString("categoryID");
                String importDate = rs.getString("importDate");
                String usingDate = rs.getString("usingDate");
                ProductDTO product = new ProductDTO(productID, productName, price, image, quantity, categoryID, importDate, usingDate);

                return product;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return null;
    }

    public void ProductAfterBuy(String productID, int quantity) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(PAB);
                ptm.setInt(1, quantity);
                ptm.setString(2, productID);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public int getProductQuantity(int productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
                ptm.setInt(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }
}
