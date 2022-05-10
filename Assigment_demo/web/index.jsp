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
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">FRESH FOODS</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Ăn Chay Niệm Phật </p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h2>List Categories</h2>
                        <ul class="list-group">
                            <c:forEach items="${sessionScope.LIST_CATEGORY}" var="c">
                                <li class="list-group-item"><a href="filter-category?categoryID=${c.categoryID}">${c.categoryName}</a></li>
                            </c:forEach>
                            
                                                      
                          </ul>
                    </div>
                    <div  class="col-md-9">
                        <h2>List Products</h2>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <c:forEach items="${LIST_PRODUCT}" var="p">                                
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    
                                    <a href="deatail?productID=${p.productID}">
                                        <img class="card-img-top" src="${p.image}" alt="..." />
                                    </a>
                                    
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${p.productName}</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            VND ${p.price}
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="add-to-cart?productID=${p.productID}">Add to cart</a></div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                                               
                    </div>
                </div>

            </div>
        </section>
        <%@include file="Components/footerComponent.jsp" %>
    </body>
</html>

