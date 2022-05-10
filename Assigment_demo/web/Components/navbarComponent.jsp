<%-- 
    Document   : navbar
    Created on : 08-03-2022, 10:07:37
    Author     : Owner
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">FRESH FOODS </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon">

            </span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="HomeController">Home</a></li>                        
            </ul>

            <form action="search" class="d-flex mx-auto">
                <input class="form-control me-2" 
                       name="keyword" 
                       type="search" 
                       placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" value="search" type="submit">Search</button>
            </form>

            <div  class="d-flex my-2">
                <a class="btn btn-outline-dark" href="carts">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
            </div>

            <div >
                <%
                    UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
                    if (userLogin == null) {
                        userLogin = new UserDTO();

                %>

                <a  href="login.jsp"class="btn btn-outline-primary ms-lg-2"  > Login</a>
                <% } else {
                %>

                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <%= userLogin.getFullName()%>
                        
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="user.jsp">Profile</a></li>
                        <li><a class="dropdown-item" href="MainController?action=Logout">Sign Out</a></li>
                       
                    </ul>
                </div>
                <%
                    }

                %>
            </div>    
        </div>
    </div>
</nav>
