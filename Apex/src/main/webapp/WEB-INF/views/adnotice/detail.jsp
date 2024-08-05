<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- fmt 태그 라이브러리 추가 -->

<!-- Begin page -->
<div class="wrapper">

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <!-- start page email-title -->
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box ">
                 <h4 class="page-title">공지사항</h4>
                <%-- <h4 class="page-title">${notice.noticeTitle}</h4> --%> 
            </div>
        </div>
    </div>
    <!-- end page title -->
    <!-- end page email-title -->

    <div class="row">

        <!-- Right Sidebar -->
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="mt-3">
                        <h5 class="font-21">${notice.noticeTitle }</h5>

                        <hr class="titleBorder"/>
                        
                        <div class="mb-3 mt-1">
	                        <div class="d-flex justify-content-between">
	                      		<div class="d-flex align-items-center">
		                      		 <img src="${pageContext.request.contextPath }${empVO.empProfileimg}" alt="noimg" class="img-thumbnail avatar-sm rounded-circle me-2">
		                             <h6 class="font-14">${notice.noticeWriter }</h6>
	                        	</div>
	                        	<div class="d-grid">
	                             <small>등록 날짜: <fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd"/></small>
	                            	<c:if test="${notice.noticeModdate != null}">
	                            		<small>수정 날짜: 
	                                    	<fmt:formatDate value="${notice.noticeModdate }" pattern="yyyy-MM-dd"/>
	                            		</small>
	                            	</c:if>
	                        	</div>
	                        </div>
                        </div>
                        <div style="min-height: 200px; margin-top: 0;">${notice.noticeContent }</div>
                        <hr />

                        <!-- end row -->

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath }/adnotice/list" class="btn btn-light">
                                    	 목록
                                </a>
	                        <sec:authentication property="principal.employeeVO.empId" var="loginId"/><!-- 인증 객체정보를 꺼내는 방법 -->
	                        <c:if test="${loginId eq leader }">
                                <div class="d-flex">
                                	<form id="modifyEnterForm" action="${pageContext.request.contextPath}/adnotice/modify" method="post">
	                                    <button type="button" id="modifyNotice" class="btn btn-soft-success me-2">
	                                        	 수정
	                                    </button>
                                		<input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
                                		<sec:csrfInput/>
                                	</form>
                                    <button type="button" class="btn btn-soft-danger" onclick="deleteNotice()">
                                         	삭제
                                    </button>
                                </div>
	                        </c:if>
                           </div>
                        <form action="${pageContext.request.contextPath}/adnotice/delete.do" method="post" name="delForm" id="delForm">
                            <input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
                            <input type="hidden" name="pno" value="${notice.projectNo}"/> <!-- 프로젝트 번호를 추가 -->
                            <sec:csrfInput/>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- end card-box -->

        </div>
        <!-- end Col -->
    </div>
    <!-- End row -->

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</div>
<!-- END wrapper -->


<!-- SimpleMDE js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.js"></script>

<!-- Page init js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.inbox.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

<script type="text/javascript">
$(function(){
	$('#modifyNotice').on('click',function(){
		$('#modifyEnterForm').submit();
	})
	
})
var delForm = document.delForm;
function deleteNotice() {
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
    
    
}
</script>