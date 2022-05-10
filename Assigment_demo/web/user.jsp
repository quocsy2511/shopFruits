<%-- 
    Document   : user
    Created on : 04-03-2022, 13:07:28
    Author     : Owner
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your Information :</h1>
        <!--Trong này vùng nhớ còn 3 params và 1 attribute LOGIN_USER bên LoginController -->
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        Email : <%= loginUser.getEmail() %><br>
        Full Name : <%= loginUser.getFullName() %><br>
        Role ID : <%= loginUser.getRoleID() %><br>
        Address : <%= loginUser.getAddress() %><br>
        Birthday : <%= loginUser.getBirthday() %><br>
        Phone : <%= loginUser.getPhone()%><br>
        Password : <%= "***" %>
        
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
    </body>
</html>
