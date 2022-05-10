
package dto;

/**
 *
 * @author Owner
 */
public class ProductDTO {
    private String productID;
    private String productName;
    private double price;
    private String image;
    private int quantity;
    private String categoryID;
    private String importDate;
    private String usingDate;

    public ProductDTO() {
        this.productID = "";
        this.productName = "";
        this.price = 0;
        this.image = "";
        this.quantity = 0;
        this.categoryID = "";
        this.importDate = "";
        this.usingDate = "";
    }

    public ProductDTO(String productID, String productName, double price, String image, int quantity, String categoryID, String importDate, String usingDate) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.importDate = importDate;
        this.usingDate = usingDate;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }
    
    
}
