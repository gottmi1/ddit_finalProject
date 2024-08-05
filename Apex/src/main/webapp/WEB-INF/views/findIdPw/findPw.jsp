<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- 오버레이 및 스피너 CSS -->
<style>
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        display: none;
        align-items: center;
        justify-content: center;
        z-index: 9999;
    }
</style>

<!-- 스피너 오버레이 -->
<div class="overlay" id="overlay">
    <div class="spinner-border text-success" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>

<div class="position-absolute start-0 end-0 start-0 bottom-0 w-100 h-100">
    <svg xmlns='http://www.w3.org/2000/svg' width='100%' height='100%' viewBox='0 0 800 800'>
        <g fill-opacity='0.22'>
            <circle style="fill: rgba(var(--ct-primary-rgb), 0.1);" cx='400' cy='400' r='600' />
            <circle style="fill: rgba(var(--ct-primary-rgb), 0.2);" cx='400' cy='400' r='500' />
            <circle style="fill: rgba(var(--ct-primary-rgb), 0.3);" cx='400' cy='400' r='300' />
            <circle style="fill: rgba(var(--ct-primary-rgb), 0.4);" cx='400' cy='400' r='200' />
            <circle style="fill: rgba(var(--ct-primary-rgb), 0.5);" cx='400' cy='400' r='100' />
        </g>
    </svg>
</div>

<div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5 position-relative">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xxl-4 col-lg-5">
                <div class="card">

                    <!-- 로고 -->
                    <div class="card-header py-4 text-center bg-light">
                        <a href="index.html">
                            <span><img src="${pageContext.request.contextPath}/resources/assets/images/apexLogo.png" alt="logo" height="90"></span>
                        </a>
                    </div>

                    <div class="card-body p-4">

                        <div class="text-center w-75 m-auto">
                            <h4 class="text-dark-50 text-center pb-0 fw-bold">비밀번호 재설정</h4>
                            <p class="text-muted mb-4">이메일과 아이디를 입력해주세요.</p>
                        </div>

                        <form action="/findIdPw/findPw" method="post" id="findForm">
                            <div class="mb-3">
                                <label for="email" class="form-label">이메일</label>
                                <input class="form-control" type="email" id="email" name="empMail" required placeholder="이메일 입력해주세요.">
                            </div>
                            <div class="mb-3">
                                <label for="name" class="form-label">아이디</label>
                                <input class="form-control" type="text" name="empId" id="id" placeholder="아이디를 입력해주세요."/>
                            </div>
                            <div class="mb-0 text-center d-grid">
                                <button class="btn btn-primary" id="pw-find" type="submit">비밀번호 재설정</button>
                            </div>
<!--                             <div class="mb-0 text-center d-grid pt-1"> -->
<!--                                 <button class="btn btn-info" type="button" onclick="javascript:location.href='/login'">로그인</button> -->
<!--                             </div> -->
                            <sec:csrfInput/>
                        </form>

                    </div> <!-- end card-body -->
                </div> <!-- end card -->
            </div> <!-- end col -->
        </div> <!-- end row -->
    </div> <!-- end container -->
</div> <!-- end account-pages -->

<!-- 알림 스크립트 -->
<c:if test="${not empty message}">
    <script>
        document.getElementById("overlay").style.display = "flex";
        setTimeout(function() {
            Swal.fire({title : '${message}',
    			icon : 'info'});
            
            document.getElementById("overlay").style.display = "none";
        }, 1000); // 1초 후에 alert 표시
    </script>
</c:if>

<!-- 폼 제출 시 오버레이 표시 스크립트 -->
<script>
    document.getElementById("findForm").addEventListener("submit", function() {
        document.getElementById("overlay").style.display = "flex";
    });
</script>