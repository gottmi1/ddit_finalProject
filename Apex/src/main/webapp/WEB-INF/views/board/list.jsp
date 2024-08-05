<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">자유게시판</h4>
			</div>
			
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row mb-2">
						<div class="col-sm-8">
							<div class="text-sm-start">
								<a href="/board/insert" class="btn btn-info mb-2">
									등록
								</a>
							</div>
						</div>
						<div class="col-sm-4 pe-0">
							<form class="input-group input-group-sm row" id="searchForm">
								<div class="col-4">
									<input type="hidden" name="page" id="page" /> 
									<select class="form-select me-3" name="searchType">
										<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
										<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
									</select> 
								</div>
								<div class="col-8 d-flex pe-0">
									<input type="text" name="searchWord" value="${searchWord }" class="form-control float-right" placeholder="검색어를 입력하세요.">
									<button type="submit" class="btn btn-primary text-nowrap">
										검색
									</button>
								</div>
								<sec:csrfInput />
							</form>
						</div>
					</div>
					<div class="table-responsive">
						<table id="alternative-page-datatable" class="table table-hover nowrap text-center">
							<thead class="table-apex">
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:set value="${pagingVO.dataList}" var="boardList" />
								<!-- 
								pagingVO.dataList : List<BoardVO>
								 -->
								<c:choose>
									<c:when test="${empty boardList }">
										<tr>
											<td colspan="5">등록된 게시글이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="board" items="${boardList}" varStatus="stat">
											<tr>
												<td>${board.rnum}</td>
												<td class="text-start">
													<a href="/board/detail?boNo=${board.boNo}">${board.boTitle}</a></td>
												<td>${board.boWriter}</td>
												<td>
													<fmt:formatDate value="${board.boDate}" pattern="yyyy-MM-dd" /></td>
												<td>${board.boHit}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="d-flex justify-content-end">
							<div id="pagingArea">${pagingVO.getPagingHTML()}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



<!-- Datatable js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-datatables-checkboxes/js/dataTables.checkboxes.min.js"></script>

<!-- Product Demo App js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.products.js"></script> --%>

<!-- App js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script> --%>

<script type="text/javascript">
	$(function() {
		var pagingArea = $("#pagingArea");
		var searchForm = $("#searchForm");
		
		// 페이징 버튼
		pagingArea.on('click', 'a', function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			// 검색 시 사용할 form태그안에 넣어준다.
			// 검색 시 사용할 fomr태그를 활용해서 검색도 하고 페이징 처리도 같이 함
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
	});
</script>
