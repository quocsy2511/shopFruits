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
        <div class="container">
            
        
        <div class="alert alert-primary text-center" role="alert" style="min-height: 100px">
            Order Successfully, See you again
            <div class="text-center">
                <a class="btn  btn-outline-success" href="HomeController"> FRESH FOOD </a>
            </div>
            
        </div>
            </div>
        <%@include file="Components/footerComponent.jsp" %>
    </body>
</html>

