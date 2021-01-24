<%-- 
    Document   : newjsplogin
    Created on : Jan 21, 2021, 12:57:10 PM
    Author     : thaid
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://i.ibb.co/GRndfBt/1471682.jpg" alt="1471682" type="image/gif" sizes="16x16">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
            integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
            crossorigin="anonymous"
            />
        <title>Sign up</title>
    </head>
    <body>
        <c:set var="erorrSignup" value="${sessionScope.ERORR_SIGNUP}"/>
        <div class="container">
            <div class="login-container">
                <div class="login-image">

                </div>
                <div class="login-form">
                    <h2 class="login-title">Create New Quiz Online</h2>
                    <form action="CreateAccount" method="POST">
                        <h4>
                            <span class="login-content-text" style="display: none">Oh men newbie here =))!, Hope you will not be tortured =))))</span>
                            <span class="login-content"></span>
                        </h4>
                        <c:if test="${erorrSignup == 'ERORR_SIGNUP'}">
                            <%
                                String error = (String) request.getAttribute("ERORR");
                                if (error != null) {
                            %>
                            <span style="color: red"><%= error%></span>
                            <%
                                }
                            %>
                        </c:if>
                        <input class="login-input email" type="text" name="txtEmail" placeholder="Email Address" value="${requestScope.email}" required/><br/>
                        <input class="login-input password" type="text" name="txtName" placeholder="Name" value="${requestScope.name}" required/><br/>
                        <input class="login-input password" type="password" name="txtPassword" placeholder="Password" required/><br/>
                        <input class="login-input password" type="password" name="txtPasswordConfirm" placeholder="Password Confirm" required/><br/>
                        <input class="login-login" type="submit" value="Sign up" name="btnAction"/>
                        <div class="login-or">
                            <h1>or</h1>
                        </div>
                        <div class="login-footer">
                            <div class="login-create">
                                Already <a href="login.jsp">have</a> account
                            </div>
                            <div class="login-social">
                                <a href="#">
                                    <img src="https://i.ibb.co/82dNbSw/facebook.png" alt="facebook" border="0">
                                </a>
                                <a href="#" style="margin: 0 5px;">
                                    <img src="https://i.ibb.co/HBhvtjg/search-1.png" alt="search-1" border="0">
                                </a>
                                <a href="#" style="margin: 0 5px 0 0;">
                                    <img src="https://i.ibb.co/jWzYqVs/apple.png" alt="apple" border="0">
                                </a>
                                <a href="#">
                                    <img src="https://i.ibb.co/0216T1t/twitter-1.png" alt="twitter-1" border="0">
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.5/typed.js" 
                integrity="sha512-6jYd74hwloeB8HwKDIiUM3juIyZOCyPTrfJbEUlueTxNPjSjcQZr9DkO6P8xVRFuPYN6YitDunNKgxUwFfIixQ==" 
                crossorigin="anonymous">
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        <script>
                    if ($(".login-content").length == 1) {

                        var typed_strings =
                                $(".login-content-text").text();

                        var typed = new Typed(".login-content", {
                            strings: typed_strings.split(", "),
                            typeSpeed: 50,
                            loop: true,
                            backDelay: 900,
                            backSpeed: 30,
                        });
                    }
        </script> 
    </body>
    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        a{
            text-decoration: none;
        }
        input:focus{
            outline: none;
        }
        html,body{
            width: 100%;
            height: 100%;   
            font-family: 'Pacifico', cursive;
            background-image: url(https://i.ibb.co/7VRrBbw/wp2921780-mathematics-wallpapers.jpg);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }
        .container{
            width: 60%;
            height: auto;
            background: linear-gradient(to right, #ada996, #f2f2f2, #dbdbdb, #eaeaea);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 30px;
            border-radius: 20px;
        }
        .login-container{
            width: 100%;
            height: 100%;
            display: flex;
        }
        .login-image{
            width: 50%;
            height: auto;
            background-image: url(https://i.ibb.co/LJCYjry/tenor.gif);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            border-radius: 20px;
        }
        .login-form{
            width: 50%;
            height: 100%;
        }
        .login-title{
            text-align: center;
            font-size: 38px;
            color: #333;
            padding-left: 30px;
        }
        form{
            padding: 0 50px 0 80px;
            position: relative;
        }
        h4{
            text-align: center;
        }
        input{
            font-family: 'Pacifico', cursive;
        }
        .login-input{
            background-color: transparent;
            width: 100%;
            height: 50px;
            font-size: 18px;
            border: none;
            border-bottom: 1px solid darkgray;
        }
        .email{
            margin: 15px 0 0px 0;
        }
        ::placeholder{
            font-size: 16px;
        }
        .login-forget{
            opacity: 0.6;
            text-align:  right;
            transition: all .5s;
            cursor: pointer;
        }
        .login-forget:hover{
            opacity: 1;
        }
        .login-login{
            width: 100%;
            border-radius: 20px;
            border: none;
            background-color: darkseagreen;
            height: 35px;
            margin-top: 20px;
            cursor: pointer;
            transition: all .5s;
            font-weight: bold;
            font-size: 18px;
        }
        .login-login:hover{
            background-color: forestgreen;
        }


        .login-or {
            width: 100%;
            height: 38px;
            margin: 10px 0 0 0;
            text-align: center;
            font-size: 8px;
            position: relative;
        }
        .login-or:after {
            content: '';
            width: 43%;
            border-bottom: solid 1px #bbb;
            position: absolute;
            left: 0;
            top: 40%;
            z-index: 1;
        }
        .login-or:before {
            content: '';
            width: 43%;
            border-bottom: solid 1px #bbb;
            position: absolute;
            right: 0;
            top: 40%;
            z-index: 1;
        }
        .login-footer{
            width: 100%;
            display: flex;
        }
        .login-create{
            width: 50%;
            text-align: center;
        }
        .login-social{
            width: 50%;
            text-align: center;
        }
        .login-social img{
            width: 15%;
        }
        .login-social a{
            width: 20%;
        }
    </style>
</html>
