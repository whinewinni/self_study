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
        #contentstitle{
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
                            <div id="appearDate" style="height: 50%">
                                ${i}<br>
                            </div>
                            <div id="appearTitle${i}" style="height: 50%">
                                <c:forEach var="listAll" items="${listAll}">
                                    <%--if i is same with listAll.day, then shows the title--%>
                                    <c:if test="${i==listAll.day}">
                                        <div id="contentstitle">
                                            ${listAll.title}
                                            <input type="hidden" value="${listAll.content}" />
                                            <input type="hidden" value="${listAll.calendarnum}"/>
                                            <input type="hidden" value="${listAll.day}"/>
                                        </div>
                                    </c:if>
                                </c:forEach>
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
                <input type="text" value="${calBean.year}" name="year" id="v_year"/>
                <input type="text" value="${calBean.month+1}" name="month" id="v_month"/>
                <input type="text" value="" name="day" id="nowday"/><br>
                <input type="text" value="" id="calendarnum" name=""/>
            </div>
            title : <input type="text" value="title" name="title" id="title"/><br>
            contents : <input type="text" value="content" name="content" id="content"/>
            <button type="button" class="popupbtn" id="insertData">Save</button>
        </form>
    </div>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

    <script>
        $(document).ready(function () {
            //insertData (using Ajax)
            $("#insertData").click(function () {

                var year=$("#v_year").val();
                var month=$("#v_month").val();
                var day=$("#nowday").val();
                var title=$("#title").val();
                var content=$("#content").val();

                //ajax - updating parts of a web page, without reloading the whole page
                $.ajax({
                    type :'post',
                    url: '/saveContents',  /*'/'이거 줘야함*/
                    data : {
                        year : year,
                        month :month,
                        day :day,
                        title : title,
                        content : content
                    },
                    success: function(calendarNum_seq){
                        //Sequence Number
                        /*alert(calendarNum_seq);*/

                        //창끄기
                        $("#layerPopup").dialog("close");

                        //console.log(title);

                        $("#contentstitle").html();

                        var getappearTitleId="#appearTitle"+day;
                        console.log("getappearTitleId : "+getappearTitleId);
                        console.log($(getappearTitleId).html());
                        alert($(getappearTitleId).html());


                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }
                });
            });

            //hide popup layer
            $("#layerPopup").hide();

            $('[id="appearDate"]').click(function () {
                if ($(this).text()!=""){

                    //to remove space
                    var showDay=$.trim($(this).text());
                    //get only day(i) value   //using split, [0] is first value
                    showDay=showDay.split(" ")[0];

                    //nowday val change to showDay
                    $("#nowday").val(showDay);
                    /*alert($("#year").val()+"-"+$("#month").val()+"-"+$(this).text());*/

                    //to remove title and content
                    $("#title").val("");
                    $("#content").val("");

                    //if you've updated, then change to saveContents again
                    $("#sendData").attr('action', 'saveContents');
                    $(".popupbtn").html("Save");
                    $("#layerPopup").dialog({
                        //fix dialog size
                        width: 400
                    });

                    //to operate month
                    var showMonth=parseInt($("#month").val())+1;
                    $("#ui-id-1").text($("#year").val()+"-"+showMonth+"-"+showDay);
                }
            });

            $("#contentstitle").click(function () {
                if ($(this).text()!=null){
                    //add name attribute in calendarnum input text
                    $("#calendarnum").attr('name','calendarnum');

                    console.log("double click update");

                    //change dialog title and content
                    $("#title").val($.trim($(this).text()));
                    $("#content").val($(this).children().val());
                    //eq(1) - second value
                    $("#calendarnum").val($(this).children().eq(1).val());
                    $("#nowday").val($(this).children().eq(2).val());

                    //change form tag action to updateContets
                    $("#sendData").attr('action', 'updateContents');
                    $(".popupbtn").html("Update");

                    //show layer popup
                    $("#layerPopup").dialog({
                        //fix dialog size
                        width: 400
                    });
                }
            });

            //Double Click Event (Delete)
            $("#contentstitle").dblclick(function (event) {

                //get calendarnum from hidden input
                var deleteCalNum=$(this).children().eq(1).val();
                console.log("deleteCalNum : "+deleteCalNum);
                //set onclick attribute
                var sendAttr="location='deleteContent?calendarnum="+deleteCalNum+"'";
                //change form tag action to delete
                $(".popupbtn").attr('type', 'button');
                $(".popupbtn").html("Delete");

                //add onclick attr to popup button
                $(".popupbtn").attr('onclick', sendAttr);

            });

            $("tbody tr td").each(function (index, element) {
                /*console.log(index+"  "+$(element).text());*/
                //if calBean.day and "day(i)" are same, add style
                if ($(element).text()==${calBean.day}){
                    $(element).addClass("todayStyle");
                }
            });

            $("tbody tr td").hover(function () {
                //mouse over event, if mouse left the 'day' element, the color is none
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
