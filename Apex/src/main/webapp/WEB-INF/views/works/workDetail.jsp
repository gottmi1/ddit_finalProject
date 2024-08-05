<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
	<%!
        List<String> empNameList = new ArrayList<String>();
    %>
    

<!-- Begin page -->
<div class="wrapper">
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">일감 상세</h4>
			</div>
		</div>
	</div>
	<!-- end page title -->
	<!-- end page email-title -->

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="mt-3">
						<div class="d-flex justify-content-between align-items-center">
							<div>
								<h5 class="font-18">${worksVO.workTitle}</h5>
							</div>
							<div class="d-flex align-items-center">
								<img class="img-thumbnail avatar-sm rounded-circle me-2"
									src="${pageContext.request.contextPath }
										<c:forEach items="${managerNameList }" var="managerName" begin="0" end="0">
											${managerName.empProfileimg } 
										</c:forEach>
									"
									alt="image">
								<h6 class="font-14">
									<c:forEach items="${managerNameList }" var="managerName" begin="0" end="0">
										${managerName.empName } 
									</c:forEach>
								</h6>
							</div>
						</div>
						<hr class="titleBorder" />
						
						<div class="mb-3" style ="min-height: 300px">
							<p>${worksVO.workContent }</p>
						</div>
						<hr />
						
						<c:if test="${worksVO.workStatus == 1 }">
							<c:set value="할일" var="status"></c:set>
						</c:if>
						<c:if test="${worksVO.workStatus == 2 }">
							<c:set value="진행중" var="status"></c:set>
						</c:if>
						<c:if test="${worksVO.workStatus == 3 }">
							<c:set value="완료" var="status"></c:set>
						</c:if>
						<c:if test="${worksVO.workStatus == 4 }">
							<c:set value="이슈발생" var="status"></c:set>
						</c:if>
						
						<c:if test="${worksVO.workFirst == 1 }">
							<c:set value="낮음" var="first"></c:set>
						</c:if>
						<c:if test="${worksVO.workFirst == 2 }">
							<c:set value="보통" var="first"></c:set>
						</c:if>
						<c:if test="${worksVO.workFirst == 3 }">
							<c:set value="높음" var="first"></c:set>
						</c:if>
						<c:if test="${worksVO.workFirst == 4 }">
							<c:set value="긴급" var="first"></c:set>
						</c:if>
						
						<c:set var="part1" value="${fn:substring(worksVO.workStartdate, 0, 4)}" />
						<c:set var="part2" value="${fn:substring(worksVO.workStartdate, 4, 6)}" />
						<c:set var="part3" value="${fn:substring(worksVO.workStartdate, 6, -1)}" />
						<c:set var="startDate" value="${part1}/${part2}/${part3}" />
						
						<c:set var="endPart1" value="${fn:substring(worksVO.workEnddate, 0, 4)}" />
						<c:set var="endPart2" value="${fn:substring(worksVO.workEnddate, 4, 6)}" />
						<c:set var="endPart3" value="${fn:substring(worksVO.workEnddate, 6, -1)}" />
						<c:set var="endDate" value="${endPart1}/${endPart2}/${endPart3}" />
						
						<div class="row mt-2" style="min-height : 100px;">
							<div class="col-1"></div>
							<div class="col-4">상태 : ${status }</div>
							<div class="col-2"></div>
							<div class="col-4">시작일시 : ${startDate}</div>
							<div class="col-1"></div>
							<div class="col-1"></div>
							<div class="col-4">우선순위 : ${first }</div>
							<div class="col-2"></div>
							<div class="col-4">완료일시 : ${endDate}</div>
							<div class="col-1"></div>
							<div class="col-1"></div>
							<div class="col-4">담당자 : 
							<c:set var="otherCounter" value="0" />
								<span data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content="
									<c:forEach items="${managerNameList }" var="managerName" begin="0">
										${managerName.empName } 
									</c:forEach>
								" title="담당자 목록">
								<c:forEach items="${managerNameList }" var="managerName" begin="0" end="0">
									${managerName.empName } 
								</c:forEach>
								<c:if test="${fn:length(managerNameList) > 1 }">
									<c:forEach items="${managerNameList }" var="managerName" begin="1">
										<c:set var="otherCounter" value="${otherCounter + 1}"/>
									</c:forEach>
									외 ${otherCounter }명
								</c:if>
								</span>
							</div>
							<div class="col-2"></div>
							<div class="col-4">진척도 : ${worksVO.workProg }%</div>
							<div class="col-1"></div>
						</div>
						<hr />
							
						
						<c:if test="${worksVO.workParentNo eq 0 }">
							<div class="div-subWork">
								<div class="d-flex justify-content-between mb-1">
									<span class="fw-bold">하위 일감</span>
										<a class="btn btn-info"
											href="/works/insertchildWork?workNo=${worksVO.workNo }">하위일감
											추가</a>
								</div>
	
								<table class="table dt-responsive nowrap w-100">
									<thead>
										<tr>
											<td class="text-center">하위일감명</td>
											<td class="text-center">상태</td>
											<td class="text-center">담당자</td>
											<td class="text-center">진척률</td>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty childWorksList }">
											<tr>
												<td colspan="4" class="text-center fw-bold">하위일감이 없습니다.
												</td>
											</tr>
										</c:if>
										<c:if test="${not empty childWorksList }">
											<c:forEach items="${childWorksList }" var="childWorks">
												<c:if test="${childWorks.workStatus == 1 }">
													<c:set value="할일" var="status"></c:set>
												</c:if>
												<c:if test="${childWorks.workStatus == 2 }">
													<c:set value="진행중" var="status"></c:set>
												</c:if>
												<c:if test="${childWorks.workStatus == 3 }">
													<c:set value="완료" var="status"></c:set>
												</c:if>
												<c:if test="${childWorks.workStatus == 4 }">
													<c:set value="이슈발생" var="status"></c:set>
												</c:if>
												<tr>
													<td class="text-center"><a
														href="/works/detail?workNo=${childWorks.workNo }">${childWorks.workTitle }</a></td>
													<td class="text-center">${status }</td>
													<td class="text-center"><c:set var="firstFlag"
															value="false" /> <c:set var="otherCounter" value="0" />
														<span data-bs-toggle="popover" data-bs-trigger="hover"
														data-bs-content="
															<c:forEach items="${childWorkManagerNameList }" var="childWorkManagerEmp">
																<c:forEach items="${childWorkManagerList }" var="childWorkManager">
																	<c:if test="${childWorkManagerEmp.empNo eq childWorkManager.empNo}">
																		<c:if test="${childWorks.workNo eq childWorkManager.workNo }">
																			${childWorkManagerEmp.empName } 
																		</c:if>
																	</c:if>
																</c:forEach>
															</c:forEach>
														"
														title="담당자 목록"> 담당자 : </span> <c:forEach
															items="${childWorkManagerNameList }"
															var="childWorkManagerEmp">
															<c:forEach items="${childWorkManagerList }"
																var="childWorkManager">
																<c:if
																	test="${childWorkManagerEmp.empNo eq childWorkManager.empNo}">
																	<c:if
																		test="${childWorks.workNo eq childWorkManager.workNo and firstFlag eq 'true' }">
																		<c:set var="otherCounter" value="${otherCounter + 1}" />
																	</c:if>
																	<c:if
																		test="${childWorks.workNo eq childWorkManager.workNo and firstFlag eq 'false' }">
																		${childWorkManagerEmp.empName } 
																		<c:set var="firstFlag" value="true" />
																	</c:if>
																</c:if>
															</c:forEach>
														</c:forEach> <c:if test="${ otherCounter >= 1 }">
															외 ${otherCounter }명
														</c:if></td>
													<td class="text-center">${childWorks.workProg }%</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</c:if>


						<c:if test="${not empty fileList }">
							<h5 class="mb-3">파일</h5>
							
							
							<div class="row" style="min-height : 100px;">
								<c:forEach items="#{fileList }" var="file">
									<div class="col-xl-4">
									<div class="card mb-1 shadow-none border">
										<div class="p-2">
											<div class="row align-items-center">
												<div class="col-auto">
													<div class="avatar-sm">
														<span class="avatar-title bg-primary-lighten text-primary rounded">
															${fn:substringAfter(file.fileOriginName , '.')}
														</span>
													</div>
												</div>
												<div class="col ps-0">
													<a href="javascript:void(0);" class="text-muted fw-bold">${file.fileOriginName }</a>
													<p class="mb-0">${file.fileFancysize }</p>
												</div>
												<div class="col-auto">
													<a class="downloadLink mr-2" data-filename='${file.fileSaveName }' data-originalfilename='${file.fileOriginName }'
														class="btn btn-link btn-lg text-muted"> <i
														class="ri-download-2-line"></i>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</c:if>

						<div class="d-flex justify-content-between">
							<div>
								<a href="/works/list" class="btn btn-light">
									목록
								</a>
							</div>
							
							<c:forEach var="manager" items="${managerList }">
								<c:if test="${manager.empNo eq empInfo.empNo || empInfo.empNo eq 1}">
									<c:set value="delModBtn" var="delModBtn"/>
								</c:if>	
								
								
							</c:forEach>
							<c:if test="${not empty delModBtn }">
								<div>
									
									<a href="/works/modifyWork?workNo=${worksVO.workNo }" class="btn btn-soft-success me-2">
										수정
									</a>
									<a id="deleteBtn" class="btn btn-soft-danger">
										삭제
									</a>
								</div>
							</c:if>
						</div>
						<hr />


						<h5 class="mb-3 mt-5">댓글</h5>
						
						<c:forEach items="${commentList }" var="comments">
							<c:if test="${ comments.workCoParentNo eq 0}">
							<c:choose>
								<c:when test="${comments.workCoContent eq 'Deleted comments' }">
									<div class="d-flex align-items-center">
										<hr />
										<span class="fw-bold">삭제된 댓글입니다.</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="parentComment bg-light-lighten commentDiv">
										<div class="d-flex align-items-start p-3 mb-1 ">
											<input class="workCoNo" value="${ comments.workCoNo}" hidden>
											<img src="${comments.profileImg }" class="me-3 avatar-sm rounded-circle" />
											<div class="w-100 overflow-hidden">
												<h5 class="mt-0">${comments.empName}</h5>
												<p class="commentContent">${comments.workCoContent }</p>
												<a class="btn btn-sm btn-link text-muted p-0 ps-2 replyBtn" data-commentnumber ="${comments.workCoNo }">
													<i class="uil uil-comments-alt me-1">
													</i>답글
												</a>
											</div>
											<div class="d-grid justify-content-center">
												<div class="d-flex">
													<c:if test="${comments.workCoWriter eq empInfo.empNo || empInfo.empNo eq 1 }">
														<a href="javascript:void(0)" class="me-2 commentModifyBtn" style="white-space: nowrap;">수정</a>
														<a href="javascript:void(0)" class="commentDeleteBtn" style="white-space: nowrap;">삭제</a>
													</c:if>
												</div>
												<small class="text-muted text-nowrap text-center">
													<fmt:formatDate value="${comments.workCoDate }" pattern="yyyy-MM-dd"/>
												</small>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:if>
							<c:forEach items="${commentList }" var="replyComment">
								<c:if test="${comments.workCoNo eq replyComment.workCoParentNo }">
								
								<c:choose>
									<c:when test="${replyComment.workCoContent eq 'Deleted comments' }">
										<div class="d-flex align-items-center">
											<i class="mdi mdi-arrow-right-bottom me-2"></i>
											<span class="fw-bold">삭제된 댓글입니다.</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="d-flex align-items-start p-3 px-5 mb-1 bg-secondary-lighten commentDiv">
											<i class="mdi mdi-arrow-right-bottom me-2"></i>
											<input class="workCoNo" value="${ replyComment.workCoNo}" hidden>
											<img src="${replyComment.profileImg }" class="me-3 avatar-sm rounded-circle" />
											<div class="w-100 overflow-hidden">
												<h5 class="mt-0">${replyComment.empName}</h5>
												<p class="commentContent">${replyComment.workCoContent }</p>
											</div>
											<div class="d-grid justify-content-center">
												<div class="d-flex">
													<c:if test="${replyCcomments.workCoWriter eq empInfo.empNo || empInfo.empNo eq 1 }">
														<a href="javascript:void(0)" class="me-2 commentModifyBtn" style="white-space: nowrap;">수정</a>
														<a href="javascript:void(0)" class="commentDeleteBtn" style="white-space: nowrap;">삭제</a>
													</c:if>
												</div>
												<small class="text-muted text-nowrap pe-3">
													<fmt:formatDate value="${replyComment.workCoDate }" pattern="yyyy-MM-dd"/>
												</small>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:forEach>
							<!-- 대댓글 끝 -->
						</c:forEach>
						
						<div class="row" style="min-height : 100px; padding : 15px;">
							<div class="d-flex mb-3">
								<img id="commentImg" src="${empInfo.empProfileimg }" class="avatar-sm rounded-circle align-self-start rounded me-2" />
<%-- 								<p class="mb-0 fw-bold" id="commentName">${empInfo.empName}</p> --%>
								<div class="w-100">
									<form action="/works/addComment" method="post" >
										<input type="text" name="workNo" id="commentWorkNo" value="${worksVO.workNo}" hidden />
										<input type="text" name="workCoWriter" id="commentEmpNo" value="${empInfo.empNo}" hidden />
										<div class="d-flex align-items-center">
											<textarea class="form-control form-control-light" name="workCoContent"></textarea>
											<button class="btn btn-primary text-nowrap ms-2" style="float : right;">등록</button>
										</div>
										<sec:csrfInput/>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- end card-box -->
		</div>
		<!-- end Col -->
	</div>
	<!-- End row -->
</div>

<form action="/works/deleteWork" method="post" id="deleteForm" hidden>
	<input type="text" name="workNo" value="${worksVO.workNo}" hidden >
	<sec:csrfInput/>
</form>

<form action="/works/deleteComment" method="post" id="deleteCommentForm" hidden>
	<input type="text" name="workNo" value="${worksVO.workNo}" hidden >
	<input type="text" id="deleteCommentNumberInput" name="workCoNo" value="" hidden >
	<sec:csrfInput/>
</form>

<!-- SimpleMDE js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.js"></script>

<!-- Page init js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.inbox.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>


<script>
$(function() {
	
	
	$(".replyBtn").click(function() {
		let parentCommentNo = $(this).data('commentnumber');
		
		$(this).hide();
		
		let thisCommentBox = $(this).parents('.parentComment');
		
		let commentImg = $('#commentImg').attr('src');
		let commentName = $('#commentName').text();
		let commentWorkNo = $('#commentWorkNo').val();
		let commentEmpNo = $('#commentEmpNo').val();
		
		let html = 
			`
		<div class="pb-3 px-3 mb-1">
		<form action="/works/addComment" method="post" >
			<input type="text" name="workCoParentNo" value="\${parentCommentNo}" hidden /> 
			<input type="text" name="workNo" value="\${commentWorkNo}" hidden />
			<input type="text" name="workCoWriter" value="\${commentEmpNo}" hidden />
			<div class="d-flex align-items-center">
			<textarea class="form-control" style="width : 100%" name="workCoContent"></textarea>
			<button class="btn btn-primary ms-2 text-nowrap">등록</button>
			</div>
			<sec:csrfInput/>
		</form>
		</div>
	`;
		
		thisCommentBox.append(html);
	}) 
	
	$('#deleteBtn').click(function(e) {
		e.preventDefault();
		
// 		if(confirm("일감을 정말 삭제할까요?")) {
// 			$('#deleteForm').submit();
// 		}
		 Swal.fire({
		        title: '정말로 일감을 삭제하시겠습니까?',
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
		        		$('#deleteForm').submit();
		            });
		        	
		        	
		        }
		    });
		
		
		
	})
	
	$('.commentDeleteBtn').click(function(e) {
		e.preventDefault();
		let selectedCoNo = $(this).parents('.commentDiv').find('.workCoNo').val();
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
		
		
		
		
		
	})
	
	
	$('.downloadLink').click(function() {
	    let fileName = $(this).data("filename");
	    let originalFileName = $(this).data("originalfilename");
	    
	    $.ajax({
	        url: "/works/downloadFile",
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
	
	$('.commentModifyBtn').click(function() {
		
		if($(this).text() == "수정") {
			$(this).text("수정완료");
		}
		
		if($(this).text() == "수정완료") {
			$('#commentModifyForm').submit();
		}
		
		let thisContent = $(this).parents('.commentDiv').find('.commentContent');
		let thisCommentNo = $(this).parents('.commentDiv').find('.workCoNo').val();
		let thisWorkNo = $('#commentWorkNo').val();
		
		console.log("thisCommentNo : " + thisCommentNo);
	
		let html = `
			<form action="/works/modifyComment" id="commentModifyForm" method="post">
				<input type="text" value="\${thisCommentNo}" name="workCoNo" hidden />
				<input type="text" value="\${thisWorkNo}" name="workNo" hidden />
				<textarea class="form-control" style="width : 100%" name="workCoContent">\${thisContent.text()}</textarea>
				<sec:csrfInput/>
			</form>
		`
		thisContent.replaceWith(html);
	})
	
})
</script>
<c:if test="${not empty message }">
	<script>
	setTimeout(() => {
		
		$(function(){
			
			let workNo = ${worksVO.workNo};
			let proNo = ${worksVO.proNo};
			sendAlarm("updateWork","일감 등록","${empInfo.empName}",workNo,proNo);
		})
	}, 500);
	</script>
</c:if>   