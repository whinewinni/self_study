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
        .modal-header, h4, .close {
            background-color: #b4dad2;
            color:white !important;
            text-align: center;
            font-size: 30px;
        }
        .btn-default, .modal-footer {
            background-color: #b4dad2;
        }
        .btn-default:hover{
            color: white;
            background-color: #C6E4DE;
            border-color: #f5f3f3;
        }
        .contentstitle{
            width: 100%;
            background-color: #e7e7e7;
            text-align: right;
            font-size: 12px;
        }
        .moreBtn{
            text-align: right;
            font-size: 9px;
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
                                <c:set var="titlecount" value="0"/>
                                <c:forEach var="calendarTable" items="${calendarTables}">
                                    <c:if test="${i eq calendarTable.day}">
                                        <%--countTitle를 사용하여 title이 하나일때만 보여지고 하나 이상일 경우에는 hidden처리한다.--%>
                                        <c:set var="titlecount" value="${titlecount+1}"/>
                                        <c:choose>
                                            <c:when test="${titlecount == 1}">
                                                <div class="contentstitle" data-calendarnum="${calendarTable.calendarnum}" data-day="${calendarTable.day}" data-content="${calendarTable.content}">
                                                    <p id="showTitle${i}">${calendarTable.title}</p>
                                                </div>
                                            </c:when>
                                            <c:when test="${titlecount == 2}">
                                                <div class="moreBtn">more...</div>
                                            </c:when>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>
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

        <%--modal--%>
        <button type="button" data-target="#myModal" data-toggle="modal" style="display: none">Modal</button>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-calendar"/>&nbsp;${calBean.year}년 ${calBean.month+1}월 <span id="appear_day"></span>일</h4>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;" data-year="${calBean.year}" data-month="${calBean.month+1}" data-day="" data-calendarnum="">
                        <div class="form-group">
                            <label>&nbsp;<span class="glyphicon glyphicon-tag"></span>&nbsp;Title</label>
                            <input type="text" class="form-control" value="title" name="title" id="title"/>
                        </div>
                        <div class="form-group">
                            <label>&nbsp;<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Content</label>
                            <input type="text" class="form-control" value="content" name="content" id="content">
                        </div>
                        <button type="button" class="btn btn-default btn-block" id="contentsSaveBtn"><span class="glyphicon glyphicon-floppy-saved"/>&nbsp;Save</button>
                        <button type="button" class="btn btn-default btn-block" id="contentsUpdateBtn"><span class="glyphicon glyphicon-floppy-save"/>&nbsp;Update</button>
                        <button type="button" class="btn btn-default btn-block" id="contentsDaeleteBtn"><span class="glyphicon glyphicon-floppy-remove"/>&nbsp;Delete</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-block" data-dismiss="modal" id="modalCloseBtn"><span class="glyphicon glyphicon-log-out"/>&nbsp;Close</button>
                    </div>
                </div>

                <!-- Modal content-->
                <%--<div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="showModalDate">${calBean.year}년 ${calBean.month+1}월 <span id="appear_day"></span>일</h4>
                    </div>
                    <div class="modal-body" data-year="${calBean.year}" data-month="${calBean.month+1}" data-day="" data-calendarnum="">
                        　　 title : <input type="text" value="title" name="title" id="title"/><br>
                        contents : <input type="text" value="content" name="content" id="content"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="contentsSaveBtn">Save</button>
                        <button type="button" class="btn btn-default" id="contentsUpdateBtn">Update</button>
                        <button type="button" class="btn btn-default" id="contentsDaeleteBtn">Delete</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="modalCloseBtn">Close</button>
                    </div>
                </div>--%>
            </div>
        </div>



    </div>
    <script>
        $(document).ready(function () {

            //to show modal for inserting
            $("[id='appearDate']").click(function () {
                //to remove title and content
                $("#title").val("");
                $("#content").val("");
                //show modal
                $('#myModal').modal('show');
                //set save mode buttons
                btnControlShowSave();
            });

            //select one
            $(".contentstitle").click(function () {
                //check null
                if($(this) != null){
                    //show modal
                    $('#myModal').modal('show');

                    //get each data
                    var calendarnum=$(this).data("calendarnum");
                    var day=$(this).data("day");
                    var content=$(this).data("content");
                    var title=$.trim($(this).text());

                    $("#title").val(title);
                    $("#content").val(content);

                    $(".modal-body").data("day", day);
                    $(".modal-body").data("calendarnum", calendarnum);

                    btnControlShowUpdate_delete();

                    //날짜 일자 표시
                    $("#appear_day").text(day);
                }
            });
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

        //show Save Button, hide update, delete button
        function btnControlShowSave() {
            $("#contentsSaveBtn").show();
            $("#contentsUpdateBtn").hide();
            $("#contentsDaeleteBtn").hide();
        }
        //hide Save Button, show update, delete button
        function btnControlShowUpdate_delete() {
            $("#contentsSaveBtn").hide();
            $("#contentsUpdateBtn").show();
            $("#contentsDaeleteBtn").show();
        }

    </script>
</body>
</html>
