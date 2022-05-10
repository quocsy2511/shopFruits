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
                <h1>
                    Checkout
                </h1>
                <div class="row">
                    <div class="col-md-8" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
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

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.carts}" var="C" varStatus="counter">

                                    <tr>
                                <input type="hidden" name="productId" value="${C.value.product.productID}"/>
                                <th scope="row">${counter.count}</th>
                                <th scope="row">${C.value.product.productID}</th>
                                <td><img src="${C.value.product.image}" width="60"/></td>
                                <td>${C.value.product.productName}</td>
                                <td>VND ${C.value.product.price}</td>
                                <td>${C.value.quantity}</td>
                                <td>VND ${C.value.product.price*C.value.quantity}</td>                                   
                                </tr> 

                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>
                            Total Amount: VND ${totalMoney}
                        </h3>
                    </div>
                    <div class="col-md-4" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <form action="checkout" method="POST">


                            <h3>Information Of Customer</h3>
                            <%                            UserDTO userLogin2 = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (userLogin2 == null) {
                                    userLogin2 = new UserDTO();
                            %>

                            <button type="submit"   class="btn btn-primary w-100">Submit</button>

                            <% } else {
                            %>

                            <div ">
                                <button class="btn btn-secondary w-100 " type="button">
                                    <h3> THANKS FOR USED</h3>
                                    <%= userLogin.getFullName()%>
                                </button>
                                <h1></h1>

                                <button type="submit"   class="btn btn-primary w-100">Submit</button>

                            </div>
                        </form>
                        <%
                            }
                        %>

                    </div></div>

            </div>
        </section>
        <%@include file="Components/footerComponent.jsp" %>
    </body>
</html>

