<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%
	Cookie[] cookieArr = request.getCookies();
	String cookieChk = "";
	String cookieName = "";
	for (Cookie cookie : cookieArr) {
		if ("rememberMe".equals(cookie.getName())) {
			cookieName = cookie.getValue();
			cookieChk = "checked";
			break;
		}
	}
%>
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
					<div class="card-header py-4 text-center bg-light">
						<a href="index.html">
							<span>
								<img src="${pageContext.request.contextPath }/resources/assets/images/apexLogo.png" alt="logo" height="90">
							</span>
						</a>
					</div>

					<div class="card-body p-4">
						<div class="text-center w-75 m-auto">
							<h4 class="text-dark-50 text-center pb-0 fw-bold">로그인</h4>
						</div>
						<form action="/login" method="post">
							<div class="mb-3">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/findIdPw/findId'"
									class="btn btn-link text-muted float-end">
									<small>아이디 찾기</small>
								</button>
								<label for="emailaddress" class="form-label">아이디</label> 
								<input class="form-control" name="username" type="text"
									value="<%=cookieName%>" id="emailaddress" required
									placeholder="아이디를 입력해주세요.">
							</div>

							<div class="mb-3">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/findIdPw/findPw'"
									class="btn btn-link text-muted float-end">
									<small>비밀번호 재설정</small>
								</button>
								<label for="password" class="form-label">비밀번호</label>
								<div class="input-group input-group-merge">
									<input type="password" id="password" name="password"
										class="form-control" placeholder="비밀번호를 입력해주세요.">
									<div class="input-group-text" data-password="false">
										<span class="password-eye"></span>
									</div>
								</div>
							</div>

							<div class="mb-3 mb-3">
								<div class="form-check">
									<input type="checkbox" class="form-check-input" <%=cookieChk%>
										id="checkbox-signin" name="rememberMe"> <label
										class="form-check-label" for="checkbox-signin">아이디 저장</label>
								</div>
							</div>
							<div class="mb-3 mb-0 text-center">
								<button class="btn btn-primary" type="submit">로그인</button>
							</div>
							<sec:csrfInput />
						</form>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-12 text-center"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:if test="${not empty message2 }">
	<div class="alert alert-success">${message2 }</div>
</c:if>

<!-- Vendor js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>

<!-- App js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>
