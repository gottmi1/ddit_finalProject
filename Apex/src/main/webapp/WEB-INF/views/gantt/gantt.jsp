<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

    <!-- header key와 값을 matadata로 넘겨준다 -->
<%-- 	<meta id="_csrf" name="_csrf" content="${_csrf.token }"> --%>
<%-- 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }"> --%>

<!-- Frappe Gantt JS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/frappe-gantt/0.5.0/frappe-gantt.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/frappe-gantt/0.5.0/frappe-gantt.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>

 
<style>
/* .details-container { */
/* 	background: #fff; */
/* 	padding: 10px; */
/* 	border: 1px solid #ccc; */
/* 	border-radius: 5px; */
/* } */
.popup-wrapper {
	display:none;
}
.gantt-container .popup-wrapper .pointer {
	left: -3px;
    display: inline;
    transform: rotateZ(270deg);
    top: 2px;
}
.custom-popup {
    position: absolute;
/*     display: none; */
    border: 1px solid #ccc;
    background: #fff;
    padding: 10px;
    z-index: 1000;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.custom-popup .title {
    font-weight: bold;
    margin-bottom: 5px;
}

.custom-popup .subtitle {
    font-size: 0.9em;
    color: #666;
}
</style>

     <!-- Begin page -->
    <div class="wrapper">

        
        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <h4 class="page-title">간트차트</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="card">
                        <div class="card-body">
                            <div class="row">

                               <!-- gantt view -->
								<div class="col-xxl-12 mt-2 mt-xl-0 col-lg-12">
									<div class="ps-xl-3">
										<div class="row">
											<div class="col-auto" id="proNameArea">
												<c:if test="${not empty proName }">
													<h4 class="page-title">${proName }</h4>
												</c:if>
											</div>
											<div class="col text-sm-end">
												<div class="btn-group btn-group-sm mb-2" data-bs-toggle="buttons" id="modes-filter">
													<label class="btn btn-soft-secondary d-none d-sm-inline-block">
														<input class="btn-check modes" type="button" value="Quarter Day"> 4시간
													</label>
													<label class="btn btn-soft-secondary">
														<input class="btn-check modes" type="button" value="Half Day"> 12시간
													</label>
													<label class="btn btn-soft-secondary">
														<input class="btn-check modes" type="button" value="Day"> 일
													</label>
													<!-- active -->
													<label class="btn btn-soft-secondary ">
														<input class="btn-check modes" type="button" value="Week"> 주
													</label>
													<label class="btn btn-soft-secondary">
														<input class="btn-check modes" type="button" value="Month"> 월
													</label>
												</div><!-- btn-group btn-group-sm mb-2" data-bs-toggle="buttons 끝 -->
											</div><!-- col text-sm-en 끝 -->
										</div><!-- row 끝 -->
									
										<div class="row">
											<div id="gantt" class="col mt-3"></div>
<!-- 											 <svg id="tasks-gantt"></svg> -->
										</div>
									</div><!-- ps-xl-3 끝 -->
								</div><!-- col-xxl-9 mt-4 mt-xl-0 col-lg-8 끝 -->
								<!-- end gantt view -->
								
                            </div>
                        </div>
                    </div>

                </div> <!-- container -->

            </div> <!-- content -->

        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->

    <!-- END wrapper -->

        
        
        
        
        	
		
        
        
        
        


<script type="text/javascript">
$(function() {
	// 시큐리티 인증
	moment.locale('ko'); // 한국어 로케일 설정
	
	
	
	
	
// 	        	header_height: 50,
// 	        	  column_width: 30,
// 	        	  step: 24,
// 	        	  view_modes: ["Quarter Day", "Half Day", "Day", "Week", "Month"],
// 	        	  bar_height: 20,
// 	        	  bar_corner_radius: 3,
// 	        	  arrow_curve: 5,
// 	        	  padding: 18,
// 	        	  view_mode: "Day",
// 	        	  date_format: "YYYY-MM-DD",
// 	        	  language: "en", // or 'es', 'it', 'ru', 'ptBr', 'fr', 'tr', 'zh', 'de', 'hu'
	        	 
//				<div class="title">일감1</div>
// 	            <div class="subtitle">June 01 - June 27</div>
	// 간트차트 뷰
	// 서버 측 데이터를 JSON 형식으로 변환하여 JavaScript 변수에 할당
	// fn:replace를 사용하여 줄바꿈 문자를 제거하고, fn:escapeXml을 사용하여 데이터를 안전하게 JavaScript 코드에 삽입
	
	
	
	
	 var tasks = [
// 	            {
// 	                id: 'Task 1',			// 일감명
// 	                name: '일감1',			// 일감명
// 	                start: '2024-06-01',
// 	                end: '2024-06-27',
// 	                progress: 20,
// 	                dependencies: '',		// 부모일감
// 	                link: 'https://example.com/task1' // 추가 정보 링크
// 	            },
// 	            {
// 	                id: 'Task 2',
// 	                name: '하위일감1',
// 	                start: '2024-06-10',
// 	                end: '2024-06-26',
// 	                progress: 50,
// 	                dependencies: 'Task 1',
// 	                link: 'https://example.com/task2' // 추가 정보 링크
// 	            },
// 	            {
// 	                id: 'Task 4',
// 	                name: 'Develop new featurezz',
// 	                start: '2024-06-01',
// 	                end: '2024-06-27',
// 	                progress: 50,
// 	                dependencies: 'Task 3, Task 1',
// 	                link: 'https://example.com/task3' // 추가 정보 링크
// 	            }
	        ];
	        
	var proNo = ${proNo};
	
	
	console.log("세션에서 가져온 프로젝트번호 : "+proNo);
	$.ajax({
		url : '/gantt/workList.do',
		type : 'post',
		contentType : 'application/json; charset=UTF-8',
		data : JSON.stringify({ 'proNo' : proNo}),
		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	         xhr.setRequestHeader(header, token);
	    },
	    success : function(res){
	    	for (i = 0; i < res.length; i++) {
	               // 데이터 유효성 검사 및 기본값 설정
	            var dependencies = res[i].workParentNo !== 0 ? res[i].workParentNo.toString() : '';
                tasks.push({
                    id: res[i].workNo.toString(),
                    name: res[i].workTitle,
                    start: moment(res[i].workStartdate, 'YYYYMMDD').isValid() ? moment(res[i].workStartdate, 'YYYYMMDD').format('YYYY-MM-DD') : moment().format('YYYY-MM-DD'),
                    end: moment(res[i].workEnddate, 'YYYYMMDD').isValid() ? moment(res[i].workEnddate, 'YYYYMMDD').format('YYYY-MM-DD') : moment().format('YYYY-MM-DD'),
                    progress: res[i].workProg,
                    dependencies: dependencies
	            	
	            })
	            
            }
            initializeGantt('Week'); // 데이터 로드 후 간트차트 초기화
	    	
	    }, error : function(xhr){
	    	alert(xhr.status);
	    }

	})        
	        
	        

	
	
	// jQuery를 사용하여 마우스 호버 이벤트 처리
    $(document).on('mouseenter', '.bar-wrapper', function() {
        let workNo = $(this).data('id');
        $.ajax({
        	url : "/gantt/workDetail.do",
        	type : "post",
        	contentType : "application/json",
        	data : JSON.stringify({
        		workNo : workNo
        	}),
        	beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		    },
		    success : function(res){
		    	let statusName;
		    	let firstName;
		    	if(res.workStatus == 1){
		    		statusName = "할 일";
		    	}else if(res.workStatus == 2){
		    		statusName = "진행중";
		    	}else if(res.workStatus ==3){
		    		statusName = "완료";
		    	}else{
		    		statusName = "이슈발생";
		    	}
		    	
		    	if(res.workFirst == 1){
		    		firstName = "낮음";
		    	}else if(res.workFirst == 2){
		    		firstName = "보통";
		    	}else if(res.workFirst ==3){
		    		firstName = "높음";
		    	}
		    	let popupHtml = "";
		    	popupHtml += "<div class='custom-popup'>";
		    	popupHtml += "<div class= 'title'><a href='#' target='_blank'>"+res.workTitle+" </a></div> ";
		    	popupHtml += "<div class='subtitle'>";
		    	popupHtml += "상태 : "+statusName+"<br>"
		    	popupHtml += "시작일자 : "+formatDate(res.workStartdate)+"<br>";
		    	popupHtml += "종료일자 : "+formatDate(res.workEnddate)+"<br>";
		    	popupHtml += "담당자 : ";
		    	for (i = 0; i < res.managerDetail.length; i++) {
		    	    popupHtml += res.managerDetail[i].empName;
		    	    if (i < res.managerDetail.length - 1) {
		    	        popupHtml += ", ";
		    	    }
		    	}
		    	
		    	popupHtml += "<br>";
		    	popupHtml += "우선순위 : "+firstName+" <br>";
		    	popupHtml += "</div>";
		    	popupHtml += "</div>"
		        $('body').append(popupHtml);
		        $('.custom-popup').css({
		            top: event.pageY + 10,
		            left: event.pageX + 10
		        }).show();
		    	
		    	
		    	
		    	
		    	
		    },
		    error : function(xhr){
		    	alert(xhr.stauts);
		    }

        })
        
        var start_date = moment(workNo._start).format('YYYY-MM-DD');
        var end_date = moment(workNo._end).format('YYYY-MM-DD');
    }).on('mouseleave', '.bar-wrapper', function() {
        $('.custom-popup').remove();
    }).on('mousemove', '.bar-wrapper', function(event) {
        $('.custom-popup').css({
            top: event.pageY + 10,
            left: event.pageX + 10
        });
    });
	        

	// 4시간, 12시간, 일, 주, 월별 차트 필터링 버튼 클릭이벤트
	$(document).on('click','.modes', function() {
		console.log("쓰으으ㅡ")
// 		클릭된 input 요소에 대한 작업 수행
		console.log($(this).val() + ' is clicked');
			   	
		var modesValue = $(this).val();
		//gantt = initializeGantt($(this).val());
		
		// 기존 간트차트 인스턴스를 제거하고 새로운 뷰 모드로 초기화
		$('#gantt').empty();
        gantt = initializeGantt(modesValue);
			
	});
	

	//간트차트 초기화하는 함수
	function initializeGantt(viewMode) {
		return new Gantt("#gantt", tasks, {
			// 사용자가 Gantt 차트의 작업 바를 클릭할 때 호출
			on_click: function (task) {
				console.log(" ## on_click 의 task 확인 : "+task.id);
				location.href="http://localhost/works/detail?workNo="+task.id;
			},
			view_modes: ["Quarter Day", "Half Day", "Day", "Week", "Month"],
			view_mode: viewMode,
			date_format: 'YYYY-MM-DD',
			// 사용자가 작업의 시작 또는 종료 날짜를 변경할 때 호출
			// task(변경된 작업의 데이터), start와 end(변경된 시작 및 종료 날짜를 포함)
// 			on_date_change: function (task, start, end) {
// 				console.log(" ## on_date_change 의 task,start,end 확인 : ", task, start, end);
// 			},
			// 프로그레스바 크기 조정시 호출
// 			on_progress_change: function (task, progress) {
// 				console.log(" ## on_progress_change 의 task,progress 확인 : ", task, progress);
// 			},
			
			// 4시간,12시간,일,주,월별 클릭시 호출
			on_view_change: function (mode) {
				console.log(" ## on_view_change 의 mode 확인 : ",mode);
			}
		});
	};
	
	
	
});
function formatDate(dateString) {
    if (dateString.length === 8) {
        return dateString.slice(0, 4) + '-' + dateString.slice(4, 6) + '-' + dateString.slice(6, 8);
    }
    return dateString; // 형식이 맞지 않으면 원래 문자열 반환
}




</script>
