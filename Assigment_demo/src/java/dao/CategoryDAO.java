package dao;

import dbutils.DBUtils;
import dto.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;
import javax.servlet.DispatcherType;

public class CategoryDAO {

    private static final String CATEGORY = "SELECT categoryID, categoryName FROM Category";

    public List<CategoryDTO> getAllCategories() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CATEGORY);
            rs = ptm.executeQuery();
            while(rs.next()){
                String categoryID = rs.getString("categoryID");
                String categoryName = rs.getString("categoryName");
                list.add(new CategoryDTO(categoryID, categoryName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        finally {
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
    


}
