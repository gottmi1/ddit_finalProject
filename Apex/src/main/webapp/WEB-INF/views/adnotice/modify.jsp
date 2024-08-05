<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="page-title-box ">
                 <h4 class="page-title">공지사항 수정</h4>
                <%-- <h4 class="page-title">${notice.noticeTitle}</h4> --%> 
            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <!-- Steps Information -->
                    <div class="tab-content">
                        <!-- Billing Content-->
                        <div class="tab-pane show active" id="billing-information">
                            <form action="${pageContext.request.contextPath}/adnotice/modify.do" method="post">
                                <input type="hidden" name="projectNo" value="${pno }"/>
                                <input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
                                <div class="row">
                                    <div class="col-lg">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="billing-first-name" class="form-label">제목</label>
                                                    <input class="form-control" type="text" name="noticeTitle" placeholder="제목을 입력해주세요." id="title" value="${notice.noticeTitle}" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-3 mt-3">
                                            <label for="example-textarea" class="form-label">내용</label>
                                            <textarea class="form-control" id="content" rows="10" name="noticeContent" placeholder="내용을 작성해 주세요.">${notice.noticeContent}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <!-- end row -->
    
                                <div class="row mt-4">
                                    <div class="col-sm-6">
                                        <a href="${pageContext.request.contextPath }/adnotice/list" class="btn btn-light">
                                           	취소
                                        </a>
                                    </div>
                                    <!-- end col -->
                                    <div class="col-sm-6">
                                        <div class="text-sm-end">
                                            <button type="submit" class="btn btn-info">수정 </button>
                                        </div>
                                    </div>
                                </div>
                                <sec:csrfInput/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- CKEditor CDN -->
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

<!-- CKEditor 초기화 -->
<script>
    CKEDITOR.replace('content', {
        removePlugins: 'image,uploadimage,uploadfile'
    });
</script>

<style>
#content {
    width: 100%;
    height: 300px;
}
</style>