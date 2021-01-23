<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>통계</title>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery.min.js"></script>
        <!-- google charts -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>

    <body>

        <h4>회원가입 통계</h4>
        <input type="date" id="fdate">~
        <input type="date" id="sdate">
        <input type="button" value="검색" id="chartsearch">
        <div id="chart_div" style="width: 100%; height: 500px;"></div>

    </body>

    <script>
    $(function(){
    	var today = new Date();
    	var year = today.getFullYear();
        var month = ("0" + (1 + today.getMonth())).slice(-2);
        var day = today.getDate()-7;
        var fdate = year + "-" + month + "-" + day;
        console.log(fdate);
        
    	var stoday = new Date();
    	var syear = stoday.getFullYear();
        var smonth = ("0" + (1 + stoday.getMonth())).slice(-2);
        var sday = ("0" + stoday.getDate()).slice(-2);
        var sdate = syear + "-" + smonth + "-" + sday;
        
        
        console.log(sdate);
        $("#fdate").val(fdate);
        $("#sdate").val(sdate);
    	$("#chartsearch").trigger('click');
    });
        $("#chartsearch").on('click', function() {
            var fdate = $("#fdate").val();
            var sdate = $("#sdate").val();
            var fdates = fdate.split("-");
           	var fy = fdates[0].substr(2,2);
           	var fm = fdates[1];
           	var fd = fdates[2];
           	var rfdate = fy + "/" + fm + "/" +fd;
           	
           	
            var sdates = sdate.split("-");
           	var sy = sdates[0].substr(2,2);
           	var sm = sdates[1];
           	var sd = parseInt(sdates[2])+1;
           	var rsdate = sy + "/" + sm + "/" +sd;
            console.log(rfdate+"~"+rsdate);
            $.ajax({
                url: "${pageContext.request.contextPath}/forchartTest.do",
                method: "POST",
                data: {
                    first_date: rfdate,
                    second_date: rsdate
                },
                success: function(chart, chartl) {
                	console.log(fdate+"~"+sdate);
                	console.log(chartl);
                    console.log("chart:m_jo"+chart[0].m_joindate);
                    console.log("chart:count"+chart[0].count);
                    var value = new Array();
                    for (var i = 0; i < chart.length; i++) {
                        value.push([chart[i].m_joindate, chart[i].count]);
                    }
                    console.log(value);
                    google.charts.load('current', {
                        'packages': ['corechart']
                    });
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {
                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'date1');
                        data.addColumn('number', 'count');
                        data.addRows(value);

                        var options = {
                            title: 'Register',
                            hAxis: {
                                title: 'Date',
                                titleTextStyle: {
                                    color: '#333'
                                }
                            },
                            vAxis: {
                                minValue: 0
                            }
                        };

                        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
                        chart.draw(data, options);
                    }
                },
                error: function(request, status, error) {
                    alert("code:" +
                        request.status +
                        "\n" +
                        "message:" +
                        request.responseText +
                        "\n" + "error:" +
                        error);
                }
            });
        });
    </script>

    </html>