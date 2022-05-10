<%-- 
    Document   : createUser
    Created on : 09-03-2022, 23:21:39
    Author     : Owner
--%>

<%@page import="user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create Users</h1>
        <form action="MainController" method="POST">
            <%
                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                if (userError == null) {
                    userError = new UserError();
                }
            %>
            Email <input type="email" name="email" required="">
            <%= userError.getEmailError()%> <br>
            Full Name<input type="text" name="fullName" minlength="5" maxlength="20" required="">
            <%= userError.getFullNameError()%> <br>             
            Address<input type="text" name="address" required=""><br>
            Phone <input type="text" name="phone" minlength="0" maxlength="11" required=""><br>
            Password<input type="password" name="password" required=""><br>
            Role ID<input type="text" name="roleID" value="US" required="" readonly=""><br>
            Confirm<input type="password" name="confirm" required=""><br>
            <%= userError.getConfirmError()%> <br>

            <input type="submit" name="action" value="CreateUser">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
