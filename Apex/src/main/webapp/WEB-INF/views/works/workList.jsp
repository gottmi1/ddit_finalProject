<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">일감게시판</h4>
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
							<div class="d-flex text-sm-start">
								<a href="/works/insertWork" class="btn btn-info mb-2">
								등록
								</a>
								<div style="width : 20px"></div>
								<select class="form-control form-select" id="select-workStatus" style="width : auto;">
									<option value="0">전체</option>
									<option value="1" <c:if test="${pagingVO.workStatus eq 1 }">selected</c:if>
									>할일</option>
									<option value="2" <c:if test="${pagingVO.workStatus eq 2 }">selected</c:if>
									>진행중</option>
									<option value="3" <c:if test="${pagingVO.workStatus eq 3 }">selected</c:if>
									>완료</option>
									<option value="4" <c:if test="${pagingVO.workStatus eq 4 }">selected</c:if>
									>이슈발생</option>
								</select>
							</div>
						</div>
						
						<div class="col-sm-4 pe-0">
							<form class="input-group input-group-sm row" id="searchForm">
							<div class="col-4">
								<input type="hidden" name="page" id="page" /> 
								<select class="form-control form-select" name="searchType">
									<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
								</select> 
								<input hidden name="workStatus" value="${pagingVO.workStatus}" />
							</div>
							<div class="col-8 d-flex pe-0">
								<input type="text" name="searchWord" value="${searchWord }" class="form-control float-right" placeholder="검색할 내용">
								<button type="submit" class="btn btn-primary text-nowrap">
									검색
								</button>
							</div>
							<sec:csrfInput />
							</form>
						</div>
						<!-- end col-->
					</div>

					<div class="table-responsive">
						<table id="alternative-page-datatable"
							class="table table-hover nowrap text-center">
							<thead class="table-apex">
								<tr>
									<th>일감번호</th>
									<th>상태</th>
									<th>제목</th>
									<th>담당자</th>
									<th>최근수정일시</th>
								</tr>
							</thead>
							<tbody>
								<!-- 
								pagingVO.dataList : List<BoardVO>
								 -->
								<c:forEach var="worksVO" items="${pagingVO.dataList}" varStatus="stat">
									<c:set var="fFlag" value="false" />
									<tr>
										<td>${worksVO.workNo}</td>
										
										<c:if test="${worksVO.workStatus == 1 }">
											<c:set value="할일" var="status"></c:set>
											<c:set value="badge bg-info" var="badge"></c:set>
										</c:if>
										<c:if test="${worksVO.workStatus == 2 }">
											<c:set value="진행중" var="status"></c:set>
											<c:set value="badge bg-primary" var="badge"></c:set>
										</c:if>
										<c:if test="${worksVO.workStatus == 3 }">
											<c:set value="완료" var="status"></c:set>
											<c:set value="badge bg-success" var="badge"></c:set>
										</c:if>
										<c:if test="${worksVO.workStatus == 4 }">
											<c:set value="이슈발생" var="status"></c:set>
											<c:set value="badge bg-light" var="badge"></c:set>
										</c:if>
										
										<td><h4 class="${badge }">${status }</h4></td>
										<td class="text-start"><a href="/works/detail?workNo=${worksVO.workNo }">${worksVO.workTitle}</a></td>
										<td>
											<c:forEach items="${ allManagerList}" var="manager">
												<c:forEach items="${ allEmpList}" var="emp">
													<c:if test="${manager.empNo == emp.empNo and manager.workNo == worksVO.workNo and fFlag == 'false'}">
														${emp.empName }
														<c:set var="fFlag" value="true" />
													</c:if>
												</c:forEach>
											</c:forEach>
										</td>
										<td>
											<fmt:formatDate value="${worksVO.workDate}" pattern="yyyy-MM-dd hh:mm:ss" />
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="d-flex justify-content-end">
							<div id="pagingArea">${pagingVO.getPagingHTML()}</div>
						</div>
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

<script type="text/javascript">
	$(function() {
		var pagingArea = $("#pagingArea");
		var searchForm = $("#searchForm");
		
		pagingArea.on('click','a',function(event){
			event.preventDefault();
			var pageNo = $(this).data("page");
			
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
		
		$('#select-workStatus').change(function() {
			let workStatus = $(this).val();
			location.href = "/works/list?workStatus=" + workStatus;
		})
		
	});
	
</script>
