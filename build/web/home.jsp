<%-- 
    Document   : home
    Created on : Jan 21, 2021, 4:13:34 AM
    Author     : thaid
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Home</title>
    </head>
    <body>
        <c:set var="role" value="${sessionScope.ROLE}"/>
        <c:set var="name" value="${sessionScope.NAME_ACCOUNT}"/>
        <div class="container">
            <div class="home-container">
                <div class="home-top">
                    <c:if test="${role == 1}">
                        <h4 class="home-hello">Hello, Admin - <c:out value="${name}"/></h4>
                    </c:if>
                    <c:if test="${role != 1}">
                        <h4 class="home-hello">Hello, <c:out value="${name}"/></h4>
                    </c:if>

                </div>
                <div class="home-middle">
                    <a class="home-a-link" href="LoadStatus">Get All Question</a><br/>
                    <a class="home-a-link" href="LoadSubject">Create Question No Image</a><br/>
                    <a class="home-a-link" href="createQuestionNoImage.jsp">Create Question With Image</a>
                </div>
                <div class="home-footer">
                    <form class="home-hello" action="logout" method="POST">
                        <input class="logout-button footer" type="submit" name="btnAction" value="Logout"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        a{
            text-decoration: none;
            font-size: 26px;
            color: black;
            font-weight: bold;
        }
        a:hover {
            color: #ada996;
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
            width: 30%;
            height: auto;
            background: linear-gradient(to right, #ada996, #f2f2f2, #dbdbdb, #eaeaea);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 30px;
            border-radius: 20px;
        }
        .home-container{
            width: 100%;
            height: 100%;
        }
        .home-top{
            width: 100%;
            text-align: center;
        }
        input{
            font-family: 'Pacifico', cursive;
        }
        .home-hello{
            display: inline-block;
            font-size: 28px;
        }
        .logout-button{
            border: none;
            background-color: transparent;
            font-weight: bold;
            font-size: 16px;
            transition: all .5s;
            cursor: pointer;
        }
        .logout-button:hover{
            color: #ada996;
        }
        .home-middle{
            text-align: center;
        }
        .click{
            font-size: 26px;
            margin-top: 10px;
        }
        .home-footer{
            text-align: center;
        }
        .footer{
            font-size: 30px;
        }
    </style>
</html>
