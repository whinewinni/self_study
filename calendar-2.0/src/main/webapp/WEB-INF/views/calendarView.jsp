<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Winni
  Date: 2016-09-18
  Time: 오후 6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calendar</title>
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
        /*tbody tbody td{
            height: 50px;
        }*/
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
        .todayStyle{
            background-color: #d6f8fa;
        }
        #todaybutton{
            border-radius: 5px;
            border: none;
            background-color: white;
            color: #b4dad2;
        }
        .popupbtn {
            border: none;
            color: darkgray;
            padding: 3px 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 11px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            background-color: white;
            color: black;
            border: 2px solid #e7e7e7;
            border-radius: 5px;
        }
        .popupbtn:hover {
            color: white;
            font-weight: bold;
            background-color: #e7e7e7;
        }
        .contentstitle{
            width: 100%;
            font-size:20%;
            background-color: #e7e7e7;
            text-align: right;
        }
    </style>
</head>
<body>
    <div style="display: none">
        <input type="text" id="year" value="${calBean.year}"/>
        <input type="text" id="month" value="${calBean.month}"/>
        <input type="text" id="endOfMonth" value="${calBean.endOfMonthDay}"/>
        <input type="text" id="startWeekDay" value="${calBean.startWeekDay}"/>
    </div>

    <table>
        <thead>
            <tr id="calendarTitle">
                <th colspan="5">${calBean.year}년 ${calBean.month+1}월</th>
                <th colspan="2">
                    <a href="otherMonth?identifier=-1">←</a>
                    <button id="todaybutton" onclick="location='getCurrentCal'">Today</button>
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
                <%--달력에 처음 빈칸을 넣기 위해 공백의 td를 넣어줌--%>
                <c:forEach begin="1" end="${calBean.startWeekDay-1}" step="1">
                    <td></td>
                </c:forEach>

                <%--${calVo.startWeekDay}를 weekDay 변수로 만듦--%>
                <c:set var="weekDay" value="${calBean.startWeekDay}" />

                <%--1부터 마지막 날까지 반복(i값임)해서 td에 넣어줌--%>
                <c:forEach var="i" begin="1" end="${calBean.endOfMonthDay}" step="1">
                    <%--요일이 토요일일 경우 일요일로 변경하고, tr을 닫고 열어서 한주를 늘려줌--%>
                    <c:if test="${weekDay==8}">
                        </tr><tr>
                        <c:set var="weekDay" value="1"/>
                    </c:if>

                    <td id="focusToday">
                        <div>
                            <div style="height: 50%">
                                ${i}<br>
                            </div>
                            <div style="height: 50%">
                                <c:forEach var="listAll" items="${listAll}">
                                    <%--if i is same with listAll.day, then shows the title--%>
                                    <c:if test="${i==listAll.day}">
                                        <div class="contentstitle">
                                            ${listAll.title}
                                            <input type="hidden" value="${listAll.content}" />
                                            <input type="hidden" value="${listAll.calendarnum}"/>
                                        </div>
                                    </c:if>
                                    <%--------------------------------------------------------------
                                    <c:choose>
                                        <c:when test="${i==listAll.day}">
                                            <div class="contentstitle">${listAll.title}</div>
                                        </c:when>
                                        <c:when test="${listAll.day eq null}">
                                            <div>　</div>
                                        </c:when>
                                    </c:choose>
                                    --------------------------------------------------------------%>
                                </c:forEach>
                            </div>
                        </div>
                    </td>

                    <%--요일을 하루씩 증가함--%>
                    <c:set var="weekDay" value="${weekDay+1}"/>
                </c:forEach>

                <%--달의 말일이 끝나고 빈칸을 표시하기 위해 td를 넣어줌--%>
                <c:forEach begin="${weekDay}" end="7" step="1">
                    <td></td>
                </c:forEach>
            <%--테이블을 닫음--%>
            </tr>
        </tbody>
    </table>

    <div id="layerPopup" style="display: none">
        <form action="saveContents" method="post" id="sendData">
            <div>
                <input type="text" value="${calBean.year}" name="year"/>
                <input type="text" value="${calBean.month+1}" name="month"/>
                <input type="text" value="" name="day"  id="nowday"/><br>
                <input type="text" value="" name="calendarnum" id="calendarnum" />
            </div>
            title : <input type="text" value="title" name="title" id="title"/><br>
            contents : <input type="text" value="content" name="content" id="content"/>
            <button type="submit" class="popupbtn">Save</button>
        </form>
    </div>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

    <script>
        $(document).ready(function () {

            $("#layerPopup").hide();

            $("tbody tr td").click(function () {
                if ($(this).text()!=""){
                    //to remove space
                    var showDay=$.trim($(this).text());
                    //get only day(i) value
                    showDay=showDay.split(" ")[0];

                    $("#nowday").val(showDay);
                    /*alert($("#year").val()+"-"+$("#month").val()+"-"+$(this).text());*/
                    $("#layerPopup").dialog();
                    //to operate month
                    var showMonth=parseInt($("#month").val())+1;
                    $("#ui-id-1").text($("#year").val()+"-"+showMonth+"-"+showDay);
                }
            });

            $(".contentstitle").click(function () {
                if ($(this).text()!=null){

                    console.log($(this).children().val());
                    console.log($(this).children().eq(1).val());

                    //change dialog title and content
                    $("#title").val($.trim($(this).text()));
                    $("#content").val($(this).children().val());
                    $("#calendarnum").val($(this).children().eq(1).val());

                    //change form tag action to updateContets
                    $("#sendData").attr('action', 'updateContents');
                    $(".popupbtn").html("UPDATE");

                }
            });

            $("tbody tr td").each(function (index, element) {
                /*console.log(index+"  "+$(element).text());*/
                console.log(${calBean.day});
                if ($(element).text()==${calBean.day}){
                    $(element).addClass("todayStyle");
                }
            });

            $("tbody tr td").hover(function () {
                if ($(this).text()!=""){
                    //console.log($(this).text());
                    $(this).css("background-color", "#E8F7FA");
                }
            }, function () {
                $(this).css("background-color", "");
            });
        });

    </script>

</body>
</html>
