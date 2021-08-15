
$(function() {
	
	var pre = ($("#pre").val().trim()).split("/");
	var preList = [];
	for( i=0; i<12 ;i++){
		if(pre[i])
			preList[i] = parseInt(pre[i]);
		else
			preList[i]=0;
	}
	
    Morris.Bar({
        element: 'maingraph',
        data: [{
                month: 'Jan',
                a: preList[0]
            }, {
                month: 'Feb',
                a: preList[1]
            }, {
                month: 'March',
                a: preList[2]
            }, {
                month: 'April',
                a: preList[3]
            }, {
                month: 'May',
                a: preList[4]
            }, {
                month: 'June',
                a: preList[5]
            }, {
                month: 'July',
                a: preList[6]
            }, {
                month: 'Aug',
                a: preList[7]
            }, {
                month: 'Sept',
                a: preList[8]
            },  {
                month: 'Oct',
                a: preList[9]
            }, {
                month: 'Nov',
                a: preList[10]
            }, {
                month: 'Dec',
                a: preList[11]
            }],
        xkey: 'month',
        ykeys: ['a'],
        labels: ['Attendance(%)'],
        barColors: ['#ef4238'],
        hideHover: 'auto',
        resize: true
    });


});
