<%-- 
    Document   : index
    Created on : 07-03-2022, 11:00:35
    Author     : Owner
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="Components/navbarComponent.jsp" %>
        <!-- Product section-->
        <section class="py-5">
            <div class="container "style="min-height: 1000px">
                <c:choose>
                    <c:when test="${sessionScope.carts ==null||sessionScope.carts.size()==0}">
                        <h1>
                            LIST CART IS EMPTY
                        </h1>
                    </c:when>
                    <c:otherwise>
                        <h3>
                            LIST PRODUCTS
                        </h3>
                        <table class="table" >
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">ProductID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="error" value="${requestScope.PRODUCT_ERROR}"/>
                                <c:forEach items="${sessionScope.carts}" var="C" varStatus="counter">
                                <form action="update-quantity">
                                    <tr>
                                    <input type="hidden" name="productId" value="${C.value.product.productID}"/>
                                    <th scope="row">${counter.count}</th>
                                    <th scope="row">${C.value.product.productID}</th>
                                    <td><img src="${C.value.product.image}" width="60"/></td>
                                    <td>${C.value.product.productName}</td>
                                    <td>VND ${C.value.product.price}</td>
                                    <td><input onchange="this.form.submit()" type="number" name="quantity" value="${C.value.quantity}" />  
                                                        
                                    </td>
                                    <td>VND ${C.value.product.price*C.value.quantity}</td>
                                    <td><a href="delete-cart?productID=${C.value.product.productID}" class="btn btn-outline-danger"> Delete</a></td>
                                    </tr> 
                                </form>
                            </c:forEach>
                                
                            </tbody>
                        </table>
                        <h3>
                            Total Amount: VND ${totalMoney}
                        </h3>
                        <p style="text-align: left; color: red; font-size: 12px;">${requestScope.ERROR_SHOPPING_MESSAGE}</p>  
                        <div>
                            <% UserDTO userCheckout = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (userCheckout == null) {
                                    userCheckout = new UserDTO();

                            %>
                            <a href="login.jsp" class="btn btn-outline-success"> Check Out </a>                            
                            <% } else {
                            %>
                            <div>
                                <a href="checkout" class="btn btn-outline-success"> Check Out </a>
                            </div>
                            <%
                                }
                            %>
                        </div>

                    </c:otherwise>
                </c:choose>

            </div>
        </section>
        <%@include file="Components/footerComponent.jsp" %>
    </body>
</html>

