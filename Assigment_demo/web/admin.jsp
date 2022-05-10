<%-- 
    Document   : admin
    Created on : 04-03-2022, 12:57:26
    Author     : Owner
--%>

<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        Welcome : <h1> <%= loginUser.getFullName()%> </h1>
        <form action="MainController">
            Search <input type="text" name="search" value="<%= search%>"/>
            <input type="submit" name="action" value="Search"/>
            <input type="submit" name="action" value="Logout"/>

        </form>

        <%
            List<ProductDTO> listProducts = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            if (listProducts != null) {
                if (listProducts.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ProductID</th>
                    <th>ProductName</th>
                    <th>price</th>
                    <th>image</th>
                    <th>quantity</th>
                    <th>categoryID</th>
                    <th>ImportDate</th>
                    <th>UsingDate</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>

            <tbody>
                <%
                    int count = 1;
                    for (ProductDTO product : listProducts) {
                %>


            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="productID" value="<%= product.getProductID()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="productName" value="<%= product.getProductName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="price" value="<%= product.getPrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="image" value="<%= product.getImage()%>" required=""/>
                    </td>
                    <td>
                        <input type="number" name="quantity" minlength="1" value="<%= product.getQuantity()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="categoryID" value="<%= product.getCategoryID()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="importDate" value="<%= product.getImportDate()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="usingDate" value="<%= product.getUsingDate()%>" required=""/>
                    </td>                   
                    <td>
                        <a href="MainController?action=Delete&productID=<%= product.getProductID()%>&search=<%= search%>">Delete</a>

                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                </tr>
            </form>

            <%
                }
            %>

            <% }
                }
            %>
<!--            <input type="submit" href="creat.jsp" value="Add new product">-->
            <a href="create.jsp">Create product</a>
            </tbody>
        </table>
    </body>
</html>
