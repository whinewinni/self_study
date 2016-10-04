
<%--
  Created by IntelliJ IDEA.
  User: Winni
  Date: 2016-10-03
  Time: 오전 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <%--star Table tr--%>
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
                                        <div class="contentstitle">
                                            <p id="showTitle${i}">${listAll.title}</p>
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


                <%--end of Table tr--%>
                </tr>
            </tbody>
            <%--add buttons later.--%>
            <%--<tfoot>
                <tr>
                    <td colspan="7"></td>
                </tr>
            </tfoot>--%>
        </table>


        <button type="button" data-target="#myModal" data-toggle="modal" style="display: none">Modal</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog" >
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="showModalDate">날짜표시</h4>
                    </div>
                    <div class="modal-body">
                        <div style="background-color: cornsilk">
                            year : <input type="text" value="${calBean.year}" name="year" id="v_year"/><br>
                            month : <input type="text" value="${calBean.month+1}" name="month" id="v_month"/><br>
                            day : <input type="text" value="" name="day" id="nowday"/><br>
                            calendarnum : <input type="text" value="" id="calendarnum" name=""/><br>
                        </div>
                       　　 title : <input type="text" value="title" name="title" id="title"/><br>
                        contents : <input type="text" value="content" name="content" id="content"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="contentsSaveBtn" style="visibility: visible">Save</button>
                        <button type="button" class="btn btn-default" id="contentsUpdateBtn" style="display: none">Update</button> <%--mydiv.style.visibility = "visible";--%>
                        <button type="button" class="btn btn-default" id="contentsDaeleteBtn" style="display: none">Delete</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="modalCloseBtn">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <%-------------------------------------------------Testing CODE-----------------------------------------------------%>
        <div style="display: none">
            <form action="saveTestRequestMapping" method="post">
                <input type="text" name="title" value=""/>
                <input type="text" name="content" value=""/>
                <button type="submit" value="Btn">Btn</button>
            </form>
        </div>

        <div style="display: none">
            ${TestList.title}<br>
            ${TestList.content}<br>
            ${TestList.scheduleTime}<br>
        </div>
    </div>
    <%------------------------------------------------------------------------------------------------------------------%>

    <script>

        $(document).ready(function () {
            //SELECT ONE

            $(document).on('click', '.contentstitle',function () {
                if ($(this).text()!=null){
                    //show modal
                    $('#myModal').modal('show');

                    //change modal title and content
                    $("#title").val($.trim($(this).text()));
                    $("#content").val($(this).children().eq(1).val());
                    $("#calendarnum").val($(this).children().eq(2).val());
                    $("#nowday").val($(this).children().eq(3).val());

                    $("#contentsSaveBtn").attr('style', 'display: none');
                    $("#contentsUpdateBtn").attr('style', 'visibility: visible');
                    $("#contentsDaeleteBtn").attr('style', 'visibility: visible');

                    //to operate month
                    var showMonth=parseInt($("#v_month").val())+1;
                    $("#showModalDate").text($("#v_year").val()+"-"+showMonth+"-"+showDay);
                }
            });

            /*$(".contentstitle").click(function () {
                if ($(this).text()!=null){
                    /!*alert($.trim($(this).text()));*!/

                    //show modal
                    $('#myModal').modal('show');

                    //change modal title and content
                    $("#title").val($.trim($(this).text()));
                    $("#content").val($(this).children().eq(1).val());
                    $("#calendarnum").val($(this).children().eq(2).val());
                    $("#nowday").val($(this).children().eq(3).val());

                    $("#contentsSaveBtn").attr('style', 'display: none');
                    $("#contentsUpdateBtn").attr('style', 'visibility: visible');
                    $("#contentsDaeleteBtn").attr('style', 'visibility: visible');

                    //to operate month
                    var showMonth=parseInt($("#v_month").val())+1;
                    $("#showModalDate").text($("#v_year").val()+"-"+showMonth+"-"+showDay);

                }
            });*/

            $("#modalCloseBtn").click(function () {
                $("#contentsSaveBtn").attr('style', 'visibility: visible');
                $("#contentsUpdateBtn").attr('style', 'display: none');
                $("#contentsDaeleteBtn").attr('style', 'display: none');
            });

            $("#contentsDaeleteBtn").click(function () {
                var day=$("#nowday").val();
                var calendarnum=$("#calendarnum").val();
                $.ajax({
                    /*type:'get',*/
                    url:'/deletecontent',
                    data: {calendarnum : calendarnum},
                    success:function () {
                        alert("DONE delete");
                        $('#myModal').modal('hide');
                        $("#showTitle"+day).html("");
                    },
                    error:function (e) {
                        console.log("DELETE Error - > " +e.responseText);
                    }
                });
            });

            $("#contentsUpdateBtn").click(function () {
                var year=$("#v_year").val();
                var month=$("#v_month").val();
                var day=$("#nowday").val();
                var title=$("#title").val();
                var content=$("#content").val();
                var calendarnum=$("#calendarnum").val();

                $.ajax({
                    type:'post',
                    url:'/updateContent',
                    data : {
                        year : year,
                        month :month,
                        day :day,
                        title : title,
                        content : content,
                        calendarnum :calendarnum
                    },
                    success:function () {
                        /*alert(str);*/

                        $("#contentsSaveBtn").attr('style', 'visibility: visible');
                        $("#contentsUpdateBtn").attr('style', 'display: none');
                        $("#contentsDaeleteBtn").attr('style', 'display: none');

                        $('#myModal').modal('hide');

                        $("#showTitle"+day).html(title);

                    },
                    error:function (e) {
                        console.log("UPDATE Error - > " +e.responseText);
                    }
                });
            });


            //SAVE
            $("#contentsSaveBtn").click(function () {

                $("#contentsSaveBtn").attr('style', 'visibility: visible');
                $("#contentsUpdateBtn").attr('style', 'display: none');
                $("#contentsDaeleteBtn").attr('style', 'display: none');

                //get each value
                var year=$("#v_year").val();
                var month=$("#v_month").val();
                var day=$("#nowday").val();
                var title=$("#title").val();
                var content=$("#content").val();

                /*alert(year+" / "+month+" "+day+" "+title+" "+content);*/

                //ajax - updating parts of a web page, without reloading the whole page
                $.ajax({
                    type :'post',
                    url: '/saveContents',  /*'/'이거 줘야함*/
                    data:{
                        year : year,
                        month :month,
                        day :day,
                        title : title,
                        content : content
                    },
                    success:function (calendarNum_seq) {
                        /*console.log("calendarNum_seq = " + calendarNum_seq);*/
                        //Sequence Number
                        /*alert(calendarNum_seq);*/

                        //hide modal
                        $('#myModal').modal('hide');

                        var intoHtml="<div class='contentstitle'><p id='showTitle"+day+"'>"+title+"</p><input type='hidden' value='"+content+"'/>" +
                                "<input type='hidden' value='"+calendarNum_seq+"'/><input type='hidden' value='"+day+"'></div>";
                        $("#appearTitle"+day).append(intoHtml);
                        /*$("#showTitle"+day).html(title);*/





                        /*
                                 /!*$("#v_year").val(year);
                        $("#v_month").val(month);
                        $("#nowday").val(day);
                        $("#title").val(title);
                        $("#content").val(content);*!/
*/


                    },
                    error:function (e) {
                        console.log("SAVE Error - > " +e.responseText);
                    }
                });
            });

            //to show modal
            $('[id="appearDate"]').click(function () {
                console.log($(this).text());

                //to remove space
                var showDay=$.trim($(this).text());
                //get only day(i) value   //using split, [0] is first value
                showDay=showDay.split(" ")[0];

                $("#nowday").val(showDay);
                //to remove title and content
                $("#title").val("");
                $("#content").val("");

                //show modal
                $('#myModal').modal('show');

                //to operate month
                var showMonth=parseInt($("#v_month").val())+1;
                $("#showModalDate").text($("#v_year").val()+"-"+showMonth+"-"+showDay);
            });

            //today style
            $("tbody tr td").each(function (index, element) {
                //if calBean.day and "day(i)" are same, add style
                if ($(element).text()==${calBean.day}){
                    $(element).addClass("todayStyle");
                }
            });

            //mouse over style each day
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
