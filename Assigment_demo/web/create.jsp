<%-- 
    Document   : creat
    Created on : 05-03-2022, 21:47:14
    Author     : Owner
--%>

<%@page import="product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Let's create new product</h2>
                <form action="MainController" method="POST">
            <%
                ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
                if (productError == null) {
                    productError = new ProductError();
                }
            %>

            Product ID <input type="text" name="productID" minlength="1" maxlength="7"  required="">
            <%= productError.getProductIDError() %> <br>
            Product Name<input type="text" name="productName" minlength="1" maxlength="20" required="">
            <%= productError.getProductNameError() %> <br>
            Price<input type="number" name="price" minlength="1000"  required=""><br>
            Image<input type="text" name="image"  required="">
            <%= productError.getImageError() %> <br>
            Quantity<input type="number" name="quantity" minlength="1"  required=""><br>
            CategoryID<input type="text" name="categoryID"  required="">
            <%= productError.getCategoryIDError() %> <br>
            Import Date<input type="date"  name="importDate" required pattern="\d{4}-\d{2}-\d{2}">
            <%= productError.getImportDateError() %> <br>
            Using Date<input type="date"  name="usingDate" required pattern="\d{4}-\d{2}-\d{2}">
            <%= productError.getUsingDateError() %> <br>


            <input type="submit" name="action" value="Create">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
