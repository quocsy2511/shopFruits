/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbutils.DBUtils;
import dto.OrderDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OrderDAO {

    private static final String ORDER = "INSERT INTO [dbo].[Orders]\n"
            + "           ([total]\n"
            + "           ,[email])\n"
            + "     VALUES\n"
            + "           (?,?)";

    public int createReturnID(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(ORDER, Statement.RETURN_GENERATED_KEYS);
            ptm.setDouble(1, order.getTotal());
            ptm.setString(2, order.getEmail());
            ptm.executeUpdate();
            rs = ptm.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
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
        return 0;
    }
}
