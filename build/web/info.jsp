<%-- 
    Document   : info
    Created on : Jan 25, 2021, 1:21:52 AM
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
        <title>Info</title>
    </head>
    <body>
        <c:set var="question_info" value="${requestScope.QUESTION_INFO}"/>
        <div class="container">
            <div class="home-container">
                <h1 class="title" style="text-align: center">Update Question</h1>
                <form action="UpdateQuestion" method="post">
                    <table style="width: 100%;">
                        <tr>
                            <td>Subject ID: </td>
                            <td>
                                <select name="txtSubjectID">
                                    <option>${question_info.subjectID}</option>
                                    <c:forEach var="dto" items="${requestScope.SUBJECT_ID}">
                                        <option  value="${dto.subjectID}">${dto.subjectID}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Question ID: </td>
                            <td><input type="text" value="${question_info.id}" name="txtID" readonly/></td>
                        </tr>
                        <tr>
                            <td>Question content :</td>
                            <td><textarea id="questionContent" name="txtQuestionContent">${question_info.question_content}</textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 1: </td>
                            <td><textarea id="ans1" name="txtAns1">${question_info.answer_1}</textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 2: </td>
                            <td><textarea id="ans2" name="txtAns2">${question_info.answer_2}</textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 3: </td>
                            <td><textarea id="ans3" name="txtAns3">${question_info.answer_3}</textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 4: </td>
                            <td><textarea id="ans4" name="txtAns4">${question_info.answer_4}</textarea></td>
                        </tr>

                        <tr>
                            <td>Answer correct </td>
                            <td><textarea id="ans4" name="txtAnsCor">${question_info.answer_correct}</textarea></td>
                        </tr>
                        <tr>
                            <td><a href="LoadStatus">Go back </a> </td>
                            <td style="text-align: right"><input class="logout-button" type="submit" value="Update Question" name="btAction"></td>
                        </tr>
                    </table>
                </form>

            </div>
        </div>
    </body>

    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
        a{
            text-decoration: none;
            font-size: 26px;
            color: black;
            font-weight: bold;
        }
        a:hover {
            color: #ada996;
        }
        input{
            font-family: 'Pacifico', cursive;
        }
        .logout-button{
            border: none;
            background-color: transparent;
            font-weight: bold;
            font-size: 23px;
            transition: all .5s;
            cursor: pointer;
        }
        .logout-button:hover{
            color: #ada996;
        }
        textarea{
            width: 100%;
            font-family: 'Pacifico', cursive;
        }
        textarea:focus {
            outline: none;
        }
    </style>
</html>
