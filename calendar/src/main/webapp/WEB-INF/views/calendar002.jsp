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
            width: 90px;
            text-align: right;
        }

        #weekday {
            color: white;
        }

        #calendarTitle {
            color: white;
        }

        a {
            color: white;
            text-decoration: none;
        }

    </style>

    <script>
        window.onload = function () {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth();
            getCalendar(year, month);
            //getCalendar(2017, 3);
            document.getElementById('currentYear').value=year;
            document.getElementById('currentMonth').value=month;
        }
        function getCalendar(year, month) {
            month+=1;
            document.getElementById('showdate').innerHTML=year+"년 "+month+"월";
            var date = new Date(year+","+month+","+1); //날짜를 달의 첫번째 날로 설정
            var startWeekDay = date.getDay(); //1일의 요일을 구함
            //console.log(startWeekDay);

            var endOfMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            //규칙이 없는 달의 마지막 날을 배열로 넣어둠

            if ((year % 4 == 0) && (year % 100 != 0) || year % 400 == 0) {
                endOfMonth[1] = 29;
            } //윤년일 2월의 마지막 날을 29로 지정

            var calendarTag = "<tr>"; //calendarTag 변수를 선언해서 tr tag를 저장

            var weekDay = startWeekDay; //시작요일을 요일변수인 weekDay에 저장
            for (var empty = 0; empty < weekDay; empty++) {
                calendarTag += "<td></td>";
            } // weekDay에 요일까지 빈칸을 넣기 위함.

            for (var i = 1; i <= endOfMonth[month-1]; i++) { //1일부터 말일까지 반복
                if (weekDay == 7) { //요일이 토요일일 경우 다음 주를 얻어옴
                    calendarTag += "</tr><tr>";
                    weekDay = 0; //요일을 다시 일요일로 변경
                }
                calendarTag = calendarTag + '<td>' + i + '</td>';
                //tag사이에 날짜를 넣어줌
                weekDay++; //다음 요일로 변경
            }
            for (var empty = weekDay; empty <= 6; empty++) {
                calendarTag += "<td></td>";
            } //말일 후에 빈 칸을 넣음
            calendarTag += "</tr>"; //tbody tag 종료.

            var tbody_tag = document.getElementById("tbody");
            //tbody tag 객체를 id로 가지고와서 tbody_tag에 저장
            tbody_tag.innerHTML = calendarTag; //tbody_tag에 calendarTag변수를 넣어준다.
        }
        function otherMonth(identifier) { //identifier로 전달인지, 다음달인지 구분함.
            var month=document.getElementById('currentMonth').value;
            var year=document.getElementById('currentYear').value;
            //input tag에 저장된 값을 변수에 가져옴.

            if(identifier==1){  //이전달 선택
                if(month==0){ //1월일 경우 year는 전년도로 -1, month는 12월달로 변경
                    year-=1;
                    month=11;
                }else { //1월이 아닐경우에는 -1함.
                    month=parseInt(month)-1;
                }
            }else if(identifier==2){ //다음달 선택
                if (month==11){ //12월일 경우 year는 다음년도로, month는 1월로 변경함
                    year=parseInt(year)+1;
                    month=0;
                }else{ //12월이 아닐 경우에는 다음달로 넘김,
                    month=parseInt(month)+1;
                }
            }
            document.getElementById('currentMonth').value=month;
            document.getElementById('currentYear').value=year;
            //input tag에 달력에 현재 표시되는 년과 달을 넣어둠
            getCalendar(year, month); //다른 달을 표시하기 위해 call
        }
    </script>

</head>
<body>
    <%--현재 표시되는 년과 달을 tag에 넣어둠 달력이 넘어갈 때 사용하기 위함--%>
    <input type="text" id="currentYear">
    <input type="text" id="currentMonth">
<table>
    <thead>
    <tr id="calendarTitle">
        <th><a href="#" onclick="otherMonth(1)">←</a></th>
        <th colspan="5" id="showdate">날짜나올자리</th>
        <th><a href="#" onclick="otherMonth(2)">→</a></th>
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
    <tbody id="tbody">
    <%--<tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>--%>
    </tbody>
</table>

</body>
</html>