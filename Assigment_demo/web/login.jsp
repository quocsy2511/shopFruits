<%-- 
    Document   : login
    Created on : 04-03-2022, 11:29:02
    Author     : Owner
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://www.google.com/recaptcha/api.js"></script>
    </head >
    <body>


        <form action="MainController" method="POST">
            Email<input type="text" name="email" required=""></br>
            Password<input type="password" name="password" required=""><br>
            <input type="submit" name="action" value="Login">
            <input type="reset" value="Reset">
            <button>
                <a type="hiden" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/Assigment_demo/LoginGoogleServlet&response_type=code
                   &client_id=481094789181-q4hci4rtdfejvpq44qllk806c9ehgaf1.apps.googleusercontent.com&approval_prompt=force">Login With Google</a> 
            </button>
            <div class="g-recaptcha"  id="grecaptcha"  data-sitekey="6LedY8keAAAAAKm8HNFlL2DxiNwNCFdtZ0o-E9uK"></div>
            <c:if test="${requestScope.ERROR_RECAPTCHA!= null}">
                <h2>${requestScope.ERROR_RECAPTCHA}</h2>
            </c:if>
        </form>
        <button><a href="createUser.jsp"> CREATE USER</a> </button>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>
