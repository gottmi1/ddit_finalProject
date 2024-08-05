<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- isAuthenticated : 로그인 한 경우 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.employeeVO" var="employeeVO" />
</sec:authorize>
<!-- Begin page -->
<div class="wrapper">
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">일일업무보고</h4>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="mt-3">
						<h5 class="font-21">${report.reportTitle}</h5>

						<hr class="titleBorder"/>

						<div class="mb-3 mt-1">
							<div class="d-flex justify-content-between">
								<div class="d-flex align-items-center">
									<img class="img-thumbnail avatar-sm me-2 rounded-circle" src="${report.profileImg}" alt="placeholder image" height="32">
									<h6 class="mb-0 font-14">${report.empName }</h6>
								</div>
								<div class="d-grid">
                                    <small class="text-muted">등록 날짜: <fmt:formatDate value="${report.reportDate }" pattern="yyyy-MM-dd"/></small>
                                   	<c:if test="${report.reportModdate != null}">
                                   		<small class="text-muted">수정 날짜:<fmt:formatDate value="${report.reportModdate }" pattern="yyyy-MM-dd"/></small>
                                   	</c:if>
								</div>
							</div>
						</div>

						<pre style="font-size: 18px">${report.reportContent }</pre>

						<h5 class="mb-3">파일</h5>
						<div class="row" style="min-height: 100px;">
							<c:set var="fileDetails" value="${report.reportFile.fileList}" />
							<c:set var="len" value="${fn:length(fileDetails)}" />
							<c:if test="${len < 1}">
								<div class="d-flex justify-content-center align-items-center" style="width: 100%;">
									<h4>첨부 파일이 없습니다.</h4>
								</div>
							</c:if>
							<c:if test="${len > 0}">
								<c:forEach var="fileDetailVO" items="${fileDetails}" varStatus="stat">
									<div class="col-xl-4">
										<div class="card mb-0 shadow-none border">
											<div class="p-2">
												<div class="row align-items-center">
													<div class="col-auto">
														<div class="avatar-sm">
															<span class="avatar-title text-bg-secondary rounded">
																<c:set var="split" value="${fn:split(fileDetailVO.fileOriginName, '.')}"></c:set>
																<c:set var="ext" value="${fn:toUpperCase(split[fn:length(split) - 1])}"></c:set>
																${ext}
															</span>
														</div>
													</div>
													<div class="col ps-0">
														<a href="/report/download" class="text-muted fw-bold">${fileDetailVO.fileOriginName}</a>
														<p class="mb-0">${fileDetailVO.fileFancysize}</p>
													</div>
													<div class="col-auto">
														<!-- Button -->
														<a class="downloadLink mr-2"
															data-filename='${fileDetailVO.fileSaveName }'
															data-originalfilename='${fileDetailVO.fileOriginName }'
															class="btn btn-link btn-lg text-muted"> 
															<i class="ri-download-2-line"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<!-- 파일 목록 끝 -->
						</div>
						<hr />
						<div class="d-flex justify-content-between">
							<input type="button" class="btn btn-light" id="listBtn" value="목록" />
							<c:if test="${empInfo.empNo eq report.empNo}">
							<div>
								<input type="button" class="btn btn-soft-success me-2" id="modifyBtn" value="수정" />
								<input type="button" class="btn btn-soft-danger" id="deleteBtn" value="삭제" />
							</div>
							</c:if>
						</div>

						<!-- /// 댓글 목록 시작 /// -->
						<h5 class="mb-3 mt-5">댓글</h5>
						<c:forEach items="${reportCommentList}" var="comments" varStatus="stat">
							<c:if test="${comments.reportCoParentNo eq 0}">
								<c:choose>
									<c:when test="${comments.reportCoContent eq 'Deleted comments' }">
										<div class="d-flex align-items-center">
											<hr />
											<span class="fw-bold mt-3">삭제된 댓글입니다.</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="bg-light-lighten parentComment commentDiv">
											<div class="d-flex align-items-start p-3 mb-1">
												<input class="reportCoNo" value="${comments.reportCoNo}" hidden>
												<img src="${comments.profileImg }" class="me-3 avatar-sm rounded-circle" />
												<div class="w-100 overflow-hidden">
													<h5 class="mt-0">${comments.empName}</h5>
													<p class="commentContent">${comments.reportCoContent }</p>
													<a class="btn btn-sm btn-link text-muted p-0 ps-2 replyBtn"
															data-commentnumber="${comments.reportCoNo}"> 
															<i class="uil uil-comments-alt me-1"></i>답글
														</a>
												</div>
												<div class="d-grind justify-content-center">
													<div class="d-flex">
														<c:if test="${empInfo.empNo eq comments.empNo}">
															<a href="javascript:void(0)" class="me-2 commentModifyBtn"
																style="white-space: nowrap;">수정</a>
															<a href="javascript:void(0)" class="me-2 commentDeleteBtn"
																style="white-space: nowrap;">삭제</a>
														</c:if>
													</div>
													<small class="text-muted text-nowrap text-center">
														<fmt:formatDate value="${comments.reportCoModdate }" pattern="yyyy-MM-dd" />
													</small>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:forEach items="${reportCommentList}" var="replyComment">
								<c:if test="${comments.reportCoNo eq replyComment.reportCoParentNo}">
									<c:choose>
										<c:when test="${replyComment.reportCoContent eq 'Deleted comments' }">
											<div class="d-flex align-items-center">
												<i class="mdi mdi-arrow-right-bottom me-2"></i>
												<span class="fw-bold mt-3">삭제된 댓글입니다.</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="d-flex align-items-start p-3 px-5 mb-1 bg-secondary-lighten commentDiv">
												<i class="mdi mdi-arrow-right-bottom me-2"></i>
												<input class="reportCoNo" value="${replyComment.reportCoNo}" hidden>
												<img src="${replyComment.profileImg }" class="me-3 avatar-sm rounded-circle" />
												<div class="w-100 overflow-hidden">
													<h5 class="mt-0">${replyComment.empName}</h5>
													<p class="commentContent">${replyComment.reportCoContent }</p>
												</div>
												<div class="d-grid justify-content-center">
													<div class="d-flex">
														<c:if test="${empInfo.empNo eq replyComment.empNo}">
															<a href="javascript:void(0)" class="me-2 commentModifyBtn"
																style="white-space: nowrap;">수정</a>
															<a href="javascript:void(0)" class="commentDeleteBtn"
																style="white-space: nowrap;">삭제</a>
														</c:if>
													</div>
													<small class="text-muted text-nowrap pe-3">
														<fmt:formatDate value="${replyComment.reportCoModdate }" pattern="yyyy-MM-dd" />
													</small>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</c:forEach>

						<!-- /// 댓글 목록 끝 /// -->

						<!-- 댓글 등록 폼 -->
						<div class="row" style="min-height: 100px; padding: 15px;">
							<div class="d-flex mb-3">
								<img id="commentImg" src="${empInfo.empProfileimg }" class="avatar-sm rounded-circle align-self-start rounded me-2"/>
<%-- 								<p class="mb-0 fw-bold" id="commentName">${empInfo.empName}</p> --%>
								<div class="w-100">
									<form action="/report/addComment" method="post">
										<input type="text" name="reportNo" value="${param.reportNo}" id="commentReportNo" hidden />
										<input type="text" name="empNo" value="${empInfo.empNo}" id="commentEmpNo" hidden />
										<div class="d-flex align-items-center">
											<textarea class="form-control form-control-light" name="reportCoContent" required></textarea>
											<button class="btn btn-primary text-nowrap ms-2">등록</button>
										</div>
										<sec:csrfInput />
									</form>
								</div>
							</div>
						</div>
						<!-- 댓글 등록 폼 -->
						<div class="mt-5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form action="/report/deleteReport" method="post" id="delForm" hidden>
	<input type="text" name="reportNo" value="${report.reportNo}" hidden>
	<sec:csrfInput />
</form>
<form action="/report/deleteComment" method="post" id="deleteCommentForm" hidden>
	<input type="text" name="reportNo" value="${report.reportNo }" hidden>
	<input type="text" name="reportCoNo" value="" id="deleteCommentNumberInput" hidden>
	<sec:csrfInput />
</form>

<!-- SimpleMDE js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.js"></script>

<!-- Page init js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.inbox.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

<script type="text/javascript">
$(function(){
	var modifyBtn = $('#modifyBtn');
    var deleteBtn = $('#deleteBtn');
    var listBtn = $('#listBtn');
    
    var delForm = $('#delForm');
    
    // 목록 
    listBtn.on('click', function(){
        location.href = "/report/list";
    });
    
    // 게시글 수정하기(이동)
    modifyBtn.on('click', function(){
        delForm.attr("action", "/report/updateReport");
        delForm.attr("method", "get");
        delForm.submit();
    });
    
    // 게시글 삭제
    deleteBtn.on('click', function(){
    	   Swal.fire({
  	         title: '정말로 삭제하시겠습니까?',
  	         icon: 'warning',
  	         showCancelButton: true,
  	         confirmButtonText: '삭제',
  	         cancelButtonText: '취소'
  	     }).then((result) => {
  	         if (result.isConfirmed) {
  	         	Swal.fire({
  	         		title : '삭제가 완료되었습니다 ! ',
  	         		icon : 'info'
  	         	}).then(() => {
  	 		        delForm.submit();
  	             });
  	         	
  	         	
  	         }
  	     });
    });

    // 댓글/답글 삭제
    $('.commentDeleteBtn').click(function(e) {
		e.preventDefault();
		let selectedCoNo = $(this).parents('.commentDiv').find('.reportCoNo').val();
		$('#deleteCommentNumberInput').val(selectedCoNo);
		
// 		if(confirm("댓글을 정말 삭제할까요?")) {
// 			$('#deleteCommentForm').submit();
// 		};
		
	   Swal.fire({
	        title: '정말로 댓글을 삭제하시겠습니까?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	Swal.fire({
	        		title : '삭제가 완료되었습니다 ! ',
	        		icon : 'info'
	        	}).then(() => {
					$('#deleteCommentForm').submit();
	            });
	        	
	        	
	        }
	    });
		
		
	});
	
    // 댓글/답글 수정하기
	$('.commentModifyBtn').click(function() {
		
		if($(this).text() == "수정") {
			$(this).text("수정완료");
		};
		
		if($(this).text() == "수정완료") {
			$('#commentModifyForm').submit();
		};
		
		let thisContent = $(this).parents('.commentDiv').find('.commentContent');
		let thisCommentNo = $(this).parents('.commentDiv').find('.reportCoNo').val();
		let thisReportNo = $('#commentReportNo').val();
		
		console.log("thisCommentNo : " + thisCommentNo);
	
		let html = `
			<form action="/report/modifyComment" id="commentModifyForm" method="post">
				<input type="text" value="\${thisCommentNo}" name="reportCoNo" hidden />
				<input type="text" value="\${thisReportNo}" name="reportNo" hidden />
				<textarea class="form-control" style="width : 100%" name="reportCoContent">\${thisContent.text()}</textarea>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			`
			thisContent.replaceWith(html);
	});
	
    // 게시글 상세 내 파일 다운로드
	$('.downloadLink').click(function() {
	    let fileName = $(this).data("filename");
	    let originalFileName = $(this).data("originalfilename");
	    
	    $.ajax({
	        url: "/report/downloadFile",
	        type: "POST",
	        data: {
	            fileName: fileName,
	            originalFileName: originalFileName
	        },
	        beforeSend : function(xhr){
	         xhr.setRequestHeader(header, token);
	      	},
	        xhrFields: {
	            responseType: 'blob'
	        },
	        success: function(blob) {
	            var link = document.createElement('a');
	            var url = window.URL.createObjectURL(blob);
	            link.href = url;
	            link.download = originalFileName;
	            document.body.append(link);
	            link.click();
	            link.remove();
	            window.URL.revokeObjectURL(url);
	        }
	    })
	});
	
    // 답글 버튼 클릭 시 답글 폼 표시
    $(".replyBtn").on('click', function() {
        let parentCommentNo = $(this).data('commentnumber');
        
        $(this).hide();
        
        let thisCommentBox = $(this).parents('.parentComment');
        
        let commentImg = $('#commentImg').attr('src');
        let commentName = $('#commentName').text();
        let commentReportNo = $('#commentReportNo').val();
        let commentEmpNo = $('#commentEmpNo').val();
        
        let html = 
            `
        <div class="pb-3 px-3 mb-1">
        <form action="/report/addComment" method="post" >
            <input type="text" name="reportNo" value="\${commentReportNo}" hidden />
            <input type="text" name="proNo" value="\${commentReportNo}" hidden />
            <input type="text" name="empNo" value="\${commentEmpNo}" hidden />
            <div class="d-flex align-items-center">
            <textarea class="form-control" style="width : 100%" name="reportCoContent"></textarea>
            <input type="text" name="reportCoParentNo" value="\${parentCommentNo}" hidden /> 
            <button class="btn btn-primary  ms-2 text-nowrap">등록</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </div>
        </form>
        `;
        thisCommentBox.append(html);
    });
});

</script>



