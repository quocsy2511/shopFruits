/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import cart.Cart;
import dbutils.DBUtils;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

/**
 *
 * @author Owner
 */
public class OrderDetailDAO {

    private static final String ORDERDETAIL = "INSERT INTO [dbo].[OrderDetail]\n"
            + "           ([orderID]\n"
            + "           ,[price]\n"
            + "           ,[quantity]\n"
            + "           ,[productID])\n"
            + "     VALUES\n"
            + "           (?,?,?,?)";

    public void saveCart(int orderID, Map<Integer, Cart> carts) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(ORDERDETAIL);
            ptm.setInt(1, orderID);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productID = entry.getKey();
                Cart cart = entry.getValue();
                ptm.setDouble(2, cart.getProduct().getPrice());
                ptm.setDouble(3, cart.getProduct().getQuantity());               
                ptm.setString(4, cart.getProduct().getProductID());                
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
}
