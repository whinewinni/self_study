<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <script>
        function getCalendar(nowYear, nowMonth) {
            setClear(); //table안에 내용을 지움
            var date = new Date();
            //var nowYear=date.getFullYear(); //현재 년도
            //1년 1월 1일 부터 전년도 말일까지의 일수를 구함.
            //var allDate= parseInt((nowYear-1)*365) + parseInt((nowYear-1)/4) + parseInt((nowYear-1)/400) - parseInt((nowYear-1)/100);
            //var total = parseInt((year-1)*365 + (year-1)/4 + (year-1)/400 -(year-1)/100);
            //var allDate=parseInt(((nowYear-1)*365) + ((nowYear-1)/4) + ((nowYear-1)/400) - ((nowYear-1)/100));
            var allDate= parseInt((nowYear-1)*365) + parseInt((nowYear-1)/4) + parseInt((nowYear-1)/400) - parseInt((nowYear-1)/100);
            /*
             4로 나누어 떨어지는 해는 윤년(2004년, 2008년, 2012년…)
             이 중100으로 나누어 떨어지는 해는 평년(2100년, 2200년, 2300년…)
             그 중에 400으로 나누어 떨어지는 해는 윤년(1600년, 2000년, 2400년 …)
             */
            var getNowYearDay=0; //올해 1월 1일부터 현재까지 일수
            var monthArray=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            //30, 31일 같은 규칙없는 날을 위한 배열 선언,
            if ( (nowYear%4==0) && (nowYear%100!=0) || nowYear%400==0 ){
                monthArray[1]=29;
            } //윤년일 경우 하루를 추가함
            //var nowMonth=date.getMonth();
            for(var i=0 ; i<nowMonth ; i++){
                getNowYearDay += monthArray[i];
            } //전달 말일까지의 일수를 구함.
            var calendar=document.getElementById("calendar");
            //tbody의 id caleandar 객체를 calendar에 저장
            var weekOfDay=(allDate+getNowYearDay)%7+1; //시작 요일
            //전달의 마지막 요일에 1을 추가하여, 이번달 시작 요일을 weekOfDay에 저장.
            var numberOfWeek=0; //몇번째 주인지 확인하는 변수
            for(var i=1 ; i<=monthArray[nowMonth] ; i++){ //1일 부터 이번달의 마지막 일까지 반복
                if (weekOfDay==7){
                    weekOfDay=0; //토요일일 경우 일요일로 변경
                    numberOfWeek=numberOfWeek+1; // 요일이 넘어가면서 주를 다음주로 변경
                }
                calendar.rows[numberOfWeek].cells[weekOfDay].innerHTML=i; //tbody에 1~30/31일까지 수를 채워줌
                weekOfDay=weekOfDay+1; //요일을 하루씩 다음일로 증가함
            }
            document.getElementById('showDate').innerHTML =  nowYear +" / "+(parseInt(nowMonth)+1);
            //달력 상단에 표시되는 년과 월을 보여줌. (달이 넘어갈 경우, 함께 변경해주기 위함)
        }
        window.onload=function () { // 페이지 로딩 후, 함수 호출
            var date=new Date();
            var month=date.getMonth();
            var year=date.getFullYear();
            getCalendar(year, month);
            document.getElementById('currentYear').value=year;
            document.getElementById('currentMonth').value=month;
            //달과 년 변경시 필요한 값을 HTML input tag에 저장
        }
        function otherMonth(distinguishMonth) {
            var month=document.getElementById('currentMonth').value;
            var year=document.getElementById('currentYear').value;
            //HTML input tag에 저장된 값을 변수에 저장
            if (distinguishMonth==1){
                if (month==0){
                    month=11;
                    year=year-1;
                }else {
                    month=parseInt(month)-1;
                }
            }else if(distinguishMonth==2){
                if (month==11){
                    month=0;
                    year=parseInt(year)+1;
                }else {
                    month=parseInt(month)+1;
                }
            } //1일 경우 이전달, 2인 경우에는 다음달을 저장
            document.getElementById('currentMonth').value=month;
            document.getElementById('currentYear').value=year;
            //변경된 month와 year 값을 input tag에 저장함.
            getCalendar(year, month); //변경된 달력을 호출
        }
        function setClear() {
            for(var i=0; i<=5 ; i++){
                for(var j=0; j<=6 ; j++){
                    document.getElementById("calendar").rows[i].cells[j].innerHTML="";
                    //table 안에 남아있는 기존 데이터를 지움
                }
            }
        }
    </script>

</head>
<body>

<input type="text" id="currentYear">
<input type="text" id="currentMonth">

<table style="height: 300px ; width: 600px">
    <thead style="background-color: #d3ffe6">
    <tr style="text-align: center">
        <td><a href="#" onclick="otherMonth(1)">←</a></td>
        <td colspan="5" id="showDate"></td>
        <td><a href="#" onclick="otherMonth(2)">→</a></td>
    </tr>
    <tr>
        <th>Sunday</th>
        <th>Monday</th>
        <th>Tuesday</th>
        <th>Wednesday</th>
        <th>Thursday</th>
        <th>Friday</th>
        <th>Saturday</th>
    </tr>
    </thead>

    <tbody id="calendar">
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    </tbody>

</table>
</body>
</html>