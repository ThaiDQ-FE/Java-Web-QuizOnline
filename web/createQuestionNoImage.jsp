<%-- 
    Document   : createQuestionNoImage
    Created on : Jan 22, 2021, 8:44:44 PM
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
        <title>Create</title>
    </head>
    <body>

        <div class="container">
            <div class="home-container">
                <h1 class="title">Create Question No Image</h1>
                <form action="CreateQuizNoImage" method="post">
                    <table style="width: 100%;">
                        <tr>
                            <td>Subject ID: </td>
                            <td><select name="slSubjectID" id="subject">
                                    <c:forEach var="dto" items="${requestScope.LIST_SUBJECT}">
                                        <option  value="${dto.subjectID}">${dto.subjectID}</option>
                                    </c:forEach>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Question ID: </td>
                            <td><textarea id="questionID" name="txtQuestionID"></textarea></td>
                        </tr>
                        <tr>
                            <td>Question content :</td>
                            <td><textarea id="questionContent" name="txtQuestionContent"></textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 1: </td>
                            <td><textarea id="ans1" name="txtAns1"></textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 2: </td>
                            <td><textarea id="ans2" name="txtAns2"></textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 3: </td>
                            <td><textarea id="ans3" name="txtAns3"></textarea></td>
                        </tr>
                        <tr>
                            <td>Answer 4: </td>
                            <td><textarea id="ans4" name="txtAns4"></textarea></td>
                        </tr>

                        <tr>
                            <td>Answer correct </td>
                            <td>
                                <input type="radio" id="ans1" name="rdAnsCorrect" value="a1">
                                <label for="ans1">Answer 1</label><br>
                                <input type="radio" id="ans2" name="rdAnsCorrect" value="a2">
                                <label for="ans2">Answer 2</label><br>  
                                <input type="radio" id="ans3" name="rdAnsCorrect" value="a3">
                                <label for="ans3">Answer 3</label><br>
                                <input type="radio" id="ans4" name="rdAnsCorrect" value="a4">
                                <label for="ans4">Answer 4</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td><a href="home.jsp">Go back </a> </td>
                            <td style="text-align: right"><input class="logout-button" type="submit" value="Create Question" name="btAction"></td>
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
            font-size: 16px;
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
