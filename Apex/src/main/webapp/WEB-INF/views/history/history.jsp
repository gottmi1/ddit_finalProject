<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page isELIgnored="false" %>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h4 class="page-title">히스토리</h4>
        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
<!--                 <h4 class="header-title mb-3">프로젝트 활동</h4> -->
                
				<form id="searchForm" action="/project/historyList" method="post">
					<div class="row mb-5">
						<!-- 시작 날짜와 종료 날짜 -->
						<div class="col-4">
							<div class="input-group" style="width: auto;">
							    <input type="date" id="startDate" name="startDate" class="form-control" placeholder="시작 날짜">&nbsp;&nbsp;
							    <input type="date" id="endDate" name="endDate" class="form-control" placeholder="종료 날짜">
							    <button class="btn btn-primary text-nowrap" type="submit">기간 검색</button>
							</div>
						</div>
						<div class="col-5"></div>
		                <!-- 검색 -->
						<div class="col-3 d-flex pe-0">
							<input type="search" id="searchWord" name="searchWord" value="${searchWord}" class="form-control dropdown-toggle" placeholder="검색어를 입력해 주세요.">
							<input type="hidden" id="projectId" name="projectId" value="${projectId}">
<!-- 									<span class="mdi mdi-magnify search-icon"></span> -->
							<button class="btn btn-primary text-nowrap" type="submit">검색</button>
						</div>
	                
		                <!-- 필터 옵션 -->
<!-- 		                <div class="col-4"> -->
<!-- 		                    <select id="activityFilter" class="form-select" style="width: auto;"> -->
<!-- 		                        <option value="all">모든 활동</option> -->
<!-- 		                        <option value="works">일감</option> -->
<!-- 		                        <option value="projects">프로젝트</option> -->
<!-- 		                        <option value="changesets">변경사항</option> -->
<!-- 		                    </select> -->
<!-- 		                </div> -->
					</div>
                   <sec:csrfInput/>
			   </form>

                <!-- 활동 목록 -->
                <div id="activityList">
                    <!-- 활동 항목들이 여기에 동적으로 추가됩니다 -->
                </div>

                <!-- 페이지네이션 -->
                <div class="text-center mt-3">
                    <ul class="pagination pagination-rounded justify-content-center mb-0" id="pagination">
                        <!-- 페이지 번호가 여기에 동적으로 추가됩니다 -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">


    const csrfToken = $("meta[name='_csrf']").attr("content");
    const csrfHeader = $("meta[name='_csrf_header']").attr("content");
    const projectId = "${param.projectId}";
    const contextPath = '${pageContext.request.contextPath}';
    let currentPage = 1;
    const itemsPerPage = 20;
//     let searchForm = $('#searchForm');

    // -------------------- 오늘날짜 이후로 선택 안되도록 설정 시작------------------------------------
    var now_utc = Date.now(); // 지금 날짜를 밀리초로
    var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
    var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
    
//     $("#startDate").attr("max", today);
//     $("#endDate").attr("max", today);
 	// -------------------- 오늘날짜 이후로 선택 안되도록 설정 끝-------------------------------------
    
    function loadActivities(page) {
    	//alert("ppp" + page);
    	
        $.ajax({
            url: contextPath + "/history/historyList",
            type: "POST",
            data: { 
                page: page,
                itemsPerPage: itemsPerPage,
                filterType: $('#activityFilter').val(),
                searchWord: $('#searchWord').val(),
                startDate: $('#startDate').val(),
                endDate: $('#endDate').val()
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: function(data) {
            	console.log("## data : " , data); // Title 존재
           //----------------------------------------
                const activityList = $('#activityList');
                activityList.empty();
                
//                 console.log('## data.historyList : ' , data.historyList);
//                 console.log(data.historyList);
//                 console.log(data.historyList.work);
                
                var myArray = [];
                var temp = [];
//                 var flag = true;
//                 var cnt = 0;
                
                // 날짜를 temp배열에 넣기
                $.each(data.historyList, function(index, arr) {
                	var his = arr.historyDate.substring(0,10);
                	temp.push(his);	// 2024-07 넣기
//                 	console.log("## temp.push(his) : ", temp.push(his));
                });
                
                // temp배열의 날짜들의 중복 제거하기
                myArray = temp.reduce((prev, now) => {
                	if(!prev.some(obj=> obj === now )){
                		prev.push(now);
                	}
                	return prev;
                }, []);
                
                // 동적으로 그릴 요소 초기화
                let activityHtml = "";
                
                // 중복 제거된 날짜가 저장된 배열 개수만큼 반복...   
                $.each(myArray, function(i, mydate){
                	
                	activityHtml += '<h5 class="lastElement p-3 bg-light">' + mydate + '</h5>' ;
                	// 가져온 데이터 개수만큼 반복	
                	$.each(data.historyList, function(index, arr) {
                		
//                     	console.log("## index : " , index);
                    	var his = arr.historyDate.substring(0,10);
                    
                    	// 배열의 날짜와 가져온 데이터의 날짜가 같은지 비교...
                    	if(mydate == his){
                    		// 타입 : 컬럼명 tb_nm 살리기 === "WORKS"
//                             if (arr.type === '일감') {
                            if (arr.hisTbNm == 'WORKS') {
                            	activityHtml += 
                                    '<div class="history-item mb-1 ms-4">' +
                                        '<div class="d-flex">' +
                                            '<div class="history-icon me-3 rounded-circle avatar-sm img-thumbnail">' +
                                                '<i class="' + getHistoryStateIcon(arr.actionType) + '"></i>' +
                                            '</div>' +
                                            '<div class="history-content">' +
                                                '<span class="d-flex"><span class="workSpan badge bg-success p-1 me-1">일감</span>' + getActivityDetails(arr) + '</span>' + 
//                                                 '<span class="mb-1"><h5><span class="workSpan badge badge-success-lighten">일감</span></h5>&nbsp;' + getActivityDetails(arr) + '</span>' + 
                                                '<span class="text-muted time" style="font-size: 80%;">' + '&nbsp;' + arr.historyDate + '</span><br />' +
                                                "<a href='/works/detail?workNo="+arr.hisWorkNo+"' class='workTitle mt-0 mb-1'>관리번호&nbsp;:&nbsp;" + arr.historyNo + ")&nbsp;" + arr.hisWorkTitle + '</a><br />' +
                                                '<span class="workContent d-block mt-3">본문&nbsp;:&nbsp;' + stripHtmlTags(arr.hisWorkContent) + '</span>' +
                                                '<span class="text-muted time">담당자&nbsp;:&nbsp;' + escapeHtml(arr.hisWorkManagerList) + '</span>' +
                                            '</div>' +
                                        '</div>' +
                                      '<hr/>' +
                                    '</div>';
                            } else if (arr.hisTbNm == 'PROJECTS') {
                                activityHtml += 
                                    '<div class="history-item mb-1 ms-4">' +
                                        '<div class="d-flex">' +
                                            '<div class="history-icon me-3 rounded-circle avatar-sm img-thumbnail">' +
                                                '<i class="' + getHistoryStateIcon(arr.actionType) + '"></i>' +
                                            '</div>' +
                                            '<div class="history-content">' +
                                                '<span class="d-flex"><span class="workSpan badge bg-info p-1 me-1">프로젝트</span>' + getActivityDetails(arr) + '</span>' + 
                                                '<span class="text-muted time" style="font-size: 80%;">' + '&nbsp;' + arr.historyDate + '</span><br />' +
                                                '<a href="/works/list" class="projectTitle mt-0 mb-1">관리번호&nbsp;:&nbsp;' + arr.historyNo + ")&nbsp;" + arr.hisProName + '</a><br />' +
                                                '<span class="projectContent d-block mt-3">본문&nbsp;:&nbsp;' + stripHtmlTags(arr.hisProContent) + '</span>' +
                                                '<span class="text-muted time">팀장&nbsp;:&nbsp;' + escapeHtml(arr.hisProLeader) + '</span>' +
                                                '<span class="text-muted time">담당자&nbsp;:&nbsp;' + escapeHtml(arr.hisProMemberList) + '</span>' +
                                            '</div>' +
                                        '</div>' +
                                        '<hr/>' +
                                    '</div>';
                            } // if2
                        } // if1
                    	
                	}); // each2
                	
                });	// each1
                
                
               	activityList.append(activityHtml);
                updatePagination(data.totalPages, page);
           //========================================
                
            },	// success
            error: function(xhr, status, error) {
                console.error("AJAX request failed:", error);
                alert("활동 내역을 불러오는 데 실패했습니다. 잠시 후 다시 시도해 주세요.");
            }
  		  
        });
 	}

    // 페이징 처리
    function updatePagination(totalPages, currentPage) {
        const pagination = $('#pagination');
        pagination.empty();

        // 1~10페이지까지 끊기
        const maxVisiblePages = 10;
        let startPage = Math.max(currentPage - Math.floor(maxVisiblePages / 2), 1);
        let endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);

        if (endPage - startPage + 1 < maxVisiblePages) {
            startPage = Math.max(endPage - maxVisiblePages + 1, 1);
        }

        if (startPage > 1) {
            pagination.append('<li class="page-item"><a class="page-link" href="#" data-page="1">&laquo;</a></li>');
        }

        for (let i = startPage; i <= endPage; i++) {
            const pageItem = $('<li class="page-item' + (i === currentPage ? ' active' : '') + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>');
            pagination.append(pageItem);
        }

        if (endPage < totalPages) {
            pagination.append('<li class="page-item"><a class="page-link" href="#" data-page="' + totalPages + '">&raquo;</a></li>');
        }

        pagination.on('click', 'a.page-link', function(e) {
            e.preventDefault();
            const page = $(this).data('page');
            loadActivities(page);
        });
    }

    function getHistoryStateIcon(actionType) {
        switch(actionType) {
            case '등록': return 'mdi mdi-plus-circle font-23 d-block text-center text-success';
//             case '등록': return 'mdi badge-info-lighten text-success';
//             case '등록': return 'badge badge-info-lighten';
            case '수정': return 'mdi mdi-pencil font-23 d-block text-center text-warning';
            case '삭제': return 'mdi mdi-delete font-23 d-block text-center text-danger';
            default: return 'mdi mdi-information font-23 d-block text-center text-warning';
        }
    }

	//----------------------------------------------------------------------------------------------------------------
	
	// 일감, 프로젝트가 등록, 수정, 삭제를 표시해주는 상태값
    function getActivityDetails(activity) {
        if (activity.actionType === '등록') {
            return '<span class="text-success"/* style="color: dodgerblue;" */>새로운 작업이 등록 되었습니다.</span>';
        } else if (activity.actionType === '수정') {
//             return activity.historyColumn + '이(가) "' + '<span style="color: black;">'+ activity.historyBefore + '</span>' + '"에서 "' + activity.historyAfter + '<span style="color: dodgerblue;" */>' + "(으)로 변경되었습니다." + '</span>';
            return '<span class="text-warning">작업이 수정 되었습니다.</span>';
        } else if (activity.actionType === '삭제') {
            return '<span style="color: red;">작업이 삭제되었습니다.</span>';
        }
        return '';
    }

	// HTML 특수 문자를 이스케이프 처리
    function escapeHtml(unsafe) {
        if (unsafe == null) return '';
        return unsafe
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }
	
	// HTML 문자열에서 모든 태그를 제거
    function stripHtmlTags(html) {
	    if (html == null) return '';
	    return html.replace(/<\/?[^>]+(>|$)/g, "");
	}
	
$(function() {
    	
    $('#activityFilter').change(function() {
        loadActivities(1);
    });

    $('#searchForm').on('submit', function(event) {
        event.preventDefault(); // 폼 제출 기본 동작 방지
        const searchWord = $('#searchWord').val();
        loadActivities(1, searchWord);
    });
    
    loadActivities(1);
});
//]]>
</script>