<%-- 
    Document   : newjsplogin
    Created on : Jan 21, 2021, 12:57:10 PM
    Author     : thaid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://i.ibb.co/GRndfBt/1471682.jpg" alt="1471682" type="image/gif" sizes="16x16">
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div>
                
            </div>
            <div class="login-container">
                <div class="login-image">
                    
                </div>
                <div class="login-form">
                </div>
            </div>
        </div>
        <h1>Login Page</h1>
        <form action="login" method="POST">
            Username <input type="text" name="txtUsername" /><br/>
            Password <input type="password" name="txtPassword"/><br/>
            <input type="submit" value="Login" name="btnAction"/>
        </form><br/>
        <a href="createAccount.jsp">Create account</a>
    </body>
</html>
