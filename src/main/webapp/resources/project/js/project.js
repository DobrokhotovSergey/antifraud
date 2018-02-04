var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        //console.log('-->' + this.value.replace(/ /g,'') + '<--');
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value|| '';
        }
    });
    return o;
};
function block_screen() {
    $('<div id="screenBlock"></div>').appendTo('#content-main');
    $('#screenBlock').css( { opacity: 0.6, width: $(document).width(), height: $(document).height() } );
    $('#screenBlock').addClass('blockDiv');
    // $('#screenBlock').animate({opacity: 0.1}, 100);
}

function unblock_screen() {
    $('#screenBlock').animate({opacity: 0}, 200, function() {
        $('#screenBlock').remove();
    });
}
function beforeSend(){
    block_screen();
    NProgress.start();
}
function notifyAfterAjax(type, msg){
    var delay = 4000;
    if(type == 'danger'){
        delay = 100000;
    }
    new PNotify({
        delay: delay,
        history: false,
        title: 'Regular '+type,
        text: msg,
        type: type,
        styling: 'bootstrap3'
    });
}
function ajaxOnlineUsersChart(){
    $.ajax({
        type: "post",
        url: "/admin/ajax/getOnlineUsersChart",
        dataType: 'json',
        mimeType: 'application/json',
        success: function (data) {
            console.log(data);
            var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
            var pieChart = new Chart(pieChartCanvas);
            var PieData = data;
            var pieOptions = {
                    segmentShowStroke: true, //Boolean - Whether we should show a stroke on each segment
                    segmentStrokeColor: "#fff",                 //String - The colour of each segment stroke
                    segmentStrokeWidth: 2, //Number - The width of each segment stroke
                    percentageInnerCutout: 50,  //Number - The percentage of the chart that we cut out of the middle // This is 0 for Pie charts
                    animationSteps: 100, //Number - Amount of animation steps
                    animationEasing: "easeOutBounce",                    //String - Animation easing effect
                    animateRotate: true, //Boolean - Whether we animate the rotation of the Doughnut
                    animateScale: false, //Boolean - Whether we animate scaling the Doughnut from the centre
                    responsive: true, //Boolean - whether to make the chart responsive to window resizing
                    maintainAspectRatio: true, // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%>: <%}%><%= segments[i].value%> польз.</li><%}%></ul>"
        };
            var myChart  = pieChart.Doughnut(PieData, pieOptions);
            document.getElementById('legend').innerHTML = myChart.generateLegend();


        },
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
            beforeSend();
        },
        complete: function () {
            NProgress.done();
            unblock_screen();
        },
        error: function (xhr, status, error) {
            notifyAfterAjax('error','Sorry, but Graphics of Farms is not retrieve :(');
            console.log(xhr);
            console.log(status);
            console.log(error);
        }
    });
}