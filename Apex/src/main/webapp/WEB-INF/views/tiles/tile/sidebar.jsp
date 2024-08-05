<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<% 
       HttpSession ses = request.getSession();
		int sessionValue = 0;
		if(ses.getAttribute("proNo") != null) {
	       sessionValue = (int) ses.getAttribute("proNo");
		}
 %>
 <input type="hidden" value="<%= sessionValue %>" id="input-selectedProjectNo" />


	<div class="leftside-menu">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.employeeVO" var="empInfo"/>
		<input type="text" value="${empInfo.empNo }" id="sideBar-empNoInput" hidden />
	</sec:authorize>
	
		<!-- Brand Logo Light -->
		<c:if test="${empInfo.empNo == 1 }">
			<a href="/dashboard_admin_project" class="logo logo-light">
		</c:if>
		
		<c:if test="${empInfo.empNo != 1 }">
			<a href="/userDash/home" class="logo logo-light">
		</c:if>
		<span class="logo-lg"> 
			<img src="${pageContext.request.contextPath }/resources/assets/images/apexLogo.png" alt="logo">
		</span> 
		<span class="logo-sm"> <img
				src="${pageContext.request.contextPath }/resources/assets/images/apexLogo-sm.png"
				alt="small logo">
		</span>
		</a>

		<!-- Brand Logo Dark -->
		<a href="/hyper/index" class="logo logo-dark"> <span
			class="logo-lg"> <img
				src="${pageContext.request.contextPath }/resources/assets/images/apexLogo-dark.png"
				alt="dark logo">
		</span> <span class="logo-sm"> <img
				src="${pageContext.request.contextPath }/resources/assets/images/apexLogo-sm-dark.png"
				alt="small logo">
		</span>
		</a>

		<!-- Sidebar Hover Menu Toggle Button -->
		<div class="button-sm-hover" data-bs-toggle="tooltip"
			data-bs-placement="right" title="Show Full Sidebar">
			<i class="ri-checkbox-blank-circle-line align-middle"></i>
		</div>

		<!-- Full Sidebar Menu Close Button -->
		<div class="button-close-fullsidebar">
			<i class="ri-close-fill align-middle"></i>
		</div>

		<!-- Sidebar -->
		<div class="h-100" id="leftside-menu-container" data-simplebar>
			<!-- Leftbar User -->
			<div class="leftbar-user">
				<a href="pages-profile.html"> <img
					src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg"
					alt="user-image" height="42" class="rounded-circle shadow-sm">
					<span class="leftbar-user-name mt-2">Dominic Keller</span>
				</a>
			</div>

			<!--- Sidemenu -->
			<ul class="side-nav">
				<li class="side-nav-title">Navigation</li>

				<li class="side-nav-item">
				
				<c:if test="${empInfo.empNo == 1 }">
					<a href="${pageContext.request.contextPath}/dashboard_admin_project" class="side-nav-link">
				</c:if>
				
				<c:if test="${empInfo.empNo != 1 }">
					<a href="${pageContext.request.contextPath}/userDash/home" class="side-nav-link">
				</c:if>
				
				 <i class="uil-home-alt"></i> <span> 대시보드 </span>
				</a></li>

				<li class="side-nav-title">Apps</li>

				<li class="side-nav-item">
					<a data-bs-toggle="collapse" href="#sidebarProjects" aria-expanded="false" aria-controls="sidebarProjects" class="side-nav-link"> 
						<i class="uil-briefcase"></i> 
						<span> 프로젝트 </span>
						<span class="menu-arrow"></span>
					</a>
					<div class="collapse" id="sidebarProjects">
						<ul id="sideBarProjectsUl" class="side-nav-second-level">
						</ul>
					</div>
					
				</li>
		<!-- -------------- -->
				<li class="side-nav-item">
					<a data-bs-toggle="collapse" href="#calendarList" aria-expanded="false" aria-controls="calendarList" class="side-nav-link"> 
						<i class="uil-calender"></i>
						<span> 캘린더 </span>
						<span class="menu-arrow"></span>
					</a>
					<div class="collapse" id="calendarList">
						<ul id="sideBarCalendarUl" class="side-nav-second-level">	
							<li> <a href="/calendar/home" >개인 일정</a></li>
							<li> <a href="/commonCalendar/home" >전체 일정</a></li>
						</ul>
					</div>
					
				</li>
					
					
<%-- 				<li class="side-nav-item"><a href="${pageContext.request.contextPath}/calendar/home" --%>
<!-- 					class="side-nav-link"> <i class="uil-calender"></i> <span> -->
<!-- 							캘린더 </span> -->
<!-- 				</a></li> -->
				

				<li class="side-nav-item"><a href="${pageContext.request.contextPath }/board/list"
					class="side-nav-link"> <i class="uil-parcel"></i> <span>
							자유게시판 </span>
				</a></li>

				<li class="side-nav-item"><a href="${pageContext.request.contextPath }/video/home"
					class="side-nav-link"> <i class="uil-webcam"></i> <span>
							화상회의 </span>
				</a></li>
				<li class="side-nav-item"><a href="${pageContext.request.contextPath}/email/home" class="side-nav-link">
				<i class="uil-envelope"></i> <span> 이메일 </span>
				</a></li>
				<c:if test="${empInfo.empNo == 1 || empInfo.empNo == 7}">
					<li class="side-nav-item"><a href="${pageContext.request.contextPath}/employee/empList.do" class="side-nav-link">
					<i class="uil-user-square"></i> <span> 사원 관리 </span>
					</a></li>
					<li class="side-nav-item"><a href="${pageContext.request.contextPath}/project/list" class="side-nav-link">
					<i class="uil-briefcase"></i> <span> 프로젝트 관리 </span>
				</a></li>
				</c:if>
				<li style="height : 300px"></li>
				

			</ul>
			<!--- End Sidemenu -->

		</div>
		<div class="sideImgWrapper">
			<div class="sideImgBg"></div>
			<img src="${pageContext.request.contextPath }/resources/assets/images/sideImg.png">
		</div>
	</div>

<script>
// text-primary
	
	
	
	$(function() {
		let empNo = $('#sideBar-empNoInput').val();
		let sideBarProjectsUl = $('#sideBarProjectsUl');
		console.log("현재 접속중인 유저의 empNo : " + empNo);

		// 내 프로젝트 리스트 가져오기
		$.ajax({
					url : "/selectMyProjectList",
					type : "post",
					beforeSend : function(xhr) { // 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
						xhr.setRequestHeader(header, token);
					},
					data : {
						empNo : empNo
					},
					success : function(res) {
						let html = "";
						if(res.length != 0) {
							for (let i = 0; i < res.length; i++) {
								html += `<li data-proNo="\${res[i].proNo}"><a href="#" class="sessionInputProNo">\${res[i].proName}</a></li>`;
							}
						} else {
							html += `<li><a>진행중인 프로젝트가 없습니다.</a></li>`;
						}
						
						
						sideBarProjectsUl.append(html)
						
						if(res.length != 0) {
							let currentSelectProjectNo = $('#input-selectedProjectNo').val();
							console.log("현재 선택된 프로젝트 번호 : " + currentSelectProjectNo)
							
							// 현재 선택된 프로젝트 번호가 0이 아닐 때 스타일 주고
							if(currentSelectProjectNo != 0) {
								$('.sessionInputProNo').each(function() {
							        var dataValue = $(this).closest('li').data('prono');
							        if(currentSelectProjectNo == dataValue) {
							        	$(this).addClass('text-primary fw-bold');
							        }
							    });	
							} else { // 0일 때 뺌
								$('.sessionInputProNo').each(function() {
						        	$(this).removeClass('text-primary fw-bold');
							    });	
							}
						}
						
					}
				})
	});
	
	
	
	
// 	$.each(obj, function() {
// 		console.log(1);
// 		// 현재 요소의 data-value 속성 값을 가져옴
// 		var dataValue = $(this).closest('li').data('prono');
// 		console.log(dataValue);
// 	});

	// 	function sessionInputProNo(e){
	// 		let proNo = $(e).closest('li').data('prono');
	// 		console.log("선택된 프로젝트 번호:", proNo);

	// 	}

	$(document).on('click', '.sessionInputProNo', function(e) {
		e.preventDefault();
		let proNo = $(this).closest('li').data('prono');
		console.log(proNo);
		$.ajax({
			url : '/project/sessionInputProNo',
			type : 'post',
			contentType : 'application/json',
			data : JSON.stringify({
				proNo : proNo
			}),
			beforeSend : function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				console.log("세션에 넣은 proNo = " + res);
				location.href = "/works/list";
			},

		})

	})
</script>