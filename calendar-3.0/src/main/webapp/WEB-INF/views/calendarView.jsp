<%--
  Created by IntelliJ IDEA.
  User: Winni
  Date: 2016-10-03
  Time: 오전 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WhineWinniCalendar</title>
        <%--Bootstrap lib--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        /*Today Button*/
        #getTodayBtn{
            border-radius: 5px;
            border: none;
            background-color: white;
            color: #b4dad2;
        }
        /*calendar table*/
        .table, .table-sm{
            border: 5px solid #b4dad2;
            border-radius: 10px !important;
            background-color: #b4dad2;
            width: inherit;
            height: inherit;
            margin: 10px;
        }
        .table th{
            text-align: center;
        }
        th{
            background-color: #b4dad2;
        }
        td {
            background-color: white;
            border-radius: 5px;
            padding: 5px;
            width: 90px
        }
        #weekday, #calendarTitle{
            color: white;
        }
        a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>

<table class="table table-sm">
    <thead>
        <tr id="calendarTitle">
            <th colspan="5">2016년 10월</th>
            <th colspan="2">
                <a>←</a>
                <button id="getTodayBtn">Today</button>
                <a>→</a>
            </th>
        </tr>
        <tr id="weekday">
            <th><font color="#FF173E">Sunday</font></th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
            <th><font color="#00bfff">Saturday</font></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </tbody>
    <%--add buttons later.--%>
    <%--<tfoot>
        <tr>
            <td colspan="7"></td>
        </tr>
    </tfoot>--%>
</table>


<div>
    <form action="saveTestRequestMapping" method="post">
        <input type="text" name="title" value=""/>
        <input type="text" name="content" value=""/>
        <button type="submit" value="Btn">Btn</button>
    </form>
</div>


<div>
    ${TestList.title}<br>
    ${TestList.content}<br>
    ${TestList.scheduleTime}<br>

</div>

</body>
</html>
