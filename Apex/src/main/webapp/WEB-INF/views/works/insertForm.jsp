<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Start Content-->


<c:set value="등록" var="name" />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="name" />
</c:if>
<div class="container-fluid">

	<!-- start page title -->
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">일감 ${name }</h4>
			</div>
		</div>
	</div>
	<!-- end page title -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="tab-content">
						<div class="tab-pane show active">
							<div class="row">
								<div class="col-lg">
									<form action="/works/insertWork" method="post" id="workForm" enctype="multipart/form-data">
										<c:if test="${status eq 'u' }">
											<input type="hidden" id="hiddenWorkNo" name="workNo" value="${workVO.workNo }"/>
										</c:if>
										<c:if test="${not empty parentWorkNo }">
											<input type="hidden" name="workParentNo" value="${parentWorkNo }"/>
										</c:if>
										<div class="row">
											<div class="col-12">
												<div class="mb-3">
													<label class="form-label">제목</label>
													<input class="form-control" type="text" name="workTitle" 
														placeholder="제목을 입력해주세요." required="required" id="workTitle" value="${workVO.workTitle }">
												</div>
											</div>
										</div>
										<!-- end row -->
										<div class="row">
											<div class="col-12">
												<div class="mb-3">
													<label class="form-label">내용</label>
													<textarea class="form-control" type="text" name="workContent" placeholder="내용을 입력해주세요." id="workContent" rows="2">${workVO.workContent }</textarea>
												</div>
											</div>
										</div>
										
										<div class="row text-center mt-2" style="min-height : 100px;">
										<div class="col-1"></div>
											<div class="col-4 row mb-2">
												<div class="col-3">
													<label for="" class="col-form-label">상태</label>
												</div>
												<div class="col-9">
													<select class="form-control form-select text-center" value="${workVO.workStatus }" name="workStatus" >
														<c:if test="${status ne 'u' }">
															<option value="1" selected>할 일</option>
														</c:if>
														<c:if test="${status eq 'u' }">
															<option value="1"
															<c:if test="${workVO.workStatus eq 1 }">
															selected</c:if>
															>할 일</option>
														</c:if>
														<option value="2"
															<c:if test="${workVO.workStatus eq 2 }">
															selected</c:if>
														>진행중</option>
														<option value="3"
															<c:if test="${workVO.workStatus eq 3 }">
															selected</c:if>
														>완료</option>
														<option value="4"
															<c:if test="${workVO.workStatus eq 4 }">
															selected</c:if>
														>이슈발생</option>
														
													</select>
												</div>
											</div>
											
											<c:set var="part1" value="${fn:substring(workVO.workStartdate, 0, 4)}" />
											<c:set var="part2" value="${fn:substring(workVO.workStartdate, 4, 6)}" />
											<c:set var="part3" value="${fn:substring(workVO.workStartdate, 6, -1)}" />
											<c:set var="startDate" value="${part1}-${part2}-${part3}" />
											
											<c:set var="endPart1" value="${fn:substring(workVO.workEnddate, 0, 4)}" />
											<c:set var="endPart2" value="${fn:substring(workVO.workEnddate, 4, 6)}" />
											<c:set var="endPart3" value="${fn:substring(workVO.workEnddate, 6, -1)}" />
											<c:set var="endDate" value="${endPart1}-${endPart2}-${endPart3}" />
											
											<div class="col-2"></div>
											<div class="col-4 row mb-2">
												<div class="col-3">
													<label for="" class="col-form-label">시작일시</label> 
												</div>
												<div class="col-9">
													<input class="form-control" name="workStartdate" type="date" value="${startDate }" />
												</div>
											</div>
											<div class="col-1"></div>
											<div class="col-1"></div>
											<div class="col-4 row mb-2">
												<div class="col-3">
													<label for="" class="col-form-label">우선순위</label>
												</div>													
												<div class="col-9">
													<select class="form-control form-select text-center" value="${workVO.workFirst }" name="workFirst" >
														<c:if test="${status ne 'u' }">
															<option value="1" selected>낮음</option>
														</c:if>
														<c:if test="${status eq 'u' }">
															<option value="1"
															<c:if test="${workVO.workFirst eq 1 }">
															selected</c:if>
															>낮음</option>
														</c:if>
														<option value="2"
															<c:if test="${workVO.workFirst eq 2 }">
															selected</c:if>
														>보통</option>
														<option value="3"
															<c:if test="${workVO.workFirst eq 3 }">
															selected</c:if>
														>높음</option>
													</select>
												</div>													
											</div>
											<div class="col-2"></div>
											<div class="col-4 row mb-2">
												<div class="col-3">
													<label for="" class="col-form-label">완료일시</label> 
												</div>
												<div class="col-9">
													<input class="form-control" name="workEnddate" type="date" value="${ endDate}" />
												</div>
											</div>
											<div class="col-1"></div>
											<div class="col-1"></div>
											<div class="col-4 row mb-2">
												<div class="col-3">
													<label for="" class="col-form-label">담당자 추가</label>
												</div>
												<div class="col-9">
							                        <select class="form-control form-select text-center" id="selectManager">
												        <option>담당자를 선택해주세요.</option>
													</select>
												</div>
											</div>
											<div class="col-2"></div>
											<div class="col-4 row mb-2">
												<div class="col-3">
													<label for="" class="col-form-label">진척도</label>
												</div>
												<div class="col-9">
													 <select class="form-control form-select text-center" value="${workVO.workProg }" name="workProg">
													 	<c:if test="${status ne 'u' }">
															<option value="10" selected>10%</option>
														</c:if>
														<c:if test="${status eq 'u' }">
															<option value="10"
															<c:if test="${workVO.workProg == 10 }">
															selected</c:if>
															>10%</option>
														</c:if>
														<option value="20"
															<c:if test="${workVO.workProg == 20 }">
															selected</c:if>
														>20%</option>
														<option value="30"
															<c:if test="${workVO.workProg == 30 }">
															selected</c:if>
														>30%</option>
														<option value="40"
															<c:if test="${workVO.workProg == 40 }">
															selected</c:if>
														>40%</option>
														<option value="50"
															<c:if test="${workVO.workProg == 50 }">
															selected</c:if>
														>50%</option>
														<option value="60"
															<c:if test="${workVO.workProg == 60 }">
															selected</c:if>
														>60%</option>
														<option value="70"
															<c:if test="${workVO.workProg == 70 }">
															selected</c:if>
														>70%</option>
														<option value="80"
															<c:if test="${workVO.workProg == 80 }">
															selected</c:if>
														>80%</option>
														<option value="90"
															<c:if test="${workVO.workProg == 90 }">
															selected</c:if>
														>90%</option>
														<option value="100"
															<c:if test="${workVO.workProg == 100 }">
															selected</c:if>
														>100%</option>
													</select>
												</div>
											</div>
											<div class="col-2"></div>
										</div>
										
										<div class="mb-3 mt-3" style="min-height : 60px;">
						                    <label for="" class="form-label">담당자</label>
						                   	<div class="d-flex" id="entryManager">
						                   		<c:if test="${status eq 'u' }">
						                   			<c:forEach items="${managerList }" var="manager" varStatus="stat">
						                   			<div data-empno="${manager.empNo}" class="ms-3">
<!-- 						                   				히스토리VO에 등록하기 위한 추가 hidden요소들 -->
						                   				<!-- workVO의 managerList필드에 값 필요한 이유:  들어가는 값:  --> 
<%-- 						                   				<input type="hidden" value="${manager.managerNo }" name="managerList[${stat.index }].managerNo"/> --%>
<%-- 						                   				<input type="hidden" value="${manager.workNo }" name="managerList[${stat.index }].workNo"/> --%>
<%-- 						                   				<input type="hidden" value="${manager.empNo }" name="managerList[${stat.index }].empNo"/> --%>
<%-- 						                   				<input type="hidden" value="${manager.empName }" name="managerList[${stat.index }].empName"/> --%>
						                   				${manager.empName}
						                   				<span class="ri ri-close-line"></span>
						                   			</div>
						                   		</c:forEach>
						                   		</c:if>
						                   	</div>
					                   	</div>
										
										<!-- end row -->
										<div class="row">
											<div class="col-12">
												<div class="mb-3">
													<label class="form-label">첨부 파일</label>
													<input class="form-control" type="file" multiple="multiple" name="fileList">
												</div>
											</div>
										</div>
										<!-- end row -->
										<div class="d-flex justify-content-between">
												<div class="d-flex">
												<c:if test="${status ne 'u' }">
													<a href="/works/list" class="btn btn-light float-right">목록</a>
												</c:if>
												<c:if test="${status eq 'u' }">
													<a href="/works/detail?workNo=${workVO.workNo }" class="btn btn-light float-right">취소</a>
												</c:if>
											</div>
											<div style="width : 80%"></div>
											
											<input type="button" id="btn-autoCompleteWork"
												class="btn btn-primary float-right" value="자동완성" />
												
											<input type="button" id="addBtn" value="${name }"
												class="btn btn-info float-right">
										</div>
										<!-- end row -->
										<sec:csrfInput/>
										<c:forEach items="${managerList }" var="manager">									
											<input name="entryManager" data-inputno="${manager.empNo}" value="${manager.empNo}" hidden />
										</c:forEach>
									</form>
								</div>
							</div>
							<!-- end col -->
						</div>
						<!-- end row-->
					</div>
					<!-- End Billing Information Content-->
				</div>
				<!-- end tab content-->
			</div>
			<!-- end card-body-->
		</div>
		<!-- end card-->
	</div>
	<!-- end col -->
</div>
<!-- end row-->



<!-- Footer Start -->
<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<script>
					document.write(new Date().getFullYear())
				</script>
				© Hyper - Coderthemes.com
			</div>
			<div class="col-md-6">
				<div class="text-md-end footer-links d-none d-md-block">
					<a href="javascript: void(0);">About</a> <a
						href="javascript: void(0);">Support</a> <a
						href="javascript: void(0);">Contact Us</a>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- end Footer -->



<script
	src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-mask-plugin/jquery.mask.min.js"></script>

<!-- App js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

<script>
$(function() {
	CKEDITOR
			.replace(
					"workContent",
					{
						filebrowserUploadUrl : "${pageContext.request.contextPath}/imageUpload.do?${_csrf.parameterName}=${_csrf.token}"
					});
	CKEDITOR.config.height = "200px";

	var cancelBtn = $('#cancelBtn');
	var listBtn = $('#listBtn');
	var addBtn = $('#addBtn');
	
	// 수정시 이전 담당자들 추가
	let entryLength = $('#entryManager div');
	let modifyEntryMemberNo = [];
	
	entryLength.each(function() {
	  let empno = $(this).data('empno');
	  console.log(empno);
	  modifyEntryMemberNo.push(empno);
	});
	
	// 셀렉터에 사원 목록 불러오기
	$.ajax({
		url :'/works/selectPorjectMember',
		type :'post',
		async : false,
		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	         xhr.setRequestHeader(header, token);
	      },
	    success : function(res){
	    	let html = "";
	    	for(let i = 0; i < res.length; i++) {
	    		if(!modifyEntryMemberNo.includes(res[i].empNo)) {
			    	html += `<option value="\${res[i].empNo}"><p>\${res[i].empName}</p></option>`;
	    		} else {
	    			html += `<option value="\${res[i].empNo}" style="display : none;"><p>\${res[i].empName}</p></option>`;
	    		}
	    	}
	    	$('#selectManager').append(html);
	    }
	});
	
	$('#selectManager').on('change',function() {
		
		let thisVal = $(this).val();
		
//			disabledMemberList.push(Number(thisVal));
//			console.log(disabledMemberList);
		
		// 선택한 옵션 인덱스 가져와서 숨김
		var idx = $("#selectManager option").index($("#selectManager option:selected"));
		$("#selectManager option").eq(idx).hide();
		
		
		entryLength = $('#entryManager').children().length;
		
		// 선택한 멤버 데려옴. 프사 추가해야 함.
		$.ajax({
			url :'/project/addEntryMember',
			type :'post',
			async : false,
			data : { empNo : thisVal } ,
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		     },
		    success : function(res){
		    	let addInput = `<input name="entryManager" data-inputno="\${res.empNo}" value="\${res.empNo}" hidden />`;
		    	let html = `<div data-empno="\${res.empNo}" class="ms-3">\${res.empName}<span class="ri ri-close-line"></span></div>`;
		    	
		    	$('#entryManager').append(html);
 		    	$('#workForm').append(addInput);
		    }
		});
		
		// 셀렉트 된 옵션을 처음 옵션으로 변경
		$('#selectManager').prop('selectedIndex', 0);
	})
	
	// 참여중인 사원 아이콘 클릭시 삭제하고 리스트에 보이게 하기
	$('#entryManager').on('click','span',function() {
		
		let selectedIdx = $(this).parent().data('empno');
		let leftOption = $("#selectManager option");
		leftOption.each(function() {
			if($(this).val() == selectedIdx) {
				$(this).show();
			}
		});
		$(this).parent().remove();
		
		console.log(selectedIdx);
		
		$("#workForm").find((`[data-inputno="\${selectedIdx}"]`)).remove();
	})
	
	
	addBtn.on('click', function() {
		var title = $('#workTitle').val();
		var content = CKEDITOR.instances.workContent.getData();
		var workNo = $('#hiddenWorkNo').val();
		var proNo = ${sessionScope.proNo};
		if(workNo == '' || workNo ==null){
			workNo = "0";
		} 

		if (title == null || title == "") {
// 			alert("제목을 입력해주세요");
	        Swal.fire({
	        	title : '제목을 입력해 주세요',
				icon : 'warning'
				})
				return false;
		}
		
		if (content == null || content == "") {
// 			alert("내용을 입력해주세요");
			 Swal.fire({
				title : '내용을 입력해 주세요',
				icon : 'warning'
				})
				return false;
		}
		
// 		var workVal = "일감 등록";
		workVal = "일감 수정";
		if ($(this).val() == "수정") {
			$("#workForm").attr("action", "/works/modifyWork");
		}
		
		sendAlarm("updateWork",workVal,"${empInfo.empName}",workNo,proNo);
		
		
		$('#workForm').submit();
		
	})

	listBtn.on('click', function() {
		location.href = "/works/list";
	})

	// 수정시, 기존 파일 삭제 이벤트
	$(".attachmentFileDel").on('click', function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var noticeFileNo = id.substring(idx + 1);
		var ptrn = "<input type='hidden' name='delBoardNo' value='%V'/>";
		noticeForm.append(ptrn.replace("%V", noticeFileNo));
		$(this).parents("li:first").hide();
	})

	$('#btn-autoCompleteWork').click(function() {
		$('#workTitle').val('최종 프로젝트 발표');
		CKEDITOR.instances.workContent.setData(`
				<p>3조 최종 프로젝트 발표에 대한 일감입니다.</p>
				`);
		$('select[name=workStatus]').val(2);
		$('select[name=workFirst]').val(3);
		$('input[name=workStartdate]').val('2024-08-05');
		$('input[name=workEnddate]').val('2024-08-05');
		$('select[name=workProg]').val(80);
		
	})
	
})
</script>

