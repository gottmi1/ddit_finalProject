<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="wrapper">
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
<!-- 				<div class="page-title-right"> -->
<!-- 					<ol class="breadcrumb m-0"> -->
<!-- 						<li class="breadcrumb-item"><a href="javascript: void(0);">메인</a></li> -->
<!-- 						<li class="breadcrumb-item active">자유게시판</li> -->
<!-- 					</ol> -->
<!-- 				</div> -->
				<h4 class="page-title">프로젝트 목록</h4>
			</div>
		</div>
	</div>
	<!-- end page title -->

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row mb-2">
						<div class="col-sm-8">
							<div class="text-sm-start">
								<div class="d-flex justify-content-start">
									<form action="/myProject" id="form-selectFilter" method="get">
										<select class="form-select" name="filter" style="width : auto;" id="filterProject" selectedIndex="1">
											<option disabled>--- 상태 ---</option> 
											<option value="0"
											<c:if test="${empty selectedStatus or selectedStatus == 0}">
												selected
											</c:if>
											>전체</option>
											<option value="1"
											<c:if test="${selectedStatus == 1}">
												selected
											</c:if>
											>승인 요청</option>
											<option value="2"
											<c:if test="${selectedStatus == 2}">
												selected
											</c:if>
											>진행중</option>
											<option value="3"
											<c:if test="${selectedStatus == 3}">
												selected
											</c:if>
											>반려</option>
											<option value="4"
											<c:if test="${selectedStatus == 4}">
												selected
											</c:if>
											>완료</option>
										</select>
									</form>
								</div>
							</div>
						</div>
					</div>

					<div class="table-responsive">
						<table id="alternative-page-datatable"
							class="table table-hover nowrap text-center">
							<thead class="table-apex">
								<tr>
									<th>번호</th>
									<th>프로젝트명</th>
									<th>담당자</th>
									<th>시작일자</th>
									<th>마감일자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${projectList }" var="project">
									<tr class="align-middle">
									<td>
										<p class="mb-0 proNo">
											${project.proNo }
										</p>
									</td>
									<td class="text-start mb-0">
										<c:if test="${project.proStatus == 1 }">
											<h4 class="badge bg-info p-1">승인요청</h4>
										</c:if>
										<c:if test="${project.proStatus == 2 }">
											<h4 class="badge bg-primary p-1">진행중</h4>
										</c:if>
										<c:if test="${project.proStatus == 3 }">
											<h4 class="badge bg-light text-dark p-1">반려</h4>
										</c:if>
										<c:if test="${project.proStatus == 4 }">
											<h4 class="badge bg-success p-1">완료</h4>
										</c:if>
									<a href="javascript:void(0)" class="a-toSelectProjectList" data-prono="${project.proNo }">${project.proName }</a></td>
									<td><img src="${project.leaderProfileimg}" class="img-thumbnail avatar-sm rounded-circle me-2" /> ${project.leaderName }</td>
									<td>${fn:substring(project.proStartdate, 0, 10)}</td>
									<td>${fn:substring(project.proEnddate, 0, 10)}</td>
									
									<c:choose>
										<c:when test="${project.proStatus == 2}">
											<td data-title="${project.proName }" data-enddate="${fn:substring(project.proEnddate, 0, 10)}" data-content="${project.proContent }">
												<c:if test="${project.proLeader == empInfo.empNo}">
													<button class="btn btn-soft-success btn-prjectModifyModal" data-bs-toggle="modal" data-bs-target="#modifyProejct-modal">수정</button>
												</c:if>
												<c:if test="${project.projectComplete eq true and project.proLeader == empInfo.empNo}">
													<button class="btn btn-soft-primary btn-proejctComplete">완료</button>
												</c:if>
											</td>
										</c:when>
										<c:when test="${project.proStatus == 3}">
											<td>
												<button class="btn btn-outline-secondary btn-projectReason" data-reason="${project.proRejectReason }" >반려사유</button>
											</td>
										</c:when>
										<c:when test="${project.proStatus == 4 }">
											<td>
												<a href="#" class="projectFinishedReportViewer" data-prono="${project.proNo}">
													<img src="${pageContext.request.contextPath }/resources/assets/images/pdf.jpg" width="7%" />
												</a>
											</td>
										</c:when>
										<c:otherwise>
											<td>
											</td>
										</c:otherwise>
									</c:choose>
									
								</tr>
								</c:forEach>	
							</tbody>
						</table>
						<nav aria-label="Page navigation example" id="pagingArea" class="d-flex justify-content-end">
							${pagingVO.getPagingHTML()}
						</nav>
					</div>
				</div>
				<!-- end card-body-->
			</div>
			<!-- end card-->
		</div>
		<!-- end col -->
	</div>
	<!-- end row -->

	<div class="row">
		<div class="col-12">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-end" id="pagination">
					<!-- 페이징 UI 출력 -->
				</ul>
			</nav>
		</div>
	</div>

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
						<a href="javascript: void(0);">About</a> 
						<a href="javascript: void(0);">Support</a> 
						<a href="javascript: void(0);">Contact Us</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end Footer -->
</div>

<form action="/myProject/completeProject" method="post" id="form-completeProject" hidden>
	<input type="hidden" name="proNo" id="input-completeProjectProNo" />
	<sec:csrfInput/>
</form>

<div id="modifyProejct-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
           	<div class="modal-header">
                  	<h4 class="modal-title">프로젝트 수정</h4>
           	</div>
            <div class="modal-body">
                
                <form action="/myProject/modifyProject" method="post" id="form-modifyProject" class="ps-3 pe-3">

                    <div class="mb-3 mt-3 row">
                        <label class="form-label text-center col-5">프로젝트명</label>
                        <div class="col-7">
	                        <span id="span-proName"></span>
	                        <input type="hidden" id="input-proName" name="proName" />
                        </div>
                    </div> 
                    
                    <div class="mb-3 row">
                        <label class="col-form-label text-center col-5">프로젝트 설명</label>
                        <div class="col-7">
	                        <textarea class="form-control" rows="3" id="input-projectContent" name="proContent"></textarea>
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label class="col-form-label text-center col-5">프로젝트 마감일</label>
                        <div class="col-7">
	                        <input type="date" class="form-control" id="input-projectEnddate" name="proEnddate"/>
                        </div>
                    </div>
                    
                    <input type="hidden" id="input-projectModifyProNo" name="proNo"/>
					<sec:csrfInput/>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
                <button id="btn-modifyProject" type="button" class="btn btn-primary">수정</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<c:if test="${msg eq 'u'}">
	    <script>
	        Swal.fire({title : '프로젝트의 정보가 수정되었습니다.',
				icon : 'success'});
	    </script>
	</c:if>
    
    <c:if test="${msg eq 'c'}">
	    <script>
	        Swal.fire({title : '프로젝트가 완료처리 되었습니다.',
				icon : 'success'});
	    </script>
	</c:if>


<!-- Datatable js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-datatables-checkboxes/js/dataTables.checkboxes.min.js"></script>

<!-- Product Demo App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.products.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>


<script type="text/javascript">
	$(function() {
		// 등록모달 on
		$('.approveModalBtn').click(function() {
			let proNo = $(this).parent().parent().find('.proNo').text();
// 			alert("proNo : " + proNo);
			$.ajax({
				url : "/project/selectProject",
				type : "post",
				data : JSON.stringify({ proNo : proNo}),
				contentType : 'application/json',
				beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
					xhr.setRequestHeader(header, token);
				},
				success : function(res) {
					console.log(res);
					$('#span-proName').text(res.proName);
					$('#span-proContent').text(res.proContent);
					let formatEnd = res.proEnddate.substring(0,10);
					$('#span-proEnddate').text(formatEnd);
					$('#hidden-proNo').val(res.proNo);
					
				},
				error : function(xhr){
					alert(xhr.status);
				}
			})
		});
		
		// 반려모달 on
		$('.companionBtn').click(function() {
			$('#companion-reason').val('');
			let proNo = $(this).parent().parent().find('.proNo').text();
			console.log(proNo);
			$.ajax({
				url : "/project/selectProject",
				type : "post",
				data : JSON.stringify({ proNo : proNo}),
				contentType : 'application/json',
				beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
					xhr.setRequestHeader(header, token);
				},
				success : function(res) {
					$('#span-proName2').text(res.proName);
					$('#hidden-proNo').val(res.proNo);
					
				},
				error : function(xhr){
					alert(xhr.status);
				}
			})
		});
		
		// 승인버튼 클릭
		$(document).on('click','#btn-approveProject',function(){
			let proNo = $('#hidden-proNo').val();
			let proName = $('#span-proName').text();
			$('#approveProejct-modal').hide();
			// 실시간 알림으로 보내기
			sendAlarm("approveProject",proName,"${empInfo.empName}",0,proNo);
			
			
			setTimeout(() => {
				$.ajax({
					url : "/project/approveProject",
					type : "post",
					data : JSON.stringify({ proNo : proNo }),
					contentType : 'application/json',
					beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
						xhr.setRequestHeader(header, token);
					},
					success : function(res){
						Swal.fire({
		                    title: '승인이 완료되었습니다.',
		                    icon: 'info'
		                }).then(() => {
		                    location.reload();
		                });
					},
					error : function(xhr){
						alert(xhr.status);
					}
					
				});
				
			}, 500);
		});
		
		$('.btn-projectReason').click(function() {
			Swal.fire({
                title: "반려사유",
                text : $(this).data('reason'),
                icon: 'warning'
            })
		})
		
		
	// 이 아래로 사용할 거
	$(document).on('click','.a-toSelectProjectList',function(e){
        let proNo = $(this).data('prono');
        
        $.ajax({
        	url : '/project/sessionInputProNo',
        	type :'post',
        	contentType : 'application/json',
        	data : JSON.stringify({ proNo : proNo}),
        	beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		    },
        	success : function(res){
        		location.href = "/works/list";
        	}, 
        	
        })
	})
	
	
	$('#filterProject').change(function() {
		$('#form-selectFilter').submit();
	})
	
	// 수정버튼 클릭시 텍스트아리아와 데이트인풋에 값 넣기
	$('.btn-prjectModifyModal').click(function() {
		let title = $(this).closest('td').data('title');
		let con = $(this).closest('td').data('content');
		let enddate = $(this).closest('td').data('enddate');
		let proNo = $(this).closest('tr').find('.proNo').text().trim();
		
		$('#span-proName').text(title);
		$('#input-proName').val(title);
		$("#input-projectContent").val(con);
		$("#input-projectEnddate").val(enddate);
		$('#input-projectModifyProNo').val(proNo);
	})
	
	$('#btn-modifyProject').click(function() {
		// submit하면 됨
		$('#form-modifyProject').submit();
	})
	
	
	$('.btn-proejctComplete').click(function() {
		let proNo = $(this).closest('tr').find('.proNo').text().trim();
		$('#input-completeProjectProNo').val(proNo);
		
		Swal.fire({
            title: "프로젝트 완료",
            text : "프로젝트를 완료하시겠습니까?",
            icon: 'info',
            showCancelButton: true,
           	confirmButtonText: '완료',
	        cancelButtonText: '취소'
        }).then((result) => {
        	if (result.isConfirmed) {
        		$('#form-completeProject').submit();
	        } else {
	            Swal.fire({
	                title: '취소되었습니다.',
	                icon: 'info'
	            });
	        }
        })
	})
	
	// ------------------ 프로젝트 완료보고서 PDF 뷰어--------------------------
		
		$('.projectFinishedReportViewer').on('click', function() {
			
// 			event.preventDefault(); // 기본 링크 동작 막기
			var reportProNo = this.getAttribute('data-prono');
	        window.open('${pageContext.request.contextPath}/project/finishedReport?proNo=' + reportProNo, '_blank');
			
		});
		
	// ------------------ 프로젝트 완료보고서 PDF 뷰어--------------------------
	
})
</script>
