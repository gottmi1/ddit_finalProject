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
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">자유게시판</h4>
			</div>
		</div>
	</div>
	<!-- end page title -->
	<!-- end page email-title -->

	<!-- 
	BoardVO(boNo=0, empNo=0, boTitle=경제대통령, boContent=<p>ㅁㄴㅁㅁㄴㅁㄴ</p>
	, boHit=38, boDate=null, boModdate=Sat Jul 06 12:13:26 KST 2024, boDelyn=null, boWriter=null, rnum=0, delBoardNo=null, boFiles=null, fileNo=0, fileDetailList=null, 
	
		boFile=FilesVO(fileNo=0, fileRegdate=null, fileWhereNo=0, fileWherePk=0, 
			fileList=[
				FileDetailVO(item=null, fileDetailNo=0, fileNo=0, fileSaveName=null, fileOriginName=다운로드 (1).jpg, fileFancysize=null, fileSize=10103, fileUrl=null, fileMime=image/jpeg),
				FileDetailVO(item=null, fileDetailNo=0, fileNo=0, fileSaveName=null, fileOriginName=다운로드 (1).jpg, fileFancysize=null, fileSize=10103, fileUrl=null, fileMime=image/jpeg),
				FileDetailVO(item=null, fileDetailNo=0, fileNo=0, fileSaveName=null, fileOriginName=다운로드 (1).jpg, fileFancysize=null, fileSize=10103, fileUrl=null, fileMime=image/jpeg)
			]
		, fileDetailVO=null))
	 -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="mt-3">
						<h4 class="font-21">${board.boTitle}</h4>

						<hr class="titleBorder"/>

						<div class="mb-3 mt-1">
							<div class="d-flex justify-content-between">
								<div class="d-flex align-items-center">
									<img class="img-thumbnail avatar-sm me-2 rounded-circle" src="${board.profileImg}" alt="img">
									<h6 class="font-14">${board.empName }</h6>
								</div>
								<div class="d-grid">
									<small class="text-muted">등록 날짜 : <fmt:formatDate value="${board.boDate}" pattern="yyyy-MM-dd" /></small>
									<c:if test="${board.boModdate != null }">
										<small class="text-muted">수정 날짜 : <fmt:formatDate value="${board.boModdate }" pattern="yyyy-MM-dd" /></small>
									</c:if>
								</div>
							</div>
						</div>

						<pre style="font-size: 18px">${board.boContent }</pre>
						<h5 class="mb-3">파일</h5>
						<div class="row" style="min-height: 100px;">
							<c:set var="fileDetails" value="${board.boFile.fileList}" />
							<c:set var="len" value="${fn:length(fileDetails)}" />
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
															<a href="#" class="text-muted fw-bold">${fileDetailVO.fileOriginName}</a>
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
							<c:if test="${len < 1}">
								<div class="d-flex justify-content-center align-items-center">
									<h4>첨부 파일이 없습니다.</h4>
								</div>
							</c:if>
						</div>
						
						<hr />
						<div class="d-flex justify-content-between">
							<input type="button" class="btn btn-light" id="listBtn" value="목록" />
							<c:if test="${empInfo.empNo eq board.empNo || empInfo.empNo eq 1}">
							<div>
								<input type="button" class="btn btn-soft-success" id="modifyBtn" style="margin-right: 10px;" value="수정" />
								<input type="button" class="btn btn-soft-danger" id="deleteBtn" style="margin-right: 10px;" value="삭제" />
							</div>
							</c:if>
						</div>
						<!-- /// 댓글 목록 시작 /// -->
						<h5 class="mb-3 mt-5">댓글</h5>
						
						<c:forEach items="${boardCommentList}" var="comments" varStatus="stat">
							<c:if test="${comments.boCoParentNo eq 0}">
								<c:choose>
									<c:when test="${comments.boCoContent eq 'Deleted comments' }">
										<div class="d-flex align-items-center">
											<hr />
											<span class="fw-bold">삭제된 댓글입니다.</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="parentComment bg-light-lighten commentDiv">
										
<!-- 											이 div 추가했음 -->
											<div class="d-flex align-items-start p-3 mb-1 ">
<!-- 											이 div 추가했음 -->

												<input class="boCoNo" value="${comments.boCoNo}" hidden>
												<img src="${comments.profileImg }" class="me-3 avatar-sm rounded-circle" />
												<div class="w-100 overflow-hidden">
													<h5 class="mt-0">${comments.empName}</h5>
													<p class="commentContent">${comments.boCoContent }</p>
													<a class="btn btn-sm btn-link text-muted p-0 ps-2 replyBtn"
														data-commentnumber="${comments.boCoNo}"> 
														<i class="uil uil-comments-alt me-1"></i>답글
													</a>
												</div>
												<div class="d-grid justify-content-center">
													<div class="d-flex">
														<c:if test="${empInfo.empNo eq comments.empNo or empInfo.empNo eq 1}">
															<a href="javascript:void(0)" class="me-2 commentModifyBtn"
																style="white-space: nowrap;">수정</a>
															<a href="javascript:void(0)" class="me-2 commentDeleteBtn"
																style="white-space: nowrap;">삭제</a>
														</c:if>
													</div>
													<small class="text-muted text-nowrap text-center">
														<fmt:formatDate value="${comments.boCoDate }" pattern="yyyy-MM-dd" />
													</small>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:forEach items="${boardCommentList}" var="replyComment">
								<c:if test="${comments.boCoNo eq replyComment.boCoParentNo}">
									<c:choose>
										<c:when test="${replyComment.boCoContent eq 'Deleted comments' }">
											<div class="d-flex align-items-center">
												<i class="mdi mdi-arrow-right-bottom me-2"></i>
												<span class="fw-bold">삭제된 댓글입니다.</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="d-flex align-items-start p-3 px-5 mb-1 bg-secondary-lighten commentDiv">
												<i class="mdi mdi-arrow-right-bottom me-2"></i>
												<input class="boCoNo" value="${replyComment.boCoNo}" hidden>
												<img src="${replyComment.profileImg }" class="me-3 avatar-sm rounded-circle" />
												<div class="w-100 overflow-hidden">
													<h5 class="mt-0">${replyComment.empName}</h5>
													<p class="commentContent">${replyComment.boCoContent }</p>
												</div>
												<div class="d-grid justify-content-center">
													<div class="d-flex">
														<c:if test="${empInfo.empNo eq replyComment.empNo or empInfo.empNo eq 1}">
															<a href="javascript:void(0)" class="me-2 commentModifyBtn"
																style="white-space: nowrap;">수정</a>
															<a href="javascript:void(0)" class="commentDeleteBtn"
																style="white-space: nowrap;">삭제</a>
														</c:if>
													</div>
													<small class="text-muted text-nowrap pe-3">
														<fmt:formatDate value="${replyComment.boCoModdate }" pattern="yyyy-MM-dd" />
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
									<form action="/board/addComment" method="post">
										<input type="text" name="boNo" value="${param.boNo}" id="commentBoNo" hidden />
										<input type="text" name="empNo" value="${empInfo.empNo}" id="commentEmpNo" hidden />
										<div class="d-flex align-items-center">
											<textarea class="form-control form-control-light" name="boCoContent" required></textarea>
											<button class="btn btn-primary text-nowrap ms-2">등록</button>
										</div>
										<sec:csrfInput />
									</form>
								</div>
							</div>
						</div>
						<!-- 댓글 등록 폼 -->

						<!-- 
							BO_NO, EMP_NO, BO_CO_CONTENT 
							요청URI : RequestMapping(value = "/insert", method = RequestMethod.POST)
							csrf : cross site request forgery(위조)-해킹
							boNo=26 : param
							param.boNo => 26
	
							요청URI : /board/addComment
							요청파라미터 : {boNo=26,empNo=1,boCoContent=fasd}
							요청방식 : post
							
							required : 필수 입력
						 -->
						<div class="mt-5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<form action="/board/deleteBoard" method="post" id="delForm" hidden>
	<input type="text" name="boNo" value="${board.boNo}" hidden>
	<sec:csrfInput />
</form>
<form action="/board/deleteComment" method="post" id="deleteCommentForm" hidden>
	<input type="text" name="boNo" value="${board.boNo }" hidden>
	<input type="text" name="boCoNo" value="" id="deleteCommentNumberInput" hidden>
	<sec:csrfInput />
</form>

<!-- SimpleMDE js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.js"></script> --%>

<!-- Page init js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.inbox.js"></script> --%>

<!-- App js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script> --%>

<script type="text/javascript">
$(function(){
	var modifyBtn = $('#modifyBtn');
    var deleteBtn = $('#deleteBtn');
    var listBtn = $('#listBtn');
    
    var delForm = $('#delForm');
    
    // 목록 
    listBtn.on('click', function(){
        location.href = "/board/list";
    });
    
    // 게시글 수정하기(이동)
    modifyBtn.on('click', function(){
        delForm.attr("action", "/board/updateBoard");
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
		let selectedCoNo = $(this).parents('.commentDiv').find('.boCoNo').val();
		$('#deleteCommentNumberInput').val(selectedCoNo);
		
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
		let thisCommentNo = $(this).parents('.commentDiv').find('.boCoNo').val();
		let thisBoNo = $('#commentBoNo').val();
		
		console.log("thisCommentNo : " + thisCommentNo);
	
		let html = 
			`
			<form action="/board/modifyComment" id="commentModifyForm" method="post">
				<input type="text" value="\${thisCommentNo}" name="boCoNo" hidden />
				<input type="text" value="\${thisBoNo}" name="boNo" hidden />
				<textarea class="form-control" style="width : 100%" name="boCoContent">\${thisContent.text()}</textarea>
				<sec:csrfInput/>
			</form>
			`
			thisContent.replaceWith(html);
	});
	
    // 게시글 상세 내 파일 다운로드
	$('.downloadLink').click(function() {
	    let fileName = $(this).data("filename");
	    let originalFileName = $(this).data("originalfilename");
	    
	    $.ajax({
	        url: "/board/downloadFile",
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
	    });
	});
	
    // 답글 버튼 클릭 시 답글 폼 표시
    $(".replyBtn").on('click', function() {
        let parentCommentNo = $(this).data('commentnumber');
        
        $(this).hide();
        
        let thisCommentBox = $(this).parents('.parentComment');
        
        let commentImg = $('#commentImg').attr('src');
        let commentName = $('#commentName').text();
        let commentBoNo = $('#commentBoNo').val();
        let commentEmpNo = $('#commentEmpNo').val();
        
        let html = 
            `
        <div class="pb-3 px-3 mb-1">
        <form action="/board/addComment" method="post" >
            <input type="text" name="boNo" value="\${commentBoNo}" hidden />
            <input type="text" name="empNo" value="\${commentEmpNo}" hidden />
            <div class="d-flex align-items-center">
            <textarea class="form-control" style="width : 100%" name="boCoContent"></textarea>
            <input type="text" name="boCoParentNo" value="\${parentCommentNo}" hidden /> 
            <button class="btn btn-primary ms-2 text-nowrap">등록</button>
            </div>
            <sec:csrfInput/>
        </form>
        </div>
        `;
        thisCommentBox.append(html);
    });
});

</script>



