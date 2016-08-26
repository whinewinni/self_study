
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

        tbody {
            background-color: black;
        }

        td {
            background-color: white;
            border-radius: 5px;
            padding: 5px;
        }

        #weekday{
            color: white;
        }

        #calendarTitle{
            color: white;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr id="calendarTitle">
                <th style="width: 80px"><a>←</a></th>
                <th colspan="5">날짜나올자리</th>
                <th><a>→</a></th>
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
        <tbody>
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
