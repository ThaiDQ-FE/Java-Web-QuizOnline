<%-- 
    Document   : viewQuizHistory
    Created on : Jan 27, 2021, 4:24:11 AM
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
        <title>History Quiz</title>
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
                <form action="SearchHistory" method="post" style="text-align: center">
                    <select name="slStatusDes" id="subject">
                        <c:forEach var="dto" items="${requestScope.LIST_SUBJECT}">
                            <option  value="${dto.subjectName}">${dto.subjectName}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" name="btnAction" value="Search"/>
                </form>

                <div>
                    <table class="tb-head" style="width: 100%;">
                        <thead>
                            <tr class="tr-thead">
                                <th class="zpx">Subject ID</th>
                                <th class="xpx">Subject Name</th>
                                <th class="ypx">Number Question</th>
                                <th class="ypx">Point</th>
                                <th class="ypx">Number Correct Answer</th>
                                <th class="ypx">Time take quiz</th>
                                <th class="ypx">Date take quiz</th>
                            </tr>
                        </thead>
                    </table>

                </div>
                <div class="list">
                    <div class="paginate">
                        <div class="items">
                            <c:forEach var="list" items="${requestScope.HISTORY_LIST}">
                                <div style="display: flex" class="color">
                                    <div class="three-dot zpx center">${list.subjectID}</div>
                                    <div class="three-dot xpx center">${list.subjectName}</div>
                                    <div class="three-dot ypx center">${list.numberQuestion}</div>
                                    <div class="three-dot ypx center">${list.point}</div>
                                    <div class="three-dot ypx center">${list.correctAnswers}</div>
                                    <div class="three-dot ypx center">${list.time}</div>
                                    <div class="three-dot ypx center">${list.date}</div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="pager">
                            <div class="firstPage">&laquo;</div>
                            <div class="previousPage">&lsaquo;</div>
                            <div class="pageNumbers"></div>
                            <div class="nextPage">&rsaquo;</div>
                            <div class="lastPage">&raquo;</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        <script src="https://drive.google.com/uc?export=view&id=1pFZ-6kDz5Bm8TDtaxwdWn5hzkpcw6WYV"></script>
        <script>
            window.onload = function () {
                $(".paginate").paginga({
                    itemsPerPage: 7,

                });
            }
        </script>
    </body>
    <style>
        button:focus{
            outline: none;
        }
        .xpxx{
            width: 120px;
        }
        .pageNumbers a{
            color: #ada996;
        }
        .pageNumbers .active{
            color: black;
        }
        .list{
            height: calc(100% - 175px);
            overflow-x: hidden;
            overflow-y: scroll;
        }
        .disabled{
            cursor:  context-menu !important;
            color: #cccccc;
        }
        .disabled:hover{
            color: #cccccc !important;
        }
        .firstPage,.previousPage,.nextPage,.lastPage{
            cursor: pointer;
            transition: all .5s;
        }
        .firstPage:hover,.previousPage:hover,.nextPage:hover,.lastPage:hover{
            color: #ada996;
        }
        .previousPage, .nextPage{
            margin: 0 24px;
        }
        .pager{
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translate(-50%, 0);
            display: flex;
            font-size: 23px;
        }
        button:focus{
            outline: none;
        }
        .center{
            text-align: center;
        }
        .color:nth-child(odd){
            background: linear-gradient(to right, #ede574, #e1f5c4);
        }
        .qpx{
            width: 100px;
        }
        .zpx{
            width: 100px;
        }
        .xpx{
            width: 120px;
        }
        .ypx{
            width: 110px;
        }
        .three-dot{
            /*            display: inline-block;
                        overflow: hidden;
                        white-space: nowrap;
                        text-overflow: ellipsis;*/
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
            width: 55%;
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
        .flex-container {
            display: flex;
            height: 350px;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        a:active, a:visited {
            color: blue;
        }
    </style>
</html>
