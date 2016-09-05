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
        #todaybutton{
            border-radius: 5px;
            border: none;
            background-color: white;
            color: #b4dad2;
        }
    </style>

</head>
<body>

    <div id="contents">
        <div>
            <input type="text" id="year" value="${calVo.year}">
            <input type="text" id="month" value="${calVo.month}">
            <input type="text" id="endOfMonth" value="${calVo.endOfMonth}">
            <input type="text" id="startWeekDay"  value="${calVo.startWeekDay}">
        </div>


        <table>
            <thead>
                <tr  id="calendarTitle">
                    <th colspan="5">${calVo.year}년 ${calVo.month}월</th>
                    <th colspan="2">
                        <%--get previous month, the parameter value is "-1" --%>
                        <a href="otherMonth?identifier=-1">←</a>
                        <%--today Button, to get current Calendar--%>
                        <button id="todaybutton" onclick="location='currentCal'">Today</button>
                        <%--get next month, the parameter value is "1" --%>
                        <a href="otherMonth?identifier=1">→</a>
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
                                <%--give style for today--%>
                                <c:when test="${todayStyle!=i}">
                                    <td id="getHoverStayle">${i}</td>
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

        <div id="layerPopup">
            <form action="saveContents" method="post">
                title : <input type="text" value="title" name="title">
                contents : <input type="text" value="contents" name="content">
                <button type="submit">Save</button>
            </form>
        </div>

    </div>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

    <script>
        $(document).ready(function () {

            $("#layerPopup").hide();

            $("tbody tr td").click(function () {
                if ($(this).text()!=""){
                    /*alert($("#year").val()+"-"+$("#month").val()+"-"+$(this).text());*/
                    $("#layerPopup").dialog();
                    $("#ui-id-1").text($("#year").val()+"-"+$("#month").val()+"-"+$(this).text());
                }
            });

            //add css style, if you mouse over specific date
            $("tbody tr td").hover(function () {
                //if specific date is not null then the background color is changed
                if ($(this).text()!=""){
                    console.log($(this).text());
                    $(this).css("background-color", "#E8F7FA");
                }
            }, function (){
                $(this).css("background-color", "");
            });
        });
    </script>

</body>

</html>