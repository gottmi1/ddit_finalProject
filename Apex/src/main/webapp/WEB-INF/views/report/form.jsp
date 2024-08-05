<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set value="등록" var="name" />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="name" />
</c:if>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<c:if test="${status eq 'u' }">
					<h4 class="page-title">일일업무보고 수정</h4>
				</c:if>
				<c:if test="${status ne 'u' }">
					<h4 class="page-title">일일업무보고 등록</h4>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="tab-content">
						<div class="tab-pane show active">
							<div class="row">
								<div class="col-lg">
									<form action="/report/insert" method="post" id="reportForm" enctype="multipart/form-data">
										<input type="hidden" name="proNo" value="${proNo}">
										<c:if test="${status eq 'u' }">
											<input type="hidden" name="reportNo" value="${report.reportNo }" />
										</c:if>
										<div class="row">
											<div class="col-12">
												<div class="mb-3">
													<label class="form-label">제목</label>
													<input class="form-control" type="text" name="reportTitle"
														placeholder="제목을 입력해주세요" id="reportTitle"
														value="${report.reportTitle }">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12">
												<div class="mb-3">
													<label class="form-label">내용</label>
													<textarea class="form-control" name="reportContent"
														id="reportContent">${report.reportContent }</textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12">
												<div class="mb-3">
													<label class="form-label">첨부 파일</label> <input
														class="form-control" type="file"
														multiple="multiple"
														name="reportFiles">
												</div>
											</div>
										</div>

										<c:set var="fileDetails" value="${report.reportFile.fileList}" />
										<c:set var="len" value="${fn:length(fileDetails)}" />
										
										<c:if test="${len > 0}">
											<c:forEach var="fileDetailVO" items="${fileDetails}"
												varStatus="stat">
												<div class="col-xl-4 attachmentFileDel" style="margin-bottom: 5px;">
													<div class="card mb-0 shadow-none border" id="fileDetail">
														<div class="p-2">
															<div class="row align-items-center">
																<div class="col-auto">
																	<div class="avatar-sm">
																		<span class="avatar-title text-bg-secondary rounded">
																			<c:set var="split"
																				value="${fn:split(fileDetailVO.fileOriginName, '.')}"></c:set>
																			<c:set var="ext"
																				value="${fn:toUpperCase(split[fn:length(split) - 1])}"></c:set>
																			${ext}
																		</span>
																	</div>
																</div>
																<div class="col ps-0">
																	<a href="#" class="text-muted fw-bold">${fileDetailVO.fileOriginName}</a>
																	<p class="mb-0">${fileDetailVO.fileFancysize}</p>
																	<span class="btn btn-default btn-sm float-right " id="span_${fileDetailVO.fileNo }">
																		<i class="fas fa-times"></i>
																	</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>

										<div class="d-flex justify-content-between">
											<div class="d-flex">
												<c:if test="${status eq 'u' }">
													<input type="button" id="cancelBtn" value="취소"
														class="btn btn-light float-right">
												</c:if>
												<c:if test="${status ne 'u' }">
													<input type="button" id="listBtn" value="목록"
														class="btn btn-light float-right">
												</c:if>
											</div>
											<input type="button" id="reportAddBtn" value="${name }"
													class="btn btn-info float-right">
										</div>
										<sec:csrfInput />
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Select2 js  -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-mask-plugin/jquery.mask.min.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

<script>
	$(function() {
		// CKEditor 사용
		CKEDITOR
				.replace(
						"reportContent",
						{
							filebrowserUploadUrl : "${pageContext.request.contextPath}/imageUpload.do?${_csrf.parameterName}=${_csrf.token}"
						});
		CKEDITOR.config.height = "200px";

		var reportForm = $('#reportForm');
		var cancelBtn = $('#cancelBtn');
		var listBtn = $('#listBtn');
		var reportAddBtn = $('#reportAddBtn');
		
		// 게시글 등록
		reportAddBtn.on('click', function() {
			var title = $('#reportTitle').val();
			var content = CKEDITOR.instances.reportContent.getData();
			
			// 제목 공백 체크
			if (title == null || title == "") {
				Swal.fire({
		            	title : '제목을 입력해 주세요',
	       				icon : 'warning'
	       		});
//	 			$("#boTitle").focus();
				return false;
			};
			
			// 내용 공백 체크
			if (content == null || content == "") {
				Swal.fire({
	            	title : '내용을 입력해 주세요',
       				icon : 'warning'
       			});
				return false;
			};
			
			
			if ($(this).val() == "수정") {
				reportForm.attr("action", "/report/updateReport");

			};
			reportForm.submit();
		});
		
		// 목록 이동
		listBtn.on('click', function() {
			location.href = "/report/list";
		});
		
		// 수정 취소(게시글 상세=뒤로가기)		
		cancelBtn.on('click', function() {
			history.back();
		});

		// 수정시, 기존 파일 삭제 이벤트
		$(".attachmentFileDel").on('click', function() {
			var id = $(this).prop("id");
			var idx = id.indexOf("_");
			var reportFileNo = id.substring(idx + 1);
			var ptrn = "<input type='hidden' name='delReportNo' value='%V'/>";
			reportForm.append(ptrn.replace("%V", reportFileNo));
			$(this).parents(".card").hide();

		});

	});
</script>

