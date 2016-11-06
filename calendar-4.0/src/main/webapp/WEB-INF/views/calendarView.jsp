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
            width: 110px;
            height:85px;
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
            background-color: #cde4de;
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
        .moreBtn, .contentstitle{
            cursor: pointer;
        }
        .list-group-item-text{
            font-color: #b1b1b1;
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
                            <div id="appearDate" style="height: 50%" data-day="${i}">
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
                                                <div class="contentstitle" id="contentstitle${i}" data-calendarnum="${calendarTable.calendarnum}" data-day="${calendarTable.day}" data-content="${calendarTable.content}">
                                                    <p id="showTitle${i}">${calendarTable.title}</p>
                                                </div>
                                            </c:when>
                                            <c:when test="${titlecount == 2}">
                                                <div class="moreBtn" id="moreBtn${i}" data-day="${calendarTable.day}">more...</div>
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
                    <div class="modal-body" id="modal-body" style="padding:40px 50px;" data-year="${calBean.year}" data-month="${calBean.month+1}" data-day="" data-calendarnum="">
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
            </div>
        </div>

        <%--List Modal--%>
        <button type="button" data-target="#ListModal" data-toggle="modal" style="display: none">Modal</button>
        <div class="modal fade" id="ListModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close closeResetList" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-calendar"/>&nbsp;${calBean.year}년 ${calBean.month+1}월 <span id="list_modal_appear_day"></span>일</h4>
                    </div>
                    <div class="modal-body" id="listModalBody" style="padding:15px 15px;" data-year="${calBean.year}" data-month="${calBean.month+1}" data-day="" data-calendarnum="">
                        <div class="list-group" id="listModalContentList">
                            <%--이런 모양으로 content를 불러온다. 내용들이 나올 자리임
                                <a href="#" class="list-group-item ">
                                <h5 class="list-group-item-heading">List group item heading</h5>
                                <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                            </a>--%>
                        </div>
                        <button type="button" class="btn btn-default btn-block"><span class="glyphicon glyphicon-floppy-saved" id="createNewBtn"/>&nbsp;새글</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-block closeResetList" data-dismiss="modal"><span class="glyphicon glyphicon-log-out"/>&nbsp;Close</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
        $(document).ready(function () {

            //create new from list modal
            $("#createNewBtn").click(function () {
                $('#ListModal').modal('hide');
                $('#myModal').modal('show');
                btnControlShowSave();

                //to remove title and content
                $("#title").val("");
                $("#content").val("");

                //to set day
                $("#appear_day").text($("#list_modal_appear_day").text());
                $("#modal-body").data("day", $("#list_modal_appear_day").text());
            });

            //update
            $("#contentsUpdateBtn").click(function () {
                /*$(document).on("click", "#contentsUpdateBtn", function (){*/

                //hide modal
                $('#myModal').modal('hide');

                var title=$("#title").val();
                var content=$("#content").val();
                var year=${calBean.year};
                var month=${calBean.month+1};
                var day=$("#appear_day").text();
                var calendarnum=$("#modal-body").data("calendarnum");

                $.ajax({
                    type:'post',
                    url:'/updateContent',
                    data:{
                        title: title,
                        content:content,
                        year: year,
                        month: month,
                        day: day,
                        calendarnum:calendarnum
                    },
                    success:function (msg) {

                        //hide modal
                        $('#myModal').modal('hide');

                        $("#showTitle"+day).html(title);
                        /*$("#contentstitle"+day).data("calendarnum", calendarnum);
                        $("#contentstitle"+day).data("day", day);*/
                        alert($("#contentstitle"+day).data("content"));
                        $("#contentstitle"+day).data("content", content);
                        alert($("#contentstitle"+day).data("content"));
                        /*$(document).on("data", "#contentstitle"+day, )*/

                    },
                    error: function (e) {
                        console.log("SAVE Error - >"+e.responseText);
                    }
                });
            });

            //Save
            $("#contentsSaveBtn").click(function () {
                //hide modal
                $('#myModal').modal('hide');

                var title=$("#title").val();
                var content=$("#content").val();
                var year=${calBean.year};
                var month=${calBean.month+1};
                var day=$("#appear_day").text();

                $.ajax({
                    type:'post',
                    url:'/saveContent',
                    data:{
                        title: title,
                        content:content,
                        year: year,
                        month: month,
                        day: day
                    },
                    success:function (calendarNum_seq) {
                        //hide modal
                        $('#myModal').modal('hide');

                        console.log("hasClass : "+$("#appearTitle"+day ).children().hasClass("contentstitle"));


                        var intoHtml=$("#appearTitle"+day).html();
                        //if appearTitle has contentstitle class, add title and more button
                        if($("#appearTitle"+day ).children().hasClass("contentstitle") && $("#appearTitle"+day ).children().hasClass("moreBtn")){
                            intoHtml+="";
                        }else if( $("#appearTitle"+day ).children().hasClass("contentstitle") ){
                            intoHtml+="<div class='moreBtn' data-day="+ day +" > more...</div>";
                        }else {
                            intoHtml+="<div class='contentstitle' id='contentstitle"+day+"' data-calendarnum='"+calendarNum_seq+"' data-day='"+day+"' data-content='"+content+"'>"+
                                    "<p id='showTitle"+day+"'>"+title+"</p></div>";
                        }

                        $("#appearTitle"+day).html(intoHtml);

                    },
                    error: function (e) {
                        console.log("SAVE Error - >"+e.responseText);
                    }
                });

            });

            //to show modal for inserting
            $("[id='appearDate']").click(function () {

                $("#appear_day").text($.trim($(this).text()));

                //to remove title and content
                $("#title").val("");
                $("#content").val("");
                //show modal
                $('#myModal').modal('show');
                //set save mode buttons
                btnControlShowSave();
            });

            //List Modal
            $(document).on('click', '.moreBtn',function () {
            //$(".moreBtn").click(function () {

                // to show modal
                $('#ListModal').modal('show');

                //get day
                var list_modal_day=$(this).data("day");

                //list modal에 날짜 찍기
                $("#list_modal_appear_day").text(list_modal_day);

                $.ajax({

                    url : "getListModalCalendarDomainList",
                    type: "post",
                    dataType : "json",

                    data : {
                        day : list_modal_day,
                        month : $("#listModalBody").data("month"),
                        year : $("#listModalBody").data("year")
                    },

                    success : function (json) {
                        console.log(json);

                        var listModalContent="";

                        $.each(json, function (index, item) {
                            console.log(item.title);
                            console.log(item.content);
                            console.log(item.calendarnum);
                            listModalContent+="<a href='#' class='list-group-item' data-day='"+item.day+"' data-title='"+item.title+"' data-content='"+item.content+"' data-calendarnum='"+item.calendarnum+"'>"+
                                                    "<h5 class='list-group-item-heading'><b>"+item.title+"</b></h5>"+
                                                    "<p class='list-group-item-text'>"+item.content+"</p>"+
                                                "</a>";
                        }); //end each
                        $("#listModalContentList").html(listModalContent);
                    } //end success
                });
            });

            //select one from list Modal
            $(document).on("click", ".list-group-item", function () {
                // to hide modal
                $('#ListModal').modal('hide');
                //show modal
                $('#myModal').modal('show');

                btnControlShowUpdate_delete();

                var v_day=$(this).data("day");
                var v_title=$(this).data("title");
                var v_content=$(this).data("content");
                var v_calendarnum=$(this).data("calendarnum");

                //각각 모달에 넣어줌
                $("#title").val(v_title);
                $("#content").val(v_content);
                $("#appear_day").text(v_day);
                $("#modal-body").data("calendarnum", v_calendarnum);
                $("#modal-body").data("day", v_day);
            });

            //리스트에서 selete one으로 보낼 경우,
            /* $(".list-group-item").click(function () {

                // to hide modal
                $('#ListModal').modal('hide');
                //show modal
                $('#myModal').modal('show');

                btnControlShowUpdate_delete();

                var v_day=$(this).data("day");
                var v_title=$(this).data("title");
                var v_content=$(this).data("content");
                var v_calendarnum=$(this).data("calendarnum");

                $("#title").val(v_title);
                $("#content").val(v_content);
                $("#appear_day").val(v_day);
                $("#modal-body").data("calendarnum", v_calendarnum);
            });*/

            //Delete
            $("#contentsDaeleteBtn").click(function () {
                var day=$("#modal-body").data("day");
                alert(" delete day == "+day)
                $.ajax({
                    url : '/deletecontent/'+ $("#modal-body").data("calendarnum"),
                    success:function (outcomeMsg) {
                        console.log(outcomeMsg);
                        $('#myModal').modal('hide');
                        /*$("#showTitle"+day).html("");*/

                        /*두개가 있다가 하나가 지워지는 경우, */
                        /*두개 이상일때 하나가 지워지는 경우*/

                        /*밖에 title*/
                        var outsideTitleCalNum=$("#contentstitle"+day).data("calendarnum");
                        var insideTitleCalNum=$("#modal-body").data("calendarnum");
                        console.log("outsideTitleCalNum "+outsideTitleCalNum)
                        console.log("insideTitleCalNum "+insideTitleCalNum)

                        var secondTitleInListModal=$("#listModalContentList").children().eq(1);
                        alert("1");
                        //밖에 title과 안에 title의 seq num가 같을 경우
                        if(outsideTitleCalNum == insideTitleCalNum){
                            alert("2");
                            //List Modal이 가지고 있는 title의 수가 2개 이상일 경우
                            if($("#listModalContentList").children().size() >= 2){
                                alert("3");
                                $("#contentstitle"+day).data("calendarnum", secondTitleInListModal.data("calendarnum"));
                                $("#contentstitle"+day).data("day", secondTitleInListModal.data("day"));
                                $("#contentstitle"+day).data("content", secondTitleInListModal.data("content"));
                                $("#showTitle"+day).html(secondTitleInListModal.data("title"));
                            }else {
                                //List Modal의 title이 0일 경우
                                $("#showTitle"+day).html("");
                            }
                        }

                        //2개일 경우에서 하나를 지우면 more button remove
                        if($("#listModalContentList").children().size() == 2){
                            $("#moreBtn"+day).remove();
                        }

                    },
                    error:function (e) {
                        console.log("DELETE Error - > " +e.responseText);
                    }
                });
            });

            //select one
            $(document).on('click', '.contentstitle',function () {
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

                    $("#modal-body").data("day", day);
                    $("#modal-body").data("calendarnum", calendarnum);

                    btnControlShowUpdate_delete();

                    //날짜 일자 표시
                    $("#appear_day").text(day);
                }
            });

            //reset List Modal for deleting
            $(".closeResetList").click(function () {
                $("#listModalContentList").html("");
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
