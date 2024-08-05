<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box ">
                 <h4 class="page-title">공지사항 등록</h4>
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
                            <form action="/adnotice/insert.do" method="post" id="insertNoticeForm">
                                <input type="hidden" name="projectNo" value="${pno }"/> 
                                <div class="row">
                                    <div class="col-lg">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="billing-first-name" class="form-label">제목</label>
                                                        <input class="form-control" type="text" name="noticeTitle" placeholder="제목을 입력해주세요." id="title" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3 mt-3">
                                                <label for="example-textarea" class="form-label">내용</label>
                                                <textarea class="form-control" id="content" rows="10" name="noticeContent" placeholder="내용을 작성해 주세요."></textarea>
                                            </div>
                                    </div>
                                </div>
                                <!-- end row -->
                                <div class="row mt-4">
                                    <div class="col-sm-6">
                                        <a href="${pageContext.request.contextPath }/adnotice/list"
                                           class="btn text-muted d-none d-sm-inline-block btn-link fw-semibold">
                                            <i class="mdi mdi-arrow-left"></i> 취소
                                        </a>
                                    </div>
                                    <!-- end col -->
                                    <div class="col-sm-6">
                                        <div class="text-sm-end">
                                            <button type="button" id="contentInsertBtn" class="btn btn-primary">자동완성</button>
                                            <button type="button" id="noticeAddBtn" class="btn btn-danger">등록</button>
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
<script>
$(function(){
    $('#noticeAddBtn').on('click',function(e){
        e.preventDefault();
        
        // 제목과 내용이 비어 있는지 확인하는 검증
        let title = $('#title').val().trim();
        let content = CKEDITOR.instances.content.getData().trim();
        
        if (title == "" || content == "") {
//             alert("제목과 내용을 모두 입력해주세요.");
            Swal.fire({title : '제목과 내용을 모두 입력해 주세요',
            			icon : 'warning'});
            return;
        }
        
        let empName = "${empInfo.empName}";
        let proNo = "<%= session.getAttribute("proNo")%>";
        sendAlarm("addNotice",1,empName,0,proNo);
        
        $('#insertNoticeForm').submit();
    })
})
</script>
<!-- CKEditor CDN -->
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

<!-- CKEditor 초기화 -->
<script>
    $(function() {
    	CKEDITOR.replace('content', {
            removePlugins: 'image,uploadimage,uploadfile'
        });
    	
    	$('#contentInsertBtn').click(function() {
    		$('input[name=noticeTitle]').val('일일업무보고 작성의 건');
    		CKEDITOR.instances.content.setData("<p>최근 일일 업무보고 작성률이 저조한 것 같습니다.</p> <p>업무 종료 전 일일 업무보고를 작성했는지 다시 한 번 꼭 확인해주세요.</p>");
    	})
    })
</script>

<style>
#content {
    width: 100%;
    height: 300px;
}
</style>