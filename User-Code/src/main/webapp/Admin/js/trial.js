$(function() {
	
	var m1 = ($("#att").val().trim()).split("/");
	var monthList = [];
	for( i=0; i<12 ;i++){
		if(m1[i])
			monthList[i] = parseInt(m1[i]);
		else
			monthList[i]=0;
	}
	
	var work = ($("#working").val().trim()).split("/");
	var workList = [];
	for( i=0; i<12 ;i++){
		if(work[i])
			workList[i] = parseInt(work[i]);
		else
			workList[i]=0;
	}
	


Morris.Bar({
        element: 'morris-bar-chart-2',
        data: [{
                y: 'Jan',
                a: monthList[0],
                b: (workList[0] - monthList[0])
            }, {
                y: 'Feb',
                a: monthList[1],	
                b:(workList[1] - monthList[1])
            }, {
                y: 'Mar',
                a: monthList[2],
                b: (workList[2] - monthList[2])
            }, {
                y: 'Apr',
                a: monthList[3],
                b: (workList[3] - monthList[3])
            }, {
                y: 'May',
                a: monthList[4],
                b: (workList[4] - monthList[4])
            }, {
                y: 'Jun',
                a: monthList[5],
                b: (workList[5] - monthList[5])
            }, {
                y: 'Jul',
                a: monthList[6],
                b: (workList[6] - monthList[6])
            }, {
                y: 'Aug',
                a: monthList[7],
                b: (workList[7] - monthList[7])
            }, {
                y: 'Sep',
                a: monthList[8],
                b: (workList[8] - monthList[8])
            }, {
                y: 'Oct',
                a: monthList[9],
                b: (workList[9] - monthList[9])
            }, {
                y: 'Nov',
                a: monthList[10],
                b: (workList[10] - monthList[10])
            }, {
                y: 'Dec',
                a: monthList[11],
                b: (workList[11] - monthList[11])
            }],	
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Present Days', 'Absent Days'],
        barColors:['steelblue','#ef4238'],
        hideHover: 'auto',
        resize: true
});
        
    });