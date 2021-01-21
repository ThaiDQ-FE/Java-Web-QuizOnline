<%-- 
    Document   : create-account
    Created on : Jan 21, 2021, 1:00:42 PM
    Author     : thaid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>create page</h1>
        <form action="CreateAccount" method="post">
            Email <input type="text" name="txtEmail" /><br/>
            Name <input type="password" name="txtName"/><br/>
            Password <input type="password" name="txtPassword"/><br/>
            <input type="submit" value="Create account" name="btnAction"/>
        </form>
    </body>
</html>
