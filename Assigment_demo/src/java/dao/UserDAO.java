package dao;

import dbutils.DBUtils;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {

    private static final String LOGIN = "SELECT fullName, roleID, address, birthday, phone FROM Users "
            + "WHERE email = ? AND password = ?";
    private static final String CREATE = "INSERT INTO Users(email, fullName, address, phone, password,roleID) "
            + "VALUES(?,?,?,?,?,?)";


    public UserDTO checkLogin(String email, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, email);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    user = new UserDTO(email, fullName, "", roleID, address, birthday, phone);
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
        return user;

    }

    public boolean createUserV2(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, user.getEmail());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getAddress());
                ptm.setString(4, user.getPhone());
                ptm.setString(5, user.getPassword());
                ptm.setString(6, user.getRoleID());
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



}
