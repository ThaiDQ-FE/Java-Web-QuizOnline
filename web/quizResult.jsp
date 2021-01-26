<%-- 
    Document   : quizResult
    Created on : Jan 26, 2021, 5:46:42 AM
    Author     : thaid
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Result</title>
    </head>
    <body>
        <c:set var="numberQuestions" value="${requestScope.NUMBER_QUESTION}" />
        <c:set var="point" value="${requestScope.FINAL_POINT}" />
        <c:set var="time" value="${requestScope.TIME_TAKE_QUIZ}" />
        <c:set var="correctsAnswer" value="${requestScope.QUESTIONS_CORRECT}"/>
        <c:set var="subjectID" value="${requestScope.SUBJECT_ID}"/>
        <c:set var="currentDate" value="${requestScope.DATE}"/>
        <c:set var="student" value="${sessionScope.STUDENT.name}"/>
        <c:set var="role" value="${sessionScope.ROLE}"/>
        <c:set var="name" value="${sessionScope.NAME_ACCOUNT}"/>
        <div class="container">
            <div class="home-container">
                <table class="flex-container">
                    <tbody>
                        <tr>
                            <td>
                                <h1 style="color: red">Quiz Result</h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>Subject Quiz : </td>
                            <td><font color="red">${subjectID}</font></td>
                        </tr>

                        <tr>
                            <td>Number of questions : </td>
                            <td><font color="red">${numberQuestions}</font></td>
                        </tr>

                        <tr>
                            <td>Point : </td>
                            <td><font color="red">${point}</font></td>
                        </tr>
                        <tr>
                            <td>Correct Answer</td>
                            <td><font color="red">${correctsAnswer}</font></td>
                        </tr>
                        <tr>
                            <td>Time take quiz</td>
                            <td><font color="red">${time}</font></td>
                        </tr>
                        <tr>
                            <td>Date</td>
                            <td><font color="red"><fmt:formatDate value="${currentDate}" pattern="dd-MMM-yyyy"/></font></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="home.jsp">Take another quiz </a> </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
    <style>
        .slSubjectID{
            border: none;
            background: transparent;
            cursor: pointer;
            font-family: 'Pacifico', cursive;
            transition: all .5s;
            font-weight: bold;
        }
        .slSubjectID:focus{
            outline: none;
        }
        .slSubjectID:hover{
            color: #ada996;
        }
        .take-quiz{
            border: none;
            font-size: 23px;
            background: transparent;
            font-weight: bold;
            cursor: pointer;
            transition: all .5s;
        }
        .take-quiz:hover{
            color: #ada996;
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
        .flex-container {
            display: flex;
            height: 350px;
            justify-content: center;
            align-items: center;
        }
        a:active, a:visited {
            color: blue;
        }
    </style>
</html>
