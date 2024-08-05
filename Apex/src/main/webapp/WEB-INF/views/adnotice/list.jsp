<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <div class="wrapper">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <h4 class="page-title">공지사항</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col-sm-8">
                                <sec:authentication property="principal.employeeVO.empId" var="loginId"/><!-- 인증된 객체정보를 꺼내는 방법 -->
								<c:if test="${loginId eq leader }">
                                	<div class="text-sm-start">
                                    	<a href="/adnotice/form.do" class="btn btn-info mb-2">등록</a>
                                	</div>
								</c:if>
                                </div>
                                <div class="col-sm-4 pe-0">
                                   	<form action="/adnotice/list" class="input-group input-group-sm row" id="searchForm" method="post">
                                   		<div class="col-4">
											<input type="hidden" name="page" id="page"/>
											<select class="form-select me-3" name="searchType">
												<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
												<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
											</select> 
                                   		</div>
										<div class="col-8 d-flex pe-0">
											<input type="text" name="searchWord" value="${searchWord }" class="form-control float-right" placeholder="Search">
											<button type="submit" class="btn btn-primary text-nowrap">
												검색
						 					</button>
										</div> 
										<sec:csrfInput/>
									</form>
                                </div><!-- end col-->
                            </div>

                            <div class="table-responsive">
                                <table class="table table-hover nowrap text-center">
                                    <thead class="table-apex">
                                        <tr>
											<th>NO</th>
											<th>제목</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody id="adnoticeTableBody">
										<!-- 
										pagingVO.dataList : List<BoardVO>
										 -->
										<c:set value="${pagingVO.dataList}" var="noticeList"/>
										<c:choose>
											<c:when test="${empty noticeList }">
												<tr>
													<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="noticeVO" items="${noticeList}" varStatus="stat">
												<tr>
													<td>${noticeVO.rnum}</td>
													<td class="text-start"><a href="/adnotice/detail.do?noticeNo=${noticeVO.noticeNo}">${noticeVO.noticeTitle}</a></td>
													<td><fmt:formatDate value="${noticeVO.noticeDate}" pattern="yyyy-MM-dd" /></td>
													<td>${noticeVO.noticeHit}</td>
												</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
                                    </tbody>
                                </table>
						        <nav aria-label="Page navigation example" id="pagingArea" class="d-flex justify-content-end">
						        	${pagingVO.pagingHTML }
						        </nav>
                            </div>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->

    


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
	$(function(){
		var pagingArea = $("#pagingArea");
		var searchForm = $("#searchForm");
		
		pagingArea.on('click','a',function(event){
			event.preventDefault();
			var pageNo = $(this).data("page");
			// 검색 시 사용할 form태그 안에 넣어준다.
			// 검색 시 사용할 form 태그를 활용해서 검색도 하고 페이징 처리도 같이 함
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
	});
	</script>