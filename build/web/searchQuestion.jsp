<%-- 
    Document   : searchQuestion
    Created on : Jan 24, 2021, 7:58:44 PM
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
        <title>Search</title>
    </head>
    <body>
        <div class="container">
            <div class="home-container">
                <div class="search-top">
                    <a href="home.jsp">Back</a>
                    <form class="home-hello" action="logout" method="POST">
                        <input class="logout-button logout" type="submit" name="btnAction" value="Logout"/>
                    </form>
                </div>

                <form action="Search" method="post" style="text-align: center">
                    <select name="slType">
                        <option>Name Question</option>
                        <option>Subject ID</option>
                    </select>
                    <select name="slStatusDes" id="subject">
                        <c:forEach var="dto" items="${requestScope.LIST_STATUS}">
                            <option  value="${dto.description}">${dto.description}</option>
                        </c:forEach>
                    </select>
                    <input type="text" name="txtSearchValue"/>
                    <input type="submit" name="btnAction" value="Search"/>
                </form>
                <div>
                    <table class="tb-head">
                        <thead>
                            <tr class="tr-thead">
                                <th class="zpx">ID</th>
                                <th class="xpx">Question Content</th>
                                <th class="ypx">Answer 1</th>
                                <th class="ypx">Answer 2</th>
                                <th class="ypx">Answer 3</th>
                                <th class="ypx">Answer 4</th>
                                <th class="three-dot ypx">Answer Correct</th>
                                <th class="ypx">Create Date</th>
                                <th class="ypx">Subject Name</th>
                            </tr>
                        </thead>
                    </table>

                </div>
                <div class="list">
                    <table>
                        <c:forEach var="list" items="${requestScope.LIST_QUESTION}">
                            <tbody style="width: 100%" class="color">
                                <tr>
                                    <td class="three-dot zpx">${list.id}</td>
                                    <td class="three-dot xpx">${list.question_content}</td>
                                    <td class="three-dot ypx">${list.answer_1}</td>
                                    <td class="three-dot ypx">${list.answer_2}</td>
                                    <td class="three-dot ypx">${list.answer_3}</td>
                                    <td class="three-dot ypx">${list.answer_4}</td>
                                    <td class="three-dot ypx">${list.answer_correct}</td>
                                    <td class="three-dot ypx">${list.createDate}</td>
                                    <td class="three-dot qpx">${list.subjectID}</td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <style>
        .color:nth-child(even){
            background: linear-gradient(to right, #ede574, #e1f5c4);
        }
        .qpx{
            width: 100px;
        }
        .zpx{
            margin-right: 5px;
        }
        .xpx{
            width: 220px
        }
        .ypx{
            width: 105px;
        }
        .three-dot{
            display: inline-block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .list{
            height: calc(100% - 139px);
            overflow-x: hidden;
            overflow-y: scroll;
        }
        .logout{
            font-size: 23px;
        }
        select:focus{
            outline: none;
        }
        select{
            font-family: 'Pacifico', cursive;
            height: 30px;
            border-radius: 5px;
        }
        .search-top{
            display: flex;
            justify-content: space-between;
        }
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
            width: 70%;
            height: 70%;
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
            border-radius: 5px;
            font-family: 'Pacifico', cursive;
            padding: 0 15px;
        }
        .home-hello{
            display: inline-block;
            font-size: 28px;
        }
        .logout-button{
            font-size: 23px;
            border: none;
            background-color: transparent;
            font-weight: bold;
            transition: all .5s;
            cursor: pointer;
        }
        .logout-button:hover{
            color: #ada996;
        }
    </style>
</html>
