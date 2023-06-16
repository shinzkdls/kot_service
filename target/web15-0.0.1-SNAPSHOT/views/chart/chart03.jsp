<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

</style>
<script>
    let chart03 = {
        init:function(){
            this.getdata1();
            this.getdata2();
            this.getdata3();
        },
        getdata1:function(){
            $.ajax({
                url:'/chart0301',
                success:function(result){
                    chart03.display1(result);
                }
            });
        },
        getdata2:function(){
            this.display2();
        },
        getdata3:function(){
            this.display3();
        },
        display1:function(result){
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    data: result
                }]
            });

        },
        display2:function(result){
            Highcharts.chart('c2', {
                chart: {
                    type: 'cylinder',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }
                },
                title: {
                    text: 'Number of confirmed COVID-19'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.fhi.no/en/id/infectious-diseases/coronavirus/daily-reports/daily-reports-COVID19/"' +
                        'target="_blank">FHI</a>'
                },
                xAxis: {
                    categories: ['0-9', '10-19', '20-29', '30-39', '40-49', '50-59', '60-69', '70-79', '80-89', '90+'],
                    title: {
                        text: 'Age groups'
                    }
                },
                yAxis: {
                    title: {
                        margin: 20,
                        text: 'Reported cases'
                    }
                },
                tooltip: {
                    headerFormat: '<b>Age: {point.x}</b><br>'
                },
                plotOptions: {
                    series: {
                        depth: 25,
                        colorByPoint: true
                    }
                },
                series: [{
                    data: [95321, 169339, 121105, 136046, 106800, 58041, 26766, 14291,
                        7065, 3283],
                    name: 'Cases',
                    showInLegend: false
                }]
            });
        },
        display3:function(result){
            var defaultData = 'https://demo-live-data.highcharts.com/time-data.csv';
            var urlInput = document.getElementById('fetchURL');
            var pollingCheckbox = document.getElementById('enablePolling');
            var pollingInput = document.getElementById('pollingTime');

            function createChart() {
                Highcharts.chart('c3', {
                    chart: {
                        type: 'spline'
                    },
                    title: {
                        text: 'Live Data'
                    },
                    accessibility: {
                        announceNewData: {
                            enabled: true,
                            minAnnounceInterval: 15000,
                            announcementFormatter: function (allSeries, newSeries, newPoint) {
                                if (newPoint) {
                                    return 'New point added. Value: ' + newPoint.y;
                                }
                                return false;
                            }
                        }
                    },
                    data: {
                        csvURL: urlInput.value,
                        enablePolling: pollingCheckbox.checked === true,
                        dataRefreshRate: parseInt(pollingInput.value, 10)
                    }
                });

                if (pollingInput.value < 1 || !pollingInput.value) {
                    pollingInput.value = 1;
                }
            }

            urlInput.value = defaultData;

// We recreate instead of using chart update to make sure the loaded CSV
// and such is completely gone.
            pollingCheckbox.onchange = urlInput.onchange = pollingInput.onchange = createChart;

// Create the chart
            createChart();
        }
    };
    $(function(){
        chart03.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h3>CHART03</h3>
        <div class="row"  class="well">
            <div class="col-sm-4" id="c1"  class="well"></div>
            <div class="col-sm-4" id="c2"  class="well"></div>
            <div class="col-sm-4" id="c3"  class="well"></div>
        </div>
        <div class="ld-row">
            <label class="ld-label">
                Enable Polling
            </label>
            <input type="checkbox" checked="checked" id="enablePolling"/>
        </div>
        <div class="ld-row">
            <label class="ld-label">
                Polling Time (Seconds)
            </label>
            <input class="ld-time-input" type="number" value="2" id="pollingTime"/>
        </div>
        <div class="ld-row">
            <label class="ld-label">
                CSV URL
            </label>
            <input class="ld-url-input" type="text" id="fetchURL"/>
        </div>
    </div>
</div>
