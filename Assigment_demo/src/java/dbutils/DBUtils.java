/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Owner
 */
public class DBUtils {
    public static final Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
      
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=UserManagement_1";
        conn = DriverManager.getConnection(url, "sa", "123456");
        return conn;
    }
}
