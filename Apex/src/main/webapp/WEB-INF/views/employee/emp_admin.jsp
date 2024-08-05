<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>

/* datatables search 숨김 */
#example1_filter{
	display: none;
}
</style>

<!-- Start Content-->
<%-- <c:if test="${status eq 'insert' }"> --%>
<%-- 	<c:set value="등록" var="name" /> --%>
<%-- </c:if> --%>
<%-- <c:if test="${status eq 'u' }"> --%>
<%-- 	<c:set value="수정" var="name" /> --%>
<%-- </c:if> --%>
<%-- <c:if test="${status eq 'detail' }"> --%>
<%-- 	<c:set value="상세보기" var="name" /> --%>
<%-- </c:if> --%>
<%-- <c:if test="${status eq 'insert' }"> --%>
<%-- 	<c:set value="등록" var="name" /> --%>
<%-- </c:if> --%>


<!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box ">
              <h4 class="page-title">사원 관리</h4>
         </div>
     </div>
</div>
<!-- end page title -->

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="row mb-2">
					<!-- 사원 등록 -->
					<div class="col-9">
						<input type="button" id="empAddBtn" value="사원 등록" class="btn btn-info mb-2">
<!-- 						<a href="" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-2"></i>등록</a> -->
					</div>
					<!-- 사원 검색 -->
					<div class="col-3">
						<div class="app-search dropdown d-none d-lg-block">
							<form id="searchForm">
								<div class="input-group" style="width: 410px;">
									<input type="search" id="searchWord" name="searchWord" value="${searchWord}" class="form-control dropdown-toggle" placeholder="사원명을 입력해 주세요.">
									<span class="mdi mdi-magnify search-icon"></span>
									<button class="input-group-text btn btn-primary" type="submit">검색</button>
								</div>
<!--                             	<sec:csrfInput/> -->
						   </form>
						</div>
					</div><!-- end col-->
				</div>
				
				<!-- 본문 -->
				<div class="table-responsive" style="overflow-x: visible;">
					<div class="example1_wrapper" class="dataTables_wrapper dt-bootstrap5">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-centered table-striped dt-responsive nowrap w-100" id="products-datatable" aria-describedby="example1_info">
<!-- 							<table class="table table-centered table-striped dt-responsive nowrap w-100" id="example1" aria-describedby="example1_info"> -->
								<thead>
									<tr>
<!-- 										<th onclick="event.cancelBubble=true"> -->
<!-- 											<div class="form-check"> -->
<!-- 												<input type="checkbox" class="form-check-input" placeholder="" id="customCheck1"> -->
<!-- 												<label class="form-check-label" for="customCheck1">&nbsp;</label> -->
<!-- 											</div> -->
<!-- 										</th> -->
										<th onclick="event.cancelBubble=true">No<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">사번<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">이름<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">직급<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">핸드폰번호<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">주소<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">이메일<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">입사일<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
										<th onclick="event.cancelBubble=true">재직여부<i class="ri-sort-desc" style="margin-left: 5px;"></i></th>
<!-- 										<th>상세보기</th> 상세보기 버튼을 위한 열 추가 -->
									</tr>
								</thead>
								<tbody>
									<c:set value="${dataList }" var="employeeList"/>
									<!-- 회원 비어있을때 -->
									<c:choose>
									<c:when test="${empty employeeList }">
									<tr>
										<td>
											<div class="form-check">
												<input type="checkbox" class="form-check-input" id="customCheck${status.index}">
												<label class="form-check-label" for="customCheck${status.index}">&nbsp;</label>
											</div>
										</td>
										<td colspan="8">조회하실 사원 목록이 존재하지 않습니다.</td>
									</tr>
									</c:when>
									<c:otherwise>
									<!-- 회원 있을때 -->
									<c:forEach items="${employeeList }" var="employee" varStatus="status">
										<tr>
<!-- 											<td> -->
<!-- 												<div class="form-check"> -->
<%-- 													<input type="checkbox" class="form-check-input clsEmpNo" data-emp-no="${employee.empNo}" id="customCheck${status.index+2}"> --%>
<%-- 													<label class="form-check-label" for="customCheck${status.index+2}">&nbsp;</label> --%>
<!-- 												</div> -->
<!-- 											</td> -->
											<td style="">${employee.empNo }</td>
											<td style="">${employee.empId }</td>
											<td class="table-user" data-empno="${employee.empNo}">
												<%-- 						                                                    	<a href="/employee/detail.do?empNo=${employee.empNo}" class="text-body fw-semibold"></a> --%>
<%-- 												<c:if test="${employee.empProfileimg eq null}"> --%>
<!-- 													<i class="mdi mdi-24px mdi-account" style="vertical-align: middle; cursor: pointer;"></i> -->
<%-- 												</c:if> --%>
												<c:choose>
													<c:when test="${employee.empProfileimg eq null}">
														<div class="md-0" style="display: flex; align-items: center; gap: 0px;">
															<i class="mdi mdi-24px mdi-account me-2 rounded-circle" style="width:30px; height:30px vertical-align: middle; cursor: pointer;"></i>
<!-- 															<img src="" alt="프로필사진" class="mdi mdi-24px mdi-account me-2 rounded-circle"> -->
															<span>&nbsp;${employee.empName }</span>
														</div>
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath }${employee.empProfileimg }" alt="프로필사진" class="me-2 rounded-circle">
														${employee.empName }
													</c:otherwise>
												</c:choose>
											</td>
											<td>${employee.positionName }</td>
											<td>${employee.empPhone }</td>
											<c:choose>
												<c:when test="${employee.empPostcode eq null}">
													<td>${employee.empPostcode } ${employee.empAddress1 } ${employee.empAddress2 }</td>
												</c:when>
												<c:otherwise>
													<td>(${employee.empPostcode }) ${employee.empAddress1 } ${employee.empAddress2 }</td>
												</c:otherwise>
											</c:choose>
											<td>${employee.empMail }</td>
											<td>${employee.empIndate }</td>
											<td class="sorting_1">
												<c:choose>
												<c:when test="${employee.empFireyn == 'N'}">
													<span class="badge badge-success-lighten">재직</span>
												</c:when>
												<c:when test="${employee.empFireyn == 'Y'}">
													<span class="badge badge-danger-lighten">퇴직</span>
												</c:when>
												</c:choose>
											</td>
<!-- 											<td> -->
<%-- 						                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#register-modal" data-status="view" data-empno="${employee.empNo}"> --%>
<!-- 						                                상세보기 -->
<!-- 						                            </button> -->
<!-- 						                    </td> -->
										</tr>
									</c:forEach>									
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>	
					</div>
<!-- 					</div> -->
					</div>
				</div><!-- table-responsive -->   
			</div> <!-- end card-body-->
		</div> <!-- end card-->
	</div> <!-- end col -->
</div>
<!-- end row -->
   
 

<script type="text/javascript">

$(function() {

	// 사원 관리 페이지 - 검색 이벤트
	$('#searchForm').on('submit', function(event) {
        event.preventDefault();
        var searchWord = $('#searchWord').val();
        console.log(" ## Search word: " + searchWord); // 디버깅 로그 추가
        this.submit();
    });
	
  	//-----------------------------정렬 아이콘 시작 ------------------------------------
	
	var sortOrder = {}; // 각 열의 정렬 순서를 저장하는 객체

    // 정렬아이콘에 sortTable 함수를 추가
    $('th i.ri-sort-desc').on('click', function() {
        var columnIndex = $(this).parent().index();
        sortTable(columnIndex);
    });
	
	//정렬 함수
	function sortTable(columnIndex) {
	    var table = $('#products-datatable');
	    var tbody = table.find('tbody');
	    var rows = tbody.find('tr').get();
	
	 	// 정렬 순서를 토글
	    sortOrder[columnIndex] = !sortOrder[columnIndex];
	
	    rows.sort(function(a, b) {
	        var cellA = $(a).children('td').eq(columnIndex).text().toUpperCase();
	        var cellB = $(b).children('td').eq(columnIndex).text().toUpperCase();
	        if (cellA < cellB) {
	            return sortOrder[columnIndex] ? 1 : -1;
	        }
	        if (cellA > cellB) {
	            return sortOrder[columnIndex] ? -1 : 1;
	        }
	        return 0;
	    });
	
	    $.each(rows, function(index, row) {
	        tbody.append(row);
	    });
	
	    $.each(rows, function(index, row) {
	        tbody.append(row);
	    });
	}
 	
});


</script>