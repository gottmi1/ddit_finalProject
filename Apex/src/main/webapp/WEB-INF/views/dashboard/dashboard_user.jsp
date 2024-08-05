<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Fullcalendar js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/fullcalendar/index.global.min.js"></script>
	<div class="row">
	     <div class="col-12">
	         <div class="page-title-box ">
	              <h4 class="page-title">대시보드</h4>
	         </div>
	     </div>
	</div>
	<!-- end page title -->
	<div class="row">
		<div class="col-md-6 col-xl-3">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-12 text-center">
							<i class="ri-checkbox-circle-line text-muted font-24"></i>
							<h3 class="my-2 py-1 text-success">${doneWorks }</h3>
							<h5 class="text-muted fw-normal mt-0 text-truncate"
								title="Campaign Sent">완료된 작업</h5>
						</div>
					</div>
					<!-- end row-->
				</div>
				<!-- end card-body -->
			</div>
			<!-- end card -->
		</div>
		<!-- end col -->
	
		<div class="col-md-6 col-xl-3">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-12 text-center">
							<i class="ri-file-list-3-line text-muted font-24"></i>
							<h3 class="my-2 py-1 text-warning">${noDoneWorks }</h3>
							<h5 class="text-muted fw-normal mt-0 text-truncate"
								title="New Leads">미완료 작업</h5>
						</div>
					</div>
					<!-- end row-->
				</div>
				<!-- end card-body -->
			</div>
			<!-- end card -->
		</div>
		<!-- end col -->
		<div class="col-md-6 col-xl-3">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-12 text-center">
							<i class="ri-alert-line text-muted font-24"></i>
							<h3 class="my-2 py-1 text-danger">${lateWorks }</h3>
							<h5 class="text-muted fw-normal mt-0 text-truncate" title="Deals">마감일이 지난 작업</h5>
						</div>
					</div>
					<!-- end row-->
				</div>
				<!-- end card-body -->
			</div>
			<!-- end card -->
		</div>
		<!-- end col -->
	
		<div class="col-md-6 col-xl-3">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-12 text-center">
							<i class="ri-briefcase-line text-muted font-24"></i>
							<h3 class="my-2 py-1 text-primary">${allWorks}</h3>
							<h5 class="text-muted fw-normal mt-0 text-truncate"
								title="Booked Revenue">총 작업</h5>
						</div>
					</div>
					<!-- end row-->
				</div>
				<!-- end card-body -->
			</div>
			<!-- end card -->
		</div>
		<!-- end col -->
	</div>
	<!-- end row -->
	
	<div class="row">
		<div class="col-lg-6">
			<div class="card">
				<div
					class="card-header d-flex justify-content-between align-items-center">
					<h4 class="header-title"><a href="/board/list" class="text-muted">자유게시판</a></h4>
				</div>
				
				<c:forEach items="${boardList }" var="list">
				
					<div class="card-body py-2">
						 <div class="row borderBtm">
	                            <div class="col-sm-8">
	                                <div class="form mb-0">
	                                    	<a href="/board/detail?boNo=${list.boNo }" class="fw-bold">
	                                        	${list.boTitle }
	                                    	</a>
	                                </div> <!-- end checkbox -->
	                            </div> <!-- end col -->
	                            <div class="col-sm-4">
	                                <div class="d-flex justify-content-between">
	                                    <div>
	                                        <ul class="list-inline font-13 text-end">
	                                            <li class="list-inline-item">
	                                                <i class='uil uil-schedule font-16 me-1'></i> ${list.boDateStr }
	                                            </li>
	                                            <li class="list-inline-item ms-1">
	                                                <i class='uil uil-align-alt font-16 me-1'></i> ${list.boWriter }
	                                            </li>
	                                        </ul>
	                                    </div>
	                                </div> <!-- end .d-flex-->
	                            </div> <!-- end col -->
	                       </div>
					</div>
				</c:forEach>
	
				<!-- end card body-->
			</div>
			<!-- end card -->
		</div>
		<div class="col-lg-6">
			<div class="card">
				<div
					class="card-header d-flex justify-content-between align-items-center">
					<h4 class="header-title"><a href="/calendar/home" class="text-muted">캘린더</a></h4>
				</div>
				<div class="card-body d-flex justify-content-center" id="calendar" style="min-height: 700px">
				</div>
			</div>
			<!-- end card -->
		</div>
	
		<!-- end col-->
	</div>
	<!-- end row-->
	
	
	<div class="row">
		<div class="col-lg-6">
			<div class="card">
				<div
					class="card-header">
					<h4 class="header-title">소속프로젝트(이동하기)</h4>
				</div>
					<c:forEach items="${projectList }" var="list">
				
					<div class="p-2">
						 <div class="row">
	                            <div class="col-sm-12">
	                                <div class="form mb-0">
<!-- 	                                    <label class="form-label" for="task1"> -->
                                        	<li class="list-group-item" data-proNo="${list.proNo}"><a href="#" class="sessionInputProNo btn btn-outline-success rounded-pill">${list.proName}</a></li>
<!-- 	                                    </label> -->
	                                </div> <!-- end checkbox -->
	                            </div> <!-- end col -->
	                       </div>
					</div>
				</c:forEach>
			</div>
			<!-- end card -->
		</div>
		<div class="col-lg-6">
			<div class="card">
				<div
					class="card-header d-flex justify-content-between align-items-center">
					<h4 class="header-title">총 작업 수(완료 상태별)</h4>
				</div>
				<div class="card-body d-flex justify-content-center">
					<canvas id="doughnut-chart"></canvas>
				</div>
			</div>
			<!-- end card -->
		</div>
	</div>
	
<!-- end row-->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	
	var allDayFlag;
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	googleCalendarApiKey : 'AIzaSyCQsW-cxbfMpXw2lmX_aPbci-0NYG6jwhU',
    	eventSources:[
    		{
    			googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
    				className : 'ko_event',
    				color : 'white',
    				textColor : 'red'
    		}
    	],
        headerToolbar: {
            left: 'prev,next,today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        height : '500',
        locale: 'ko',
        navLinks: true,
        selectable: true,
        editable: true,
        droppable: true,
        eventAdd: function() {
            console.log("하");
        },
//         dayCellDidMount: function(info) {
//             var day = info.date.getDay();
//             if (day === 0) { // 일요일
//                 info.el.style.backgroundColor = '#EDF1EF'; // 원하는 색상으로 변경
//             } else if (day === 6) { // 토요일
//                 info.el.style.backgroundColor = '#EDF1EF'; // 원하는 색상으로 변경
//             }
//         },
        select: function(info) {
			info.revert();
             
        },
        events: function(fetchInfo, callback, failureCallback) {
            $.ajax({
                url: "/calendar/events.do",
                type: "get",
                contentType: "application/json;charset=utf-8",
                success: function(res) {
                	var events=[];
                   for(i=0; i<res.length; i++){
                	   
                	   
                	   var isAllDay = res[i].allday === 'true'
                	   if(isAllDay){
                	   console.log("allDay : "+isAllDay)
                		   events.push({
                			 id : res[i].id,
  	                		 title : res[i].title,
  	                		 start : res[i].startdate,
  	                		 end : res[i].enddate,
  	                		 backgroundColor : res[i].textColor,
  	                		 allDay : isAllDay,
  	                		durationEditable: true
                		   });
                	   }else{
                	   console.log("allDay : "+isAllDay)
	                	   events.push({
	                		 id : res[i].id,
	                		 title : res[i].title,
	                		 start : res[i].startdate,
	                		 end : res[i].enddate,
	                		 backgroundColor : res[i].textColor,
	                		 allDay : isAllDay,
	                		 durationEditable: true
	                	   });
                	   }
                	   
                	   
                	   
                   }
                   callback(events)
                   
                },
                error: function(xhr) {
                	failureCallback(xhr);
                    console.log(xhr.status);
                }
            });
        },
        eventDidMount: function(info) {
            if (info.event.backgroundColor) {
                info.el.style.backgroundColor = info.event.backgroundColor;
            }
        },
        eventDrop : function(info){
        	info.revert();
        	
        	
        },
        
        eventClick : function(info){
            console.log("Event Click");
            console.log("Event ID: ", info.event.id);
            console.log("All Day: ", info.event.allDay);
            console.log("Event Object: ", info.event);
        	$('#event-modal').modal('show');
            $('#event-modal').on('shown.bs.modal', function() {
                $('#event-title').focus();
            });
            
            $.ajax({
        		url : "/calendar/eventDetail.do",
        		type : "post",
        		contentType : 'application/json',
        		data : JSON.stringify({ id : info.event.id}),
        		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
   		       xhr.setRequestHeader(header, token);
   		       },
	   		    success: function(res) {
	   		    	$('#event-title').val(res.title);
	   		    	$('#event-content').val(res.content);
	   		    	$('#event-start').val(res.startdateStr);
	   		    	$('#event-end').val(res.enddateStr);
	   		    	$('#event-category').val(res.textColor);
	   		    	$('#event-id').val(res.id);
	   		    	
	   		    	
	   		    	$('#btn-save-event').hide();
	   		    	$('#btn-update-event').show();
	   		    	$('#btn-delete-event').show();
	   		    	
	   		    },
	   		    error: function(xhr) {
	   		    	alert(xhr.status);
	   		    }
        	});
            
        },
        eventResize : function(info){
            info.revert(); // resize를 취소합니다.
        }
        
    });
    calendar.render();
});    

    // 미완료 작업(상태별) 시작
//     var ctxPending = document.getElementById('pending-works-chart').getContext('2d');
//     var pendingWorksData = {
//         labels: ['할 일', '진행중', '이슈발생'],
//         datasets: [{
//             label: '미완료 작업 수',
//             data: [
//                 ${pendingWorksByStatus.status1}, 
//                 ${pendingWorksByStatus.status2}, 
//                 ${pendingWorksByStatus.status4}
//             ],
//             backgroundColor: ['#36A2EB', '#9966FF', '#FF9F40']
//         }]
//     };
//     console.log("Labels: ", pendingWorksData.labels);
//     console.log("Data: ", pendingWorksData.datasets[0].data);
    
//     var pendingWorksChart = new Chart(ctxPending, {
//         type: 'bar',
//         data: pendingWorksData,
//         options: {
//             responsive: true,
//             scales: {
//             	x: {
//                     beginAtZero: true
//                 },
//                 y: {
//                     beginAtZero: true
//                 }
//             },
//             plugins: {
//                 legend: {
//                     display: true,
//                     position: 'top'
//                 },
//                 title: {
//                     display: true,
//                     text: '미완료 작업(상태별)'
//                 }
//             }
//         }
//     });
    // 미완료 작업(상태별) 끝

    // 총 작업 수(완료 상태별) 시작
    var ctxDoughnut = document.getElementById('doughnut-chart').getContext('2d');
    
    var doughnutData = {
        labels: ['완료된 작업', '미완료 작업', '마감일이 지난 작업'],
        datasets: [{
            label: '총 작업 수(완료 상태별)',
            data: [
                ${doneWorks}, 
                ${noDoneWorks}, 
                ${lateWorks}
            ],
            backgroundColor: ['#4BC0C0', '#FFCD56', '#FF6384']
        }]
    };

    var doughnutChart = new Chart(ctxDoughnut, {
        type: 'doughnut',
        data: doughnutData,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                },
                title: {
                    display: true,
                    text: '총 작업 수(완료 상태별)'
                }
            }
        }
    });
    // 총 작업 수(완료 상태별) 끝

    // 예정된 작업(담당자 별) 시작
//     var ctxHorizontalBar = document.getElementById('bar-chart-horizontal').getContext('2d');
//     var assigneeLabels = [
//         <c:forEach items="${worksByAssigneeData}" var="entry">
//             '${entry.empName}',
//         </c:forEach>
//     ];
//     var assigneeData = [
//         <c:forEach items="${worksByAssigneeData}" var="entry">
//             ${entry.managerCount},
//         </c:forEach>
//     ];

//     console.log("Assignee Labels: ", assigneeLabels);
//     console.log("Assignee Data: ", assigneeData);

//     var barColors = [
//         'rgba(255,99,132,0.5)','rgba(54,162,235,0.5)','rgba(255,205,86,0.5)',
//         'rgba(75,192,192,0.5)','rgba(54,162,235,0.5)','rgba(153,102,255,0.5)',
//         'rgba(201,203,207,0.5)'    
//         ];
    
//     var borderColors = barColors.map(color => color.replace('0.5', '1.0'));

//     var horizontalBarData = {
//         labels: assigneeLabels,
//         datasets: [{
//             label: '예정된 작업 수',
//             data: assigneeData,
//             backgroundColor: barColors.slice(0, assigneeData.length),
//             borderColor: borderColors,   // 불투명한 색상
//             borderWidth: 2,
//         }]
//     };

//     var horizontalBarChart = new Chart(ctxHorizontalBar, {
//         type: 'bar',
//         data: horizontalBarData,
//         options: {
//             responsive: true,
//             indexAxis: 'y', // 가로 막대 차트를 위한 옵션
//             scales: {
//                 x: {
//                     beginAtZero: true, // Y축 최소값 0 설정
                   
//                 },
//                 y: {
//                     beginAtZero: true,
//                     ticks: {
//                         autoSkip: false, // 모든 레이블을 표시하도록 설정
//                         maxRotation: 0,
//                         minRotation: 0
//                     },
//                 }
//             },
//             plugins: {
//                 legend: {
//                     display: true,
//                     position: 'top'
//                 },
//                 title: {
//                     display: true,
//                     text: '예정된 작업(담당자 별)'
//                 }
//             }
//         },
//         maintainAspectRatio: false
//     });
    // 예정된 작업(담당자 별) 끝

    // 시간경과에 따른작업 완료 시작
    var ctxArea = document.getElementById('area-chart').getContext('2d');
    var areaChartData = {
        labels: [
            <c:forEach items="${workCompletionOverTime.labels}" var="label">
                '${label}',
            </c:forEach>
        ],
        datasets: [{
            label: '작업 완료 수',
            data: [
                <c:forEach items="${workCompletionOverTime.data}" var="dataPoint">
                    ${dataPoint},
                </c:forEach>
            ],
            borderColor: '#3e95cd',
            backgroundColor: 'rgba(62, 149, 205, 0.5)',
            fill: true
        }]
    };

    console.log("Area Chart Data: ", areaChartData);

    var areaChart = new Chart(ctxArea, {
        type: 'line',
        data: areaChartData,
        options: {
            responsive: true,
            scales: {
                x: {
                    beginAtZero: true
                },
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                },
                title: {
                    display: true,
                    text: '시간경과에 따른 작업 완료'
                }
            },
            elements: {
                line: {
                    tension: 0.4 // 곡선 정도를 설정합니다.
                }
            }
        }
    });
    // 시간경과에 따른작업 완료 끝
</script>
