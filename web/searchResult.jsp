<%-- 
    Document   : test
    Created on : Jan 24, 2021, 11:21:45 PM
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
        <title>Search</title>
    </head>
    <body>
        <div class="container">
            <div class="home-container">
                <div class="search-top">
                    <a href="LoadStatus">Back</a>
                    <form class="home-hello" action="logout" method="POST">
                        <input class="logout-button logout" type="submit" name="btnAction" value="Logout"/>
                    </form>
                </div>
                <div>
                    <table class="tb-head">
                        <thead>
                            <tr class="tr-thead">
                                <th class="zpx">ID</th>
                                <th class="xpxx">Question Content</th>
                                <th class="ypx">Answer 1</th>
                                <th class="ypx">Answer 2</th>
                                <th class="ypx">Answer 3</th>
                                <th class="ypx">Answer 4</th>
                                <th class="three-dot ypx">Answer Correct</th>
                                <th class="ypx">Create Date</th>
                                <th class="ypx">Subject Name</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                    </table>

                </div>
                <div class="list">
                    <div class="paginate">
                        <div class="items">
                            <c:forEach var="list" items="${requestScope.SEARCH_RESULT}">
                                <div style="display: flex" class="color">
                                    <div class="three-dot zpx center">${list.id}</div>
                                    <div class="three-dot xpx center">${list.question_content}</div>
                                    <div class="three-dot ypx center">${list.answer_1}</div>
                                    <div class="three-dot ypx center">${list.answer_2}</div>
                                    <div class="three-dot ypx center">${list.answer_3}</div>
                                    <div class="three-dot ypx center">${list.answer_4}</div>
                                    <div class="three-dot ypx center">${list.answer_correct}</div>
                                    <div class="three-dot ypx center">${list.createDate}</div>
                                    <div class="three-dot qpx center">${list.subjectID}</div>
                                    <div class="center" style="width: 40px">
                                        <form action="Delete" method="post">
                                            <input style="display: none" type="text" value="${list.id}" name="pk"/>
                                            <button style="border: none; background: transparent; cursor: pointer" onclick="return confirm('Are you sure you want to delete this Product!?')" class="button-delete" type="submit" name="btnAction">
                                                <img style="width: 21px" src="https://i.ibb.co/P5kgvVf/delete.png" alt="delete" border="0">
                                            </button>
                                        </form>
                                    </div>
                                    <div class="center" style="width: 40px">
                                        <form action="GetInfo" method="post">
                                            <input style="display: none" type="text" value="${list.id}" name="pk"/>
                                            <button style="border: none; background: transparent; cursor: pointer" class="button-update" type="submit" name="btnAction">
                                                <img style="width: 21px" src="https://i.ibb.co/j87LQ1p/updated.png" alt="updated" border="0">
                                            </button>
                                        </form>
                                    </div>
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
                                                    itemsPerPage: 5,

                                                });
                                            }
        </script>
    </body>
    <style>
        button:focus{
            outline: none;
        }
        .xpxx{
            width: 300px;
        }
        .pageNumbers a{
            color: #ada996;
        }
        .pageNumbers .active{
            color: black;
        }
        .list{
            height: calc(100% - 139px);
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
            width: 50px;
        }
        .xpx{
            width: 285px
        }
        .ypx{
            width: 110px;
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
            width: 82%;
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
