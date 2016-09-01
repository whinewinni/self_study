<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        table {
            border: 5px solid #b4dad2;
            border-radius: 10px;
            background-color: #b4dad2;
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
        a {
            color: white;
            text-decoration: none;
        }
        #todayStyle{
            background-color: #d6f8fa;
        }
    </style>
</head>
<body>

    <div>
        <input type="text" id="year" value="${calVo.year}">
        <input type="text" id="month" value="${calVo.month}">
        <input type="text" id="endOfMonth" value="${calVo.endOfMonth}">
        <input type="text" id="startWeekDay"  value="${calVo.startWeekDay}">
    </div>

    <table>
        <thead>
            <tr id="calendarTitle">
                <th><a href="version2calendar?identifier=-1">←</a></th>
                <th colspan="5">${calVo.year}년 ${calVo.month}월</th>
                <th><a href="version2calendar?identifier=1">→</a></th>
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
                <c:forEach var="emptySpace" begin="1" end="${calVo.startWeekDay-1}" step="1">
                    <td></td>
                </c:forEach> <%--달력에 처음 빈칸을 넣기 위해 공백의 td를 넣어줌--%>

                <c:set var="weekDay" value="${calVo.startWeekDay}" />
                <%--${calVo.startWeekDay}를 weekDay 변수로 만듦--%>

                <c:forEach var="i" begin="1" end="${calVo.endOfMonth}" step="1">
                    <c:if test="${weekDay==8}">
                        <c:set var="weekDay" value="1"/>
                        </tr><tr>
                    </c:if> <%--요일이 토요일일 경우 일요일로 변경하고, tr을 닫고 열어서 한주를 늘려줌--%>
                        <c:choose>
                            <%--        수정!!!!!!!!!!!!!!!!!!!!!!!!!!!
                            처음 현재만 나오고 이전달이나 다음달로 날짜를 변경했다가 다시 현재 달로 돌아가면
                            포커스가 표시되지 않음.  ->0으로만 구분했을때.
                            0으로 구분하지 않고 현재 날짜를 뿌려주면, 다음달이나 이전달로 돌아가면
                            계속해서 30일이 나오거나 2월을 지나가면 28일로 변경됨. --%>
                            <%--give style for today--%>
                            <c:when test="${todayStyle!=i}">
                                <td>${i}</td>
                            </c:when>
                            <%--if "${i}"is today date then, add "todayStyle"--%>
                            <c:when test="${todayStyle==i}">
                                <td id="todayStyle">${i}</td>
                            </c:when>
                        </c:choose>
                    <c:set var="weekDay" value="${weekDay+1}"/> <%--요일을 하루씩 증가함--%>
                </c:forEach> <%--1부터 마지막 날까지 반복(i값임)해서 td에 넣어줌--%>

                <c:forEach begin="${weekDay}" end="7" step="1">
                    <td></td>
                </c:forEach> <%--달의 말일이 끝나고 빈칸을 표시하기 위해 td를 넣어줌--%>
                </tr> <%--테이블을 닫음--%>
        </tbody>
    </table>

</body>
</html>