<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Winni
  Date: 2016-10-23
  Time: 오후 07:41
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
        a, a:hover {
            color: white;
            text-decoration: none;
        }
        .todayStyle{
            background-color: #d6f8fa;
        }
        /*        .modal-dialog{
                    position: inherit;
                    left: 50%;
                    !*now you must set a margin left under zero - value is a half width your window*!
                    margin-left: -312px;
                    !*this same situation is with height - example*!
                    height: 500px;
                    top: 50%;
                    margin-top: -250px;
                }*/
        #contentstitle{
            width: 100%;
            font-size:20%;
            background-color: #e7e7e7;
            text-align: right;
        }
    </style>
</head>
<body>
    <div>
        <table class="table table-sm">
            <thead>
                <tr id="calendarTitle">
                    <th colspan="5">${calBean.year}년 ${calBean.month+1}월</th>
                    <th colspan="2">
                        <a href="otherMonth?identifier=-1">←</a>
                        <button id="getTodayBtn" onclick="location='/'">Today</button>
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
                <!--star Table tr-->
                <tr>
                    <c:forEach begin="1" end="${calBean.startWeekDay-1}" step="1">
                        <td></td>
                    </c:forEach>

                    <%--${calVo.startWeekDay}를 weekDay 변수로 만듦--%>
                    <c:set var="weekDay" value="${calBean.startWeekDay}"/>

                    <%--1부터 마지막 날까지 반복(i값임)해서 td에 넣어줌--%>
                    <c:forEach var="i" begin="1" end="${calBean.endOfMonthDay}" step="1">
                        <%--요일이 토요일일 경우 일요일로 변경하고, tr을 닫고 열어서 한주를 늘려줌--%>
                        <c:if test="${weekDay==8}">
                            </tr><tr>
                            <c:set var="weekDay" value="1"/>
                        </c:if>

                        <td id="focusToday">
                            <div id="appearDate" style="height: 50%">
                                ${i}<br/>
                            </div>
                            <div id="appearTitle${i}" style="height: 50%">


                                <%--title 하나만 가져온다. query에서 자르거나, jstl로 hidden으로 처리한다. --%>



                            </div>
                        </td>

                        <%--요일 증가--%>
                        <c:set var="weekDay" value="${weekDay+1}"/>
                    </c:forEach>

                    <c:forEach begin="${weekDay}" end="7" step="1">
                        <td></td>
                    </c:forEach>
                </tr>
            </tbody>
        </table>

    </div>
    <script>
        $(document).ready(function () {


            //today style
            $("tbody tr td").each(function (index, element) {
                //if calBean.day and "day(i)" are same, add style
                if ($(element).children().eq(0).text()==${calBean.day}){
                    $(element).addClass("todayStyle");
                }
            });

            //mouse over style each day
            $("tbody tr td").hover(function () {
                //mouse over event, if mouse left the 'day' element, the color is none
                if ($(this).text()!=""){
                    $(this).css("background-color", "#E8F7FA");
                }
            }, function () {
                $(this).css("background-color", "");
            });

        });
    </script>
</body>
</html>
