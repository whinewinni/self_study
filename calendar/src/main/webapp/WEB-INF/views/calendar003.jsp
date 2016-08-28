<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        table {
            border: 5px solid black;
            border-radius: 10px;
            background-color: black;
        }
        td {
            background-color: white;
            border-radius: 5px;
            padding: 5px;
            width: 90px
        }
        #weekday{
            color: white;
        }
        #calendarTitle{
            color: white;
        }
    </style>

    <script>

    </script>

</head>
<body>

<input type="text" id="year" value="${calVo.year}">
<input type="text" id="month" value="${calVo.month}">
<input type="text" id="endOfMonth" value="${calVo.endOfMonth}">
<input type="text" id="startWeekDay"  value="${calVo.startWeekDay}">

<table>
    <thead>
    <tr id="calendarTitle">
        <th><a>←</a></th>
        <th colspan="5">날짜나올자리</th>
        <th><a>→</a></th>
    </tr>
    <tr id="weekday">
        <th><font color="red">Sunday</font></th>
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
        <c:forEach var="emptySpace" begin="1" end="${calVo.startWeekDay-1}" step="1">
            <td></td>
        </c:forEach>

        <c:set var="weekDay" value="${calVo.startWeekDay}" />
        <c:forEach var="i" begin="1" end="${calVo.endOfMonth}" step="1">
            <c:if test="${weekDay==8}">
                <c:set var="weekDay" value="1"/>
                </tr><tr>
            </c:if>
            <td>${i}</td>
            <c:set var="weekDay" value="${weekDay+1}"/>
        </c:forEach>

        <c:forEach begin="${weekDay}" end="7" step="1">
            <td></td>
        </c:forEach>
        </tr>

    </tbody>
</table>

</body>
</html>