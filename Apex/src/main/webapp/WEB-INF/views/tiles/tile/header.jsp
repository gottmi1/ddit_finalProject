<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<style>
/* 사원 상세보기(프로필이미지) */
#empProfileimg{
	height: 150px;
    width: 150px;
    border: 1px solid lightgray;
}
/* .modalTable th{ */
/* 	margin-left: 50px; */
/* } */
.modalTable th, .modalTable td{
/* 	text-align: left; */
}
#proNoList li {
  list-style-type: none;
}
/* input 기본 스타일 초기화 */
input[type=text] {
/* 	border: none; */
/* 	display: inline; */
}

/* IE10 이상에서 input box 에 추가된 지우기 버튼 제거 */
input[type=text]::-ms-clear { display: none; }

.scroll{
  display: inline-block;
  width: 100%;
  height: 125px;  
  overflow-y: scroll;
  border: 1px solid lightgray;
  box-sizing: border-box;
  color: white;
  font-family: 'Nanum Gothic';
  background-color: white;
}

/* 사원 상세보기(프로젝트 목록) - 스크롤바 설정*/
.box1::-webkit-scrollbar{
  width: 20px;
}

/* 사원 상세보기(프로젝트 목록) - 스크롤바 막대 설정*/
.box1::-webkit-scrollbar-thumb{
  background-color: lightgray;
  /* 스크롤바 둥글게 설정    */
  border-radius: 10px; 
  border: 7px solid white;
}

/* 사원 상세보기(프로젝트 목록) - 스크롤바 뒷 배경 설정*/
.box1::-webkit-scrollbar-track{
  background-color: rgba(0,0,0,0);
}
/* 사원 상세보기 - 비밀번호 불일치시 수정버튼 누를 경우 에러메세지 깜박거림 효과 */
@keyframes blink {
    0% { opacity: 1; }
    50% { opacity: 0; }
    100% { opacity: 1; }
}
/* 사원 상세보기 - 비밀번호 불일치시 수정버튼 누를 경우 에러메세지 깜박거림 효과 */
.blink {
    animation: blink 0.5s linear 3;
}
</style>


<% 
       HttpSession ses = request.getSession();
		int sessionValue = 0;
		if(ses.getAttribute("proNo") != null) {
	       sessionValue = (int) ses.getAttribute("proNo");
		}
 %>
 <input type="hidden" value="<%= sessionValue %>" id="input-selectedProjectNo" />
 
	<div class="navbar-custom">
		<div class="topbar container-fluid">
			<div class="d-flex align-items-center gap-lg-2 gap-1">
				<!-- Topbar Brand Logo -->
				<div class="logo-topbar">
					<!-- Logo light -->
					<a href="/hyper/index" class="logo-light"> <span
						class="logo-lg"> <img
							src="${pageContext.request.contextPath }/resources/assets/images/logo.png"
							alt="logo">
					</span> <span class="logo-sm"> <img
							src="${pageContext.request.contextPath }/resources/assets/images/logo-sm.png"
							alt="small logo">
					</span>
					</a>

					<!-- Logo Dark -->
					<a href="/hyper/index" class="logo-dark"> <span class="logo-lg">
							<img
							src="${pageContext.request.contextPath }/resources/assets/images/logo-dark.png"
							alt="dark logo">
					</span> <span class="logo-sm"> <img
							src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png"
							alt="small logo">
					</span>
					</a>
				</div>

				<!-- Sidebar Menu Toggle Button -->
				<button class="button-toggle-menu">
					<i class="mdi mdi-menu"></i>
				</button>

				<!-- Horizontal Menu Toggle Button -->
				<button class="navbar-toggle" data-bs-toggle="collapse"
					data-bs-target="#topnav-menu-content">
					<div class="lines">
						<span></span> <span></span> <span></span>
					</div>
				</button>

				<!-- Topbar Search Form -->
				<div class="app-search dropdown d-none d-lg-block">
<!-- 					<form> -->
<!-- 						<div class="input-group"> -->
<!-- 							<input type="search" class="form-control dropdown-toggle" -->
<!-- 								placeholder="Search..." id="top-search"> <span -->
<!-- 								class="mdi mdi-magnify search-icon"></span> -->
<!-- 							<button class="input-group-text btn btn-primary" type="submit">Search</button> -->
<!-- 						</div> -->
<!-- 					</form> -->
					<c:if test="${ not empty empInfo.empNo and empInfo.empNo != 1 }">
						<button type="button" class="btn btn-primary rounded-pill" data-bs-toggle="modal" data-bs-target="#createProject-modal">
							프로젝트 생성
						</button>
					</c:if> 
					

					<div class="dropdown-menu dropdown-menu-animated dropdown-lg"
						id="search-dropdown">
						<!-- item-->
						<div class="dropdown-header noti-title">
							<h5 class="text-overflow mb-2">
								Found <span class="text-danger">17</span> results
							</h5>
						</div>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="uil-notes font-16 me-1"></i> <span>Analytics
								Report</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="uil-life-ring font-16 me-1"></i> <span>How can I
								help you?</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="uil-cog font-16 me-1"></i> <span>User profile
								settings</span>
						</a>

						<!-- item-->
						<div class="dropdown-header noti-title">
							<h6 class="text-overflow mb-2 text-uppercase">Users</h6>
						</div>

						<div class="notification-list">
							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<div class="d-flex">
									<img class="d-flex me-2 rounded-circle"
										src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg"
										alt="Generic placeholder image" height="32">
									<div class="w-100">
										<h5 class="m-0 font-14">Erwin Brown</h5>
										<span class="font-12 mb-0">UI Designer</span>
									</div>
								</div>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<div class="d-flex">
									<img class="d-flex me-2 rounded-circle"
										src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg"
										alt="Generic placeholder image" height="32">
									<div class="w-100">
										<h5 class="m-0 font-14">Jacob Deo</h5>
										<span class="font-12 mb-0">Developer</span>
									</div>
								</div>
							</a>
						</div>
					</div>
					
					
					
				</div>
			</div>

			<ul class="topbar-menu d-flex align-items-center gap-3">
				<li class="dropdown d-lg-none"><a
					class="nav-link dropdown-toggle arrow-none"
					data-bs-toggle="dropdown" href="#" role="button"
					aria-haspopup="false" aria-expanded="false"> <i
						class="ri-search-line font-22"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
						<form class="p-3">
							<input type="search" class="form-control"
								placeholder="Search ..." aria-label="Recipient's username">
						</form>
					</div></li>

<!-- 				<li class="dropdown"><a -->
<!-- 					class="nav-link dropdown-toggle arrow-none" -->
<!-- 					data-bs-toggle="dropdown" href="#" role="button" -->
<!-- 					aria-haspopup="false" aria-expanded="false"> <img -->
<%-- 						src="${pageContext.request.contextPath }/resources/assets/images/flags/us.jpg" --%>
<!-- 						alt="user-image" class="me-0 me-sm-1" height="12"> <span -->
<!-- 						class="align-middle d-none d-lg-inline-block">English</span> <i -->
<!-- 						class="mdi mdi-chevron-down d-none d-sm-inline-block align-middle"></i> -->
<!-- 				</a> -->
<!-- 					<div class="dropdown-menu dropdown-menu-end dropdown-menu-animated"> -->

<!-- 						item -->
<!-- 						<a href="javascript:void(0);" class="dropdown-item"> <img -->
<%-- 							src="${pageContext.request.contextPath }/resources/assets/images/flags/germany.jpg" --%>
<!-- 							alt="user-image" class="me-1" height="12"> <span -->
<!-- 							class="align-middle">German</span> -->
<!-- 						</a> -->

<!-- 						item -->
<!-- 						<a href="javascript:void(0);" class="dropdown-item"> <img -->
<%-- 							src="${pageContext.request.contextPath }/resources/assets/images/flags/italy.jpg" --%>
<!-- 							alt="user-image" class="me-1" height="12"> <span -->
<!-- 							class="align-middle">Italian</span> -->
<!-- 						</a> -->

<!-- 						item -->
<!-- 						<a href="javascript:void(0);" class="dropdown-item"> <img -->
<%-- 							src="${pageContext.request.contextPath }/resources/assets/images/flags/spain.jpg" --%>
<!-- 							alt="user-image" class="me-1" height="12"> <span -->
<!-- 							class="align-middle">Spanish</span> -->
<!-- 						</a> -->

<!-- 						item -->
<!-- 						<a href="javascript:void(0);" class="dropdown-item"> <img -->
<%-- 							src="${pageContext.request.contextPath }/resources/assets/images/flags/russia.jpg" --%>
<!-- 							alt="user-image" class="me-1" height="12"> <span -->
<!-- 							class="align-middle">Russian</span> -->
<!-- 						</a> -->

<!-- 					</div></li> -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<li class="dropdown notification-list">
				<a class="nav-link dropdown-toggle arrow-none" data-bs-auto-close="outside" data-bs-toggle="dropdown" onclick="showMyAlarm()" role="button" aria-haspopup="false" aria-expanded="false"> 
					<i class="ri-notification-3-line font-22"></i>
					<span id="alarmToggleDropdownIcon">
						<c:if test="${not empty sessionScope.alarmHtml }">
							<c:out value="${sessionScope.alarmHtml }" escapeXml="false"/>
						</c:if>
<!-- 					 <span class="noti-icon-badge"></span> -->
					</span>
				</a>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					<div
						class="dropdown-menu dropdown-menu-animated dropdown-lg py-0 alarm-dropdown" style="width : 350px;">
						<div
							class="p-2 border-top-0 border-start-0 border-end-0 border-dashed border">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="m-0 font-16 fw-semibold">실시간 알림</h6>
								</div>
								<div class="col-auto">
									<a href="javascript: void(0);"
										class="text-dark text-decoration-underline"> <small></small>
									</a>
								</div>
							</div>
						</div>

						<div class="px-2" style="max-height: 300px; overflow-y : auto;" data-simplebar id="alarmToggleTarget">

<!-- 							<h5 class="text-muted font-13 fw-normal mt-2">Today</h5> -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
							<!-- item-->
							<!-- item 끝 -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


							<div class="text-center">
								<i class="mdi mdi-dots-circle mdi-spin text-muted h3 mt-0"></i>
							</div>
						</div>

						<!-- All-->
						<a class="dropdown-item text-center text-primary notify-item border-top py-2" onclick="alarmReadAndRemove()" style="cursor : pointer">
							전체 삭제 </a>

					</div></li>
					<li class="d-none d-sm-inline-block">
				<a class="nav-link"
					href="/ai/home" data-toggle="bot">
					<i class="mdi mdi-robot-love-outline font-22"></i>
					</a>
						
				</li>
				<li class="d-none d-sm-inline-block">
					<div class="nav-link" id="light-dark-mode" data-bs-toggle="tooltip"
						data-bs-placement="left" title="Theme Mode">
						<i class="ri-moon-line font-22"></i>
					</div>
				</li>


				<li class="d-none d-md-inline-block"><a class="nav-link"
					href="" data-toggle="fullscreen"> <i
						class="ri-fullscreen-line font-22"></i>
				</a></li>

				<li class="dropdown"><a
					class="nav-link dropdown-toggle arrow-none nav-user px-2"
					data-bs-toggle="dropdown" href="#" role="button"
					aria-haspopup="false" aria-expanded="false"> <span
						class="account-user-avatar"> <img
							src="${pageContext.request.contextPath}${empInfo.empProfileimg}"
							alt="user-image" width="32" class="rounded-circle">
					</span> <span class="d-lg-flex flex-column gap-1 d-none">
							<h5 class="my-0">${empInfo.empName }</h5>
							<h6 class="my-0 fw-normal">${empInfo.positionName }</h6>
					</span>
				</a>
					<div
						class="dropdown-menu dropdown-menu-end dropdown-menu-animated profile-dropdown">
						<!-- item-->
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome !</h6>
						</div>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item">
							<i class="mdi mdi-account-circle me-1"></i> <span class="myAccount1">마이페이지</span>
						</a>

						<!-- item-->
						<c:if test="${ empInfo.empNo != 1 }">
							<a href="/myProject" class="dropdown-item">
								<i class="mdi mdi-lifebuoy me-1"></i> <span>내 프로젝트</span>
							</a>
						</c:if>
						

						<!-- item-->
						<a href="/logout" class="dropdown-item" > <i
							class="mdi mdi-logout me-1"></i> <span>로그아웃</span>
						</a>
					</div></li>
			</ul>
		</div>
		<c:if test="${ not empty isProjectPage }">
			<div class="d-flex justify-content-between px-3 py-2" style="border-top: 1px solid #efefef;">
				<div class="d-flex flex-wrap gap-3">
					<a class="btn btn-soft-success rounded-pill" id="gnb-goWorks">일감</a>
					<a class="btn btn-soft-success rounded-pill" id="gnb-goKanban">칸반</a>
					<a class="btn btn-soft-success rounded-pill" id="gnb-goGantt">간트</a>
					<a class="btn btn-soft-success rounded-pill" id="gnb-goHistory">히스토리</a>
					<a class="btn btn-soft-success rounded-pill" id="gnb-goCloud">파일저장소</a>
					<a href="${pageContext.request.contextPath }/adnotice/list" class="btn btn-soft-success rounded-pill">공지사항</a>
					<a href="${pageContext.request.contextPath }/project/dashboard" class="btn btn-soft-success rounded-pill">통계</a>
				</div>
				<div>
					<button class="btn btn-outline-primary" id="gnb-goReport">일일업무보고</button>
				</div>
			</div>
		</c:if>
		<c:if test="${ not empty isDashboardPage }">
			<div class="d-flex justify-content-between px-3 py-2" style="border-top: 1px solid #efefef;">
				<div class="d-flex flex-wrap gap-3" id="dashboard-myProject">
					<button class="btn btn-outline-light rounded-pill"><a href="/dashboard_admin_project">프로젝트</a></button>
               		<button class="btn btn-outline-light rounded-pill"><a href="/dashboard_admin_work">일감</a></button>
				</div>
			</div>
		</c:if>
	</div>
	<!-- ========== Topbar End ========== -->
	

<div id="createProject-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="text-center mt-2 mb-4">
                    	<h4 class="text-muted">프로젝트 생성</h4>
                </div>

                <form action="/project/createProject" method="post" id="formCreateProject" class="ps-3 pe-3">
<!-- 		private String proName; 필요하고 -->
<!-- 		private String proContent; 필요하고 -->
<!-- 		private Date proStartdate; 필요하고 -->
<!-- 		private Date proEnddate; 필요하고 -->
<!-- 		private int proLeader; 필요하고 -->
                    <div class="mb-3">
                        <label for="" class="form-label">프로젝트명</label>
                        <input class="form-control" type="text" name="proName" required="required">
                    </div>

                    <div class="mb-3">
                        <label for="" class="form-label">설명</label>
                        <textarea class="form-control" name="proContent" rows="5" cols="5" required="required"></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label for="" class="form-label">마감일자</label>
                        <input class="form-control" type="date" name="proEnddate" required="required">
                    </div>

					<div class="mb-3">
						<label for="" class="form-label">팀원 추가</label>
                        <select class="form-control" id="selectEntryMember">
					        <option>참여할 사원을 선택해주세요.</option>
						</select>
					</div>
                    
                    <div class="mb-3">
	                    <label for="" class="form-label">참여 사원</label>
	                   	<div class="d-flex" id="entryMember">
	                   	</div>
                   	</div>
	
					<input name="proLeader" value="${empInfo.empNo }" hidden />
					
					<sec:csrfInput/>
                </form>

            </div>
            <div class="modal-footer">
            	<button class ="btn btn-info" id="btn-createProjectContentAuto">자동 완성</button>
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
                <button id="btn-submitCreatePrject" type="button" class="btn btn-primary">전송</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- =======================================사원 등록/상세보기/상세보기 상태에서 수정 모달 시작===================================================================== -->

<!-- 사원 등록/상세보기/상세보기 상태에서 수정 모달 -->
<div id="register-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true" data-status="register">
    <div class="modal-dialog" style="max-width: 40%;">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title" id="detail-modalLabel">사원 등록</h4>
                <button type="button" id="registerTopModelCancleBtn" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>
            <!-- 모달 바디 - Personal-Information -->
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <form action="/employee/empInsert.do" method="post" id="modalForm" enctype="multipart/form-data">
                                <input type="hidden" name="empNo" id="empNo" value="0"/>
                                <div class="row mx-auto" style="display: flex;">
                                    <div class="col-5">
                                        <div class="row">
                                            <img src="" id="empProfileimg" class="m-auto mb-2 img-thumbnail avatar-sm rounded-circle" alt="">
                                            <input id="empProfileFiles" class="form-control" type="file" placeholder="파일을 선택해주세요." multiple="multiple"  name="imgFile">
                                        </div>
                                    </div>
                                    <div class="col-7" style="text-align: left; vertical-align: middle;">
                                        <p class="text-muted"><span id="empFireyn"></span></p>
                                        <div class="col-12">
                                        	<!-- 이름, 직급  -->
                                            <p class="header-titlemt-0 mb-0 d-flex">
                                                <input type="text" class="form-control required" id="empName" name="empName" placeholder="이름을 입력하세요.">&nbsp;&nbsp;
<!-- 												<span class="error invalid-feedback" for="empId" style="display:block;"></span> -->
<!--                                                 <input type="text" class="form-control" id="positionName" name="positionName" placeholder="직급을 입력하세요."> -->
												<select class="form-select form-select-md" id="positionNo" name="positionNo">
                                                    <option value="0" selected="selected">직급을 선택해주세요</option>
                                                    <option value="1">사원</option>
                                                    <option value="2">대리</option>
                                                    <option value="3">과장</option>
                                                    <option value="4">부장</option>
                                                    <option value="5">임원</option>
                                                </select>
<!--                                                 <span class="error invalid-feedback" for="positionName" style="display:block;"></span> -->
                                            </p>
                                            <p class="header-titlemt-0 d-flex">
												<span class="error invalid-feedback" for="empName" style="display:block;"></span>
                                                <span class="error invalid-feedback" for="positionNo" style="display:block;"></span>
                                            </p>
                                            <!-- 이메일 -->
                                            <p class="text-muted">
                                            	<input type="text" class="form-control" id="empMail" name="empMail" placeholder="이메일을 입력하세요.">
                                            	<span class="error invalid-feedback" for="empMail" style="display:block;"></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="text-start">
                                    <div class="row">
                                        <div class="col-6">
                                            <!-- 사번 -->
                                            <div class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label" style="display: inline;">사번(ID)</label><br/>
                                                </div>
                                                <div class="input-group mb-0">
                                                    <input type="text" class="form-control" id="empId" name="empId" placeholder="아이디를 입력하세요."> 
                                                    <span class="input-group-append">
                                                        <button type="button" class="btn btn-secondary btn-flat" id="idCheckBtn">자동생성하기</button>
                                                    </span>
                                                    <span class="error invalid-feedback" for="empId" style="display:block;"></span>
<%--                                                     <span class="error invalid-feedback" style="display:block;">${errors.empId }</span> --%>
<%-- 						                            <c:if test="${not empty errors.empId}"> --%>
<%-- 						                                <span class="text-danger">${errors.empId}</span> --%>
<%-- 						                            </c:if> --%>
                                                </div>
                                            </div>
                                            <!-- 주소 -->
                                            <div class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label">주소</label><br/>
                                                </div>
                                                <input type="text" class="form-control" id="empPostcode" name="empPostcode"placeholder="우편번호 찾기를 하세요."> 
                                                <span class="input-group-append">
                                                    <button type="button" id="DaumPostcode1" class="btn btn-secondary btn-flat" onclick="DaumPostcode()">우편번호 찾기</button>
                                                </span>
                                            </div>
                                            <div class="input-group mb-2">
                                                <input type="text" class="form-control" id="empAddress1" name="empAddress1" placeholder="주소를 입력하세요.">
                                            </div>
                                            <div class="input-group mb-2">
                                                <input type="text" class="form-control" id="empAddress2" name="empAddress2" placeholder="상세주소를 입력하세요.">
                                            </div>
                                            <div class="input-group mb-2">
                                                <div id="map" style="width: 100%; height: 300px; display: none;"></div>
                                            </div>
                                            <!-- 입사일 -->
                                            <div id="indate" class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label" style="display: inline;">입사일</label><br/>
                                                </div>
                                                <div class="input-group mb-0">
                                                    <input type="date" class="form-control" id="empIndate" name="empIndate" placeholder="등록시 자동 입력됩니다."> 
                                                </div>
                                            </div>
                                            <!-- 퇴사일 -->
                                            <div id="outdate" class="input-group mb-2">
                                                <div class="input-group mb-0 d-flex">
                                                    <label class="form-label" style="align-content: end;">퇴사일</label>
		                                            <!-- 퇴사처리 -->
													<button type="button" id="empFireynBtn" class="btn btn-danger btn-flat mb-2" style="margin-left: auto;">퇴사처리</button>
                                                </div>
                                                <div class="input-group mb-0">
<!--                                                     <input type="text" class="form-control" id="empOutdate" name="empOutdate" placeholder="퇴사처리시 자동 입력 됩니다.">  -->
                                                    <input type="date" class="form-control" id="empOutdate" name="empOutdate" placeholder="퇴사처리시 자동 입력 됩니다." onfocus="this.showPicker()"> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <!-- 전화번호 -->
                                            <div class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label">전화번호</label><br/>
                                                </div>
                                                <input type="text" class="form-control" id="empPhone" name="empPhone" placeholder="전화번호를 입력하세요. ex) 010-1111-2222"/> 
                                                <span class="error invalid-feedback" for="empPhone" style="display:block;"></span>
                                            </div>
                                            <!-- 생년월일 -->
                                            <div class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label">생년월일</label><br/>
                                                </div>
                                                <input type="date" class="form-control" id="empBirth" name="empBirth"/> 
                                                <span class="input-group-append"></span>
                                            </div>
                                            <!-- 비밀번호 -->
                                            <div class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label">비밀번호</label>
                                                </div>
                                                <input type="password" class="form-control" id="empPw" name="empPw"/>
												<span class="error invalid-feedback" for="empPw" style="display:block;"></span>
                                            </div>
                                            <!-- 새 비밀번호 확인 - 사용자 내정보 일경우 -->
                                            <div id="newPw" class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label">새 비밀번호 확인</label><br/>
                                                </div>
                                                <input type="password" class="form-control" id="empPw1" name="empPw1" placeholder="비밀번호를 입력해주세요">
												<span class="error invalid-feedback" for="empPw1" style="display:block;"></span>                                                
                                            </div>
                                            <!-- 소속 프로젝트 -->
                                            <div id="pronolist" class="input-group mb-2">
                                                <div class="input-group mb-0">
                                                    <label class="form-label">소속 프로젝트 목록(이동하기)</label><br/>
                                                </div>
                                                <div class="input-group mb-0">
                                                	<div class="scroll box1 col-6">
<!--                                                 	border: 1px solid lightgray;  -->
                                                    <ul id="proNoList" class="p-2 input-group" style="display: grid;"></ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <sec:csrfInput/>
                            </form>
                        </div>
                    </div>
                </div><!-- Personal-Information -->
            </div>
            <div class="modal-footer">
                <button type="button" id="btn-autoInsertEmp" class="btn btn-info">자동완성</button>
                <button type="button" id="insertBtn" class="btn btn-info">등록</button>
                <button type="button" id="updateBtn" class="btn btn-soft-success">수정</button>
                <button type="button" id="cancelBtn" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- =======================================사원 등록/상세보기/상세보기 상태에서 수정 모달 끝===================================================================== -->
                             
<c:if test="${not empty create }">
	<script>
	Swal.fire({
        title: '프로젝트 생성 요청이 완료되었습니다.',
        icon: 'success'
    });
	</script>
</c:if>                            
                                        
<script>

//=========================================== 사원 상세보기 펑션 시작===================================================================================================

// 사원 상세보기 - 프로필 이미지 파일인지 체크
function isimgFile(file) {
	var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자 가져옴
	// 삼항연산자 ""안의 이미지파일이면 false가 리턴, 아니면 true가 리턴
	return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"])  === -1 ) ? false : true;
}

// 사원 상세보기 - 상세주소 (다음주소 api : 사용자가 선택한 값 이용하기)
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('empPostcode').value = data.zonecode;
            document.getElementById("empAddress1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("empAddress2").focus();
        }
    }).open();
}

// 사원 상세보기 - 정보 로드 함수
function loadEmployeeDetails(empNo) {
	const csrfToken = $("#_csrf").attr("content");
	const csrfHeader = $("#_csrf_header").attr("content");

    $.ajax({
        url: '/employee/empDetail.do',
        type: 'GET',
        data: { empNo: empNo },
        beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
        success: function(data) {
        	console.log("## 사원 상세 정보 AJAX 성공: ", data); // 디버깅용 콘솔 로그
            // 응답 데이터 폼에 채우기
            $('#empNo').val(data.empNo);
            $('#empName').val(data.empName);
            $('#positionNo').val(data.positionNo);
            $('#empMail').val(data.empMail);
            $('#empId').val(data.empId);
            $('#empPostcode').val(data.empPostcode);
            $('#empAddress1').val(data.empAddress1);
            $('#empAddress2').val(data.empAddress2);
            $('#empIndate').val(data.empIndate);
            $('#empOutdate').val(data.empOutdate);
            $('#empPhone').val(data.empPhone);
            $('#empBirth').val(data.empBirth);
            $('#empPw').val(data.empPw);
            $('#empPw1').val(data.empPw1);
            // 프로필 이미지 설정
            $('#empProfileimg').attr('src', data.empProfileimg);
         	// 재직/퇴직 상태 설정
            if (data.empOutdate) {
            	data.empFireyn = "Y";
            }
            if (data.empFireyn == "N") {
                $('#empFireyn').html('<h4><span class="badge badge-success-lighten">재직</span></h4>');
            } else if (data.empFireyn == "Y") {
                $('#empFireyn').html('<h4><span class="badge badge-danger-lighten">퇴직</span></h4>');
            }
            // 소속 프로젝트 목록 설정
			var proNoList = data.proNoList;
			$('#proNoList').empty();
			if (proNoList && Array.isArray(proNoList) && proNoList.length > 0) {
			    var hasValidProject = false;
			    proNoList.forEach(function(project, index) {
			        if (project.proName) {
			            hasValidProject = true;
			            var projectName = project.proName;
			            console.log("프로젝트 이름:", projectName); // 각 프로젝트 이름을 출력
			            $('#proNoList').append('<a href="javascript:void()" class="text-muted"><li data-prono="' + project.proNo + '" class="mb-0 li-myProjectList" >' + '&nbsp;&nbsp;' + (index + 1) + '.&nbsp;&nbsp;' + projectName + '</li></a>');
			        }
			    });
			    if (!hasValidProject) {
			        $('#proNoList').append('<p class="mb-0" style="color: gray;"> 소속된 프로젝트가 없습니다.</p>');
			    }
			}
         	// HTML 요소가 제대로 추가되었는지 확인
//             console.log("## HTML 내용:", $('#proNoList').html());
        },
        error: function(xhr, status, error) {
        	console.error("## 사원 상세 정보 AJAX 실패: ", xhr.responseText); // 디버깅용 콘솔 로그
            alert('사원 정보를 불러오는 중 오류가 발생했습니다.');
	    }
	});
    
    
    $(document).on('click','.li-myProjectList',function(e){
		e.preventDefault();
        let proNo = $(this).data('prono');
        console.log(proNo);
        $.ajax({
        	url : '/project/sessionInputProNo',
        	type :'post',
        	contentType : 'application/json',
        	data : JSON.stringify({ proNo : proNo}),
        	beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		    },
        	success : function(res){
        		console.log("세션에 넣은 proNo = "+res);
        		location.href = "/works/list";
        	}, 
        })
	})
    
    
}

// 사원 상세보기 - 퇴사처리 버튼 클릭시 달력 띄우기 메서드
function setupFireButton() {
	const csrfToken = $("#_csrf").attr("content");
	const csrfHeader = $("#_csrf_header").attr("content");
	
    $('#empFireynBtn').off('click').on('click', function() {
        var $empOutdate = $('#empOutdate');
        $empOutdate.prop('readonly', false).prop('disabled', false);

        Swal.fire({
            title: '정말로 퇴사처리 하시겠습니까?',
            text: "다시 되돌릴 수 없습니다. 신중하세요.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true,
        }).then((result) => {
            if (result.isConfirmed) {
                    try {
                        // 날짜 자동 기입
                        var today = new Date();
                        var year = today.getFullYear();
                        var month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
                        var day = String(today.getDate()).padStart(2, '0');
                        var formattedDate = `\${year}-\${month}-\${day}`;
                        
                        // 날짜를 입력 필드에 기입
                        $empOutdate.val(formattedDate);
                        console.log("## formattedDate : ", formattedDate);
                        
                        // AJAX 요청 보내기
                        var formData = new FormData($('#modalForm')[0]);
//                         formData.append('empOutdate', formattedDate);

                        $.ajax({
                            url: '/employee/empUpdate.do', // 실제 엔드포인트 URL로 변경
                            type: 'POST',
                            data: formData,
                            processData: false,
                            contentType: false,
                            beforeSend : function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
                				xhr.setRequestHeader(header, token);
                			},
                            success: function(res) {
                                console.log('## ajax 퇴사처리 성공:', res);
                                // 성공 처리 로직 추가
                                Swal.fire({
                                    title: '퇴사처리가 완료되었습니다.',
                                    text: '성공적으로 처리되었습니다.',
                                    icon: 'success'
                                }).then(() => {
                                    // 모달 닫기
                                    $('#register-modal').modal('hide');
                                });
                            },
                            error: function(error) {
                                console.error('## ajax 퇴사처리 실패:', error);
                                Swal.fire({
                                    title: '퇴사처리를 실패하였습니다.',
                                    text: '오류가 발생했습니다. 다시 시도해주세요.',
                                    icon: 'error'
                                });
                            }
                        });
                    } catch (error) {
                        Swal.fire({
                            title: '퇴사처리를 실패하였습니다.',
                            text: '오류가 발생했습니다. 다시 시도해주세요.',
                            icon: 'error'
                        });
                        console.warn('오류가 발생했습니다.:', error);
                    }
            }
        });
    });
}


// 관리자 사원 등록 - 아이디 자동생성하기 - 자동생성된 아이디 중복확인
var sequenceNumber = 1; // 순번 초기값
function generateAndCheckId() {
	$('#empId').prop('readonly', true);	// 아이디input 되살리기
    // 현재 날짜를 기반으로 아이디 생성
    var now = new Date();
    var year = now.getFullYear();
    var month = ('0' + (now.getMonth() + 1)).slice(-2);
    var day = ('0' + now.getDate()).slice(-2);
    // 순번을 4자리로 맞추기
    var sequence = ('000' + sequenceNumber).slice(-4);
    // 아이디 형식: YYYYMMDD0001
    var generatedId = year + month + day + sequence;

    // 비동기 통신, 서버로 데이터를 전송하기 위한 데이터 준비
    var data = {
        empId : generatedId
    };

    // 비동기 통신 준비
    $.ajax({
        url : "/employee/idCheck.do",
        type : "post",
        beforeSend : function(xhr) { // 데이터 전송 전, 헤더에 csrf값 설정
            xhr.setRequestHeader(header, token); // key(header), 값(token)
        },
        data : JSON.stringify(data),
        contentType : "application/json;charset=utf-8",
        success : function(res) {
        	console.log("## 아이디 자동생성 중복확인 - 서버 응답 : " + res);
            if(res == "NOTEXIST"){ // 아이디 사용 가능
                $('#empId').val(generatedId);
            	setTimeout(function() {
	                $('#idCheckBtn').text("중복확인");
				}, 1000); // 1초지연
                sequenceNumber++;	// 아이디 사용가능 할때 증가
            } else { // 아이디 중복
            	sequenceNumber++;	// 아이디 중복 일때도 증가 (이거있어야지 서버랑 값 비교함)
                generateAndCheckId(); // 다시 시도
            }
        },
        error: function(xhr, status, error) {
            console.error("## 아이디 자동생성 중복확인 아작스 실패 : " + status + ", " + error);
        }
    });
}
//=========================================== 사원 상세보기 펑션 끝===================================================================================================



$(function(){
	var proNoSession = "${sessionScope.proNo}";
	
	$('#gnb-goWorks').on('click',function(){
		location.href = "/works/list";
	});
	
	
	$('#gnb-goKanban').on('click',function(){
		location.href = "/kanban/home";
	});
	
	var proNoSession = "${sessionScope.proNo}";
	$('#gnb-goReport').on('click',function(){
		location.href = "/report/list";
	});
	
	$("#gnb-goGantt").on('click',function(){
		location.href = "/gantt/home";
	})
	
	$("#gnb-goHistory").on('click',function(){
		location.href = "/history/home";
	})
	
	$("#gnb-goCloud").on('click',function(){
		location.href = "/cloud/fileManager";
	})
	
	
})
</script>
<script type="text/javascript">
	
$(function() {
	
	// gnb에 내 프로젝트 리스트 추가 ( 였음 )
// 	$.ajax({
// 		url :'/selectMyProjectList',
// 		type :'post',
// 		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
// 	         xhr.setRequestHeader(header, token);
// 	      },
// 	    success : function(res){
// 	    	let html = "";
// 	    	for(let i = 0; i < res.length; i++) {
// 	    		html += `<button class="btn btn-outline-light rounded-pill" data-proNo="\${res[i].proNo}"><a href="javascript:void(0)" class="dashboard-sessionInputProNo">\${res[i].proName}</a></button>`
//     		}
// 	    	$('#dashboard-myProject').append(html);
	    	
// 	    	let currentSelectProjectNo = $('#input-selectedProjectNo').val();
	    	
// 	    	// 현재 선택된 프로젝트 번호가 0이 아닐 때 스타일 주고
// 	    	if(currentSelectProjectNo != 0) {
// 	    		$('.dashboard-sessionInputProNo').each(function() {
// 	    			console.log("dashbaord : " + $(this));
	    			
// 	    	        var dataValue = $(this).closest('button').data('prono');
// 	    	        if(currentSelectProjectNo == dataValue) {
// 	    	        	$(this).addClass('text-danger fw-bold');
// 	    	        }
// 	    	    });	
// 	    	} else { // 0일 때 뺌
// 	    		$('.dashboard-sessionInputProNo').each(function() {
// 	    	    	$(this).removeClass('text-danger fw-bold');
// 	    	    });	
// 	    	}
//     	}
// 	});
	
// 	$(document).on('click', '.dashboard-sessionInputProNo', function(e) {
// 		e.preventDefault();
// 		let proNo = $(this).closest('button').data('prono');
// 		console.log(proNo);
// 		$.ajax({
// 			url : '/project/sessionInputProNo',
// 			type : 'post',
// 			contentType : 'application/json',
// 			data : JSON.stringify({
// 				proNo : proNo
// 			}),
// 			beforeSend : function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
// 				xhr.setRequestHeader(header, token);
// 			},
// 			success : function(res) {
// 				console.log("세션에 넣은 proNo = " + res);
// 				location.href = "/dashboard";
// 			},
// 		})
// 	})
	
	//================================ 사원 등록, 상세보기 스크립트 시작===============================================================
	const csrfToken = $("#_csrf").attr("content");
	const csrfHeader = $("#_csrf_header").attr("content");
	
	var empProfileFiles = $('#empProfileFiles');	// 프로필 이미지 선택 input
	var empProfileimg = $('#empProfileimg');	// 프로필 이미지 img
	var empAddress2 = $('#empAddress2');		// 상세주소 포커스가 이동하는 순간 이벤트 Element (주소에 맞는 지도 띄운다)
	var modalForm = $('#modalForm');			// 프로필 Form Element
	var insertBtn = $('#insertBtn');			// 수정하기 버튼 Element
	var modifyBtn = $('#modifyBtn');			// 수정하기 버튼 Element
	var idCheckBtn = $('#idCheckBtn');		// 중복확인 버튼 element
	var idCheckFlag = false;				// 중복확인 여부 flag ==> idCheck이전에 선행되어야 함
	var sequenceNumber = 1; 				// 아이디 자동생생하기 - 순번 초기값
	var file;
	

	// 모달이 열릴 때 상태에 따라 초기화
    $('#register-modal').on('show.bs.modal', function(event) {
//         var button = $(event.relatedTarget); // 모달을 트리거한 버튼
        var modal = $(this);
        var status = modal.data('status'); // 모달의 data-status 속성 값
        console.log("=====> show.bs.modal status", status);

        if (status === 'register') {
            modal.find('.modal-title').text('사원 등록');
            modal.find($('#modalForm input')).prop('readonly', false);
            $('#modalForm input').on('click', function() {
                $(this).attr('readonly', false);
                modal.find('#positionNo').prop('disabled', false);
              });
            modal.find($('#positionNo')).prop('disabled', false);
            modal.find('#insertBtn').show(); 					// 등록 버튼 보이기
            modal.find('#updateBtn').hide(); 					// 수정 버튼 숨기기
            modal.find('#modalForm')[0].reset();
            modal.find('#empProfileimg').attr('src', '');		// 프로필 이미지 초기화
            modal.find('#empName').attr('style', '');			// 이름 스타일 속성 초기화
            modal.find('#empId').prop('readonly', true);		// 아이디 자동생성하기 위한 버튼 숨기기
            modal.find('#idCheckBtn').show();					// ID 중복 확인 버튼 보이기
            modal.find('#empNo').val('');
            modal.find('#indate label').hide();					// 입사일 숨기기
            modal.find('#empIndate').hide();
            modal.find('#outdate label').hide();				// 퇴사일 숨기기
            modal.find('#outdate button').hide();				// 퇴사처리 버튼 숨기기
            modal.find('#empOutdate').hide();
            modal.find('#newPw').hide();						// 새 비밀번호 확인 숨기기
            modal.find('#pronolist label').hide();				// 프로젝트 목록 숨기기
            modal.find('#proNoList').hide(); 
            modal.find('.scroll').hide();
//             modal.find('#proNoList').empty();				// 프로젝트 목록 초기화
            $('#empFireyn').html('');
            modal.data('status', 'register');
        } else if (status === 'view') {
            modal.find('.modal-title').text('사원 상세보기');
            modal.data('status', 'view');
            modal.find($('#positionNo')).prop('disabled', true);
            modal.find($('#empName')).on('click', function() {
	            modal.find($('#positionNo')).prop('disabled', false);
			});
            modal.find($('#modalForm input')).prop('readonly', true);
            
            $('#modalForm input').on('click', function() {
                $(this).attr('readonly', false);
            });
            modal.find('#insertBtn').hide(); 					// 등록 버튼 숨기기
            modal.find('#updateBtn').show(); 					// 수정 버튼 보이기
            modal.find('#empProfileFiles').show();				// 파일 입력 필드 숨기기
            modal.find('#empName').attr('style', 'font-size: 1.5em;');	// 이름 스타일 속성 초기화
            modal.find('#idCheckBtn').hide();					// ID 중복 확인 버튼 숨기기
            modal.find('#DaumPostcode1').show();				// 우편번호 찾기 버튼 숨기기
            modal.find('#indate label').show();					// 입사일 보이기
            modal.find('#empIndate').show();
            modal.find('#outdate label').show();				// 퇴사일 보이기
            modal.find('#outdate button').show();				// 퇴사처리 버튼 보이기
            modal.find('#empOutdate').show();
            
            modal.find('#newPw').show();						// 새 비밀번호 확인 보이기
            modal.find('#pronolist label').show();				// 프로젝트 목록 숨기기
            modal.find('#proNoList').show(); 
            modal.find('.scroll').show();
            
            
            // 사원 상세 정보 로드 (예: AJAX 요청)
            var empNo = modal.data('empno');
            loadEmployeeDetails(empNo);
            setupFireButton(); // 여기에 추가
        }
    });
	
 	// 모달이 닫힐 때 에러 메시지와 is-invalid 클래스 제거
    $('#register-modal').on('hidden.bs.modal', function () {
        $('.error').text('');
        $('.form-control').removeClass('is-invalid');
        $('.form-select').removeClass('is-invalid');
        location.reload();
    });
 	
	// 관리자 사원 등록 - 입력 필드에 한 글자라도 입력되면 에러 메시지와 is-invalid 클래스 제거
    $('.form-control').on('input', function() {
        $(this).removeClass('is-invalid');
        $('span[for="' + this.id + '"]').text('');
    });
	
	// 사원 등록 모달 오픈 (사원 목록 상단)
    $('#empAddBtn').click(function() {
        console.log("#empAddBtn 클릭!");
    	$('#register-modal').data('status', 'register').modal('show');
    });

    // 사원 등록 모달 안의 실제 등록 버튼 (모달안)
    $('#insertBtn').click(function() {
    	// 아이디 중복확인 미완료시
        if(!idCheckFlag){
//         	alert("아이디 중복 확인을 해주세요.");
        	Swal.fire({title : '아이디 중복 확인을 해주세요.',
				icon : 'warning'});
        	return;
        }
    	$('#empNo').val('0');
        var positionNo = $("#positionNo option:selected").text();	// 선택된 직급 값을 가져옴
    	var formData = new FormData($('#modalForm')[0]);
        formData.append('positionNo', positionNo);	// 직급 값을 FormData에 추가
      	
        $.ajax({
            url: '/employee/empInsert.do',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
            success: function(response) {
//                 alert('사원 정보가 성공적으로 등록 되었습니다.');
//                 $('#register-modal').modal('hide');
//                 location.reload();
                Swal.fire({
                    title: '사원 정보가 성공적으로 등록되었습니다..',
                    icon: 'info'
                }).then(() => {
	                $('#register-modal').modal('hide');
                });
            },
            error: function(xhr, status, error) {
                // 컨트롤러에서 보낸 errors 출력, 등록 진행 불가하게 시킴 (입력값 검증)
            	if (xhr.status === 400) {
                    var errors = xhr.responseJSON;
                    // 입력값 검증 에러 지우기
                    $('.error').text('');
                    $('.form-control').removeClass('is-invalid');
                    
                 	// 직급 선택 요소에 대한 변경 이벤트
                    $('#positionNo').on('change', function() {
                        if ($(this).val() !== "") {
                            // 값이 선택되었을 때 (빈 문자열이 아닐 때)
                            $(this).removeClass('is-invalid');
                            $('span[for="positionNo"]').text('');
                        } else {
                            // 값이 선택되지 않았을 때 (빈 문자열일 때)
                            $(this).addClass('is-invalid');
                            $('span[for="positionNo"]').text('직급을 선택해주세요');
                        }
                    });
                 
                    if (errors.empName) {
                        $('#empName').addClass('is-invalid');
                        $('span[for="empName"]').text(errors.empName);
                    }
                    if (errors.positionNo) {
                        $('#positionNo').addClass('is-invalid');
                        $('span[for="positionNo"]').text(errors.positionNo);
                    }
                    if (errors.empMail) {
                        $('#empMail').addClass('is-invalid');
                        $('span[for="empMail"]').text(errors.empMail);
                    }
                    if (errors.empId) {
                        $('#empId').addClass('is-invalid');
                        $('span[for="empId"]').text(errors.empId);
                    }
                    if (errors.empPw) {
                        $('#empPw').addClass('is-invalid');
                        $('span[for="empPw"]').text(errors.empPw);
                    }
                    if (errors.empPhone) {
                        $('#empPhone').addClass('is-invalid');
                        $('span[for="empPhone"]').text(errors.empPhone);
                    }
                } else {
                    alert('사원 등록 중 오류가 발생했습니다.');
                    console.error('## Status:', status);
                    console.error('## Error:', error);
                    console.error('## Response:', xhr.responseText);
                }
            }
        });
    });
    

	// 관리자 사원 등록 - 중복확인 클릭 이벤트(비동기)
// 	var sequenceNumber = 1; // 순번 초기값
	$('#idCheckBtn').on('click', function() {

		console.log("중복확인 버튼 클릭!");
		if($(this).text() === "자동생성하기"){
	        generateAndCheckId();
	    }else{
			var id = $('#empId').val();	// 아이디 입력 값
			if(id == null || id == ""){
	// 			alert("아이디를 입력해 주세요!");
				Swal.fire({title : '아이디를 입력해 주세요!',
							icon : 'warning'});
				$('#empId').focus();
				return false;
			}
			var data = {
				empId : id
			};
			console.log("## 전송할 데이터:", data); // 콘솔 로그 추가
			$.ajax({
				url : "/employee/idCheck.do",
				type : "post",
				beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf값 설정
					xhr.setRequestHeader(header, token); // key(header), 값(token)
				},
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				success : function(res) {
					console.log("## 서버 응답 - 아이디중복확인 : " + res);
					var err = $('.error')[3];	// .error span중 arr에 담아서 0번째만 가져온다
					if(res == "NOTEXIST"){	// 아이디 사용 가능
						$(err).html("사용 가능한 아이디 입니다.").css("color", "green");
						idCheckFlag = true;	// 중복확인 완료
					}else{	// 아이디 중복 ==> idCheck이전에 선행되어야 함
						$(err).html("사용 불가능한 아이디 입니다.").css("color", "red");
						idCheckFlag = false;	// 중복확인 완료
						setTimeout(function() {
							$('#idCheckBtn').text("자동생성하기");
						}, 1000);	// 1초 지연
					}
				},
				error: function(xhr, status, error) {
                    console.error("## 아이디 중복확인 아작스 실패 : " + status + ", " + error);
                }
			});
	    }
		
	});
	
    // 수정 버튼 클릭 이벤트 (모달 안에 있는 버튼)
    $('#updateBtn').click(function() {
    	
		// 비밀번호, 새 비밀번호 불일치시 수정시 검증(일치 여부 확인)
	   var empPw = $('#empPw').val();
	   var empPw1 = $('#empPw1').val();
	   var errorMessage = $('.error.invalid-feedback[for="empPw1"]');
	   
	   if (empPw1 !== "" && empPw !== empPw1) {
		   errorMessage.text('비밀번호가 일치하지 않습니다.').show();
	        errorMessage.addClass('blink');
	        setTimeout(function() {
	            errorMessage.removeClass('blink');
	        }, 1500); // 1.5초 후 깜빡임 효과 제거
	        return false; // 비밀번호가 일치하지 않으면 여기서 함수 실행 중단
	    } else {
	        errorMessage.hide();
	    }
		
		// 폼 외부 데이터추가, 내부에 있지만 동적생성된거 또는 변경데이터, 기본 폼데이터 수정할때 는 appen()메서드 써야함
        var formData = new FormData($('#modalForm')[0]);
        console.log("formData", formData);
//         formData.append('positionNo', positionNo);	// 직급 값을 FormData에 추가
//         formData.append('empOutdate', empOutdate);	// 퇴사일을 FormData에 추가
//         console.log("## positionNo : ", positionNo);
//         formData.append('## empProfileimg : ', empProfileimg);	// 직급 값을 FormData에 추가
        
        // 수정 요청
        $.ajax({
            url: '/employee/empUpdate.do',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
            success: function(response) {
//                 alert('사원 정보가 성공적으로 수정되었습니다.');
//                 location.reload();
                
                Swal.fire({
                    title: '사원 정보가 성공적으로 수정되었습니다.',
                    icon: 'info'
                }).then(() => {
	                $('#register-modal').modal('hide');
                });
            },
            error: function(xhr, status, error) {
                alert('사원 정보 수정 중 오류가 발생했습니다.');
                console.error(xhr.responseText);
            }
        });
    });
    
 	// 관리자 사원 상세보기 - 버튼 클릭 이벤트
    $('body').on('click', '.table-user', function(){
//     $('body').on('click', '.table-user', function() {
//     	console.log("## .table-user 클릭!");
        var empNo = $(this).data('empno')
        var modal = $('#register-modal');
        //$('#register-modal').data('status', 'register').modal('show');

        // 모달에 empNo 값을 설정
//         modal.data('empno', empNo);
//         modal.data('status', 'view');
        
        console.log("status" , modal.data('status'));
        console.log("## .table-user 클릭! empNo: " + empNo); // 디버깅용 콘솔 로그
        $('#register-modal').data('status', 'view').data('empno', empNo).modal('show');
        
        // 모달이 열릴 때 사원 상세 정보 로드
//         loadEmployeeDetails(empNo);
    });
    

	// 내정보 클릭시 사원 상세보기
	// 사원 헤더 myAccount (내정보)
    $('.myAccount1').on('click', function() {
		console.log(".myAccount 클릭 : ", $('.myAccount1').text());
//			const csrfToken = $("#_csrf").attr("content");
//			const csrfHeader = $("#_csrf_header").attr("content");
		
    	var empNo = '${empInfo.empNo }';//$(this).data('empno');
		
         // 모달에 empNo 값을 설정
        console.log("## .myAccount 클릭! empNo: " + empNo); // 디버깅용 콘솔 로그
        $('#register-modal').data('status', 'view').data('empno', empNo).modal('show');
        
        //-----------------------------------------------
      	console.log($('#empName'));
      	$('#empName').attr('disabled',true);		
      	$('#positionNo').prop('disabled', true);
      	$('#empMail').attr('disabled',true);
     	$('#empId').prop('disabled', true);
     	$('#empIndate').prop('disabled', true);
     	$('#empOutdate').prop('disabled', true);
     	$('#outdate button').hide();				// 퇴사처리 버튼 숨기기
	});
	


	// 상세보기 - 프로필 이미지 선택 이벤트(open 파일을 통해 이미지 파일을 선택하면 이벤트 발생)
	empProfileFiles.on('change', function(event) {
		
		file = event.target.files[0];	// 내가 선택한 파일(우리는 이미지가 되겠다.)
		// IsimgFile 펑션 생성
		console.log(isimgFile(file));
		if(isimgFile(file)){	// 이미지 파일이라면
			
			// 파일 읽어올 reader
			var reader = new FileReader();
			reader.onload = function(e) {
				// 프로필 이미지 element에 src 경로로 result를 셋팅한다.
				// event안에 들어있는 이미지 파일 데이터가  base64로 변형된 데이터를 src 경로에 설정된다
				empProfileimg.attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{	// 이미지 파일이 아니라면
// 			alert("이미지 파일을 선택해주세요!");
			Swal.fire({title : '이미지 파일을 선택해 주세요!',
				icon : 'warning'});
		
		}
	});

	// 상세보기 - 전화번호 입력값 검증
    $('#empPhone').on('focus keyup', function() {
		var empPhone = $('#empPhone').val();
		if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(empPhone)) {
	        $('span[for="empPhone"]').text("사용 가능한 전화번호입니다.").css("color", "green");
	    } else {
	        $('span[for="empPhone"]').text("형식을 지켜주세요. ex) 01x-xxxx-xxxx").css("color", "red");
	    }
	});
    
    // 상세보기 - 비밀번호, 새 비밀번호 확인 이벤트
    $(document).on('input', '#empPw1', function() {
        var empPw = $('#empPw').val();
        var empPw1 = $(this).val();
        console.log("Input event triggered");
        console.log("## empPw = " + empPw + ", empPw1 = " + empPw1);
        if (empPw1 !== "") {
            if (empPw !== empPw1) {
                $('.error.invalid-feedback[for="empPw1"]').text('비밀번호가 일치하지 않습니다.').show();
                return false;
            } else {
                $('.error.invalid-feedback[for="empPw1"]').hide();
            }
        } else {
            $('.error.invalid-feedback[for="empPw1"]').hide();
        }
    });
    

	// 상세보기 - 상세주소 포커스가 이동하는 순간 이벤트 (주소에 맞는 지도를 띄운다)
	empAddress2.focusout(function() {
		var address1 = $('#empAddress1').val();	// 일반주소 데이터
		var address2 = $('#empAddress2').val();	// 상세주소 데이터
		
		// 일반주소 데이터가 존재하지 않는 경우, 지도를띄울수 없기 떼문에 데이터 유무의 기준을 address1로 설정
		if(address1 != null || address1 != ""){
			// 카카오지도 api검색> https://accounts.kakao.com/login/?continue=https%3A%2F%2Fdevelopers.kakao.com%2Flogin%3Fcontinue%3D%252Fconsole%252Fapp&lang=ko#login
			// 키발급
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div
			mapContainer.style.display = "block";
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address1 + " " + address2, function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
	
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">HOME</div>'
			        });
			        infowindow.open(map, marker);
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    }
			});
		}

 	
	 
	
  //=================================== 사원 등록, 상세보기 스크립트 끝 =====================================================
	});	
		
		let seletedMember;
		let disabledMemberList = [];
		
		$('#btn-createProjectContentAuto').click(function() {
			$('#formCreateProject input[name=proName]').val('최종 발표 시연용 프로젝트');
			$('#formCreateProject textarea[name=proContent]').val('최종 발표 시연용 프로젝트입니다.');
			$('#formCreateProject input[type=date]').val('2024-08-05');
		})
		
		let submitBtn = $('#btn-submitCreatePrject');
		let createProjectForm = $('#formCreateProject');
		submitBtn.click(function() {
			event.preventDefault();
	//			alert("서브밋");
			sendAlarm("createProject",1,"${empInfo.empName}",0,0);
			createProjectForm.submit();
		})
		// 셀렉터에 사원 목록 불러오기
		$.ajax({
			url :'/project/selectAllMember',
			type :'post',
			async : false,
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
		    success : function(res){
		    	let html = "";
		    	for(let i = 0; i < res.length; i++) {
		    		if("${empInfo.empNo}" == res[i].empNo) {
			    		html += `<option value="\${res[i].empNo}" hidden><p>\${res[i].empName}</p></option>`;
		    		} else {
			    		html += `<option value="\${res[i].empNo}"><p>\${res[i].empName}</p></option>`;
		    		}
		    	}
		    	$('#selectEntryMember').append(html);
		    }
		});
		
	

		$('#selectEntryMember').on('change',function() {
			
			let thisVal = $(this).val();
			
// 			disabledMemberList.push(Number(thisVal));
// 			console.log(disabledMemberList);
			
			// 선택한 옵션 인덱스 가져와서 숨김
			var idx = $("#selectEntryMember option").index($("#selectEntryMember option:selected"));
			$("#selectEntryMember option").eq(idx).hide();
			
			
			let entryLength = $('#entryMember').children().length;
			
			if(entryLength > 9) {
// 				alert("최대 인원을 초과했습니다!")
				Swal.fire({title : '최대 인원을 초과했습니다!',
					icon : 'warning'});
				return false;
			}
			
// 			for(let i = 0; i <= entryLength; i++) {
// 				console.log($('#selectEntryMember').find(`[data-empno="\${thisVal}"]`));
// 				$('#selectEntryMember').find(`[data-empno="\${thisVal}"]`).attr('disabled',true);
// 			}
			
			// 선택한 멤버 데려옴. 프사 추가해야 함.
			$.ajax({
				url :'/project/addEntryMember',
				type :'post',
				async : false,
				data : { empNo : thisVal } ,
				beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
			         xhr.setRequestHeader(header, token);
			     },
			    success : function(res){
			    	let addInput = `<input name="entryMember" data-inputno="\${res.empNo}" value="\${res.empNo}" hidden />`;
			    	let html = `<div data-empno="\${res.empNo}" class="ms-3">\${res.empName}<span class="ri ri-close-line"></span></div>`;
			    	
			    	$('#entryMember').append(html);
			    	$('#formCreateProject').append(addInput);
			    }
			});
			
			// 셀렉트 된 옵션을 처음 옵션으로 변경
			$('#selectEntryMember').prop('selectedIndex', 0);
		})
		
		// 참여중인 사원 아이콘 클릭시 삭제하고 리스트에 보이게 하기
		$('#entryMember').on('click','span',function() {
			
			let slectedIdx = $(this).parent().data('empno');
			console.log("slectedIdx : " +slectedIdx);
			$("#selectEntryMember option").eq(slectedIdx).show();
			$(this).parent().remove();
			
			console.log(slectedIdx);
			
			createProjectForm.find((`[data-inputno="\${slectedIdx}"]`)).remove();
			
		})
		
		$(document).on('click','.read-alarm',function(){
			let mythis = $(this).parent().parent();
			let armValue = $(this).parent().parent().find('.alarmToggleHiddenArmNo').val();
			console.log(armValue);
			let datas = {armNo : armValue , empNo : ${empInfo.empNo} };
			
			$.ajax({
				url : '/alarmApp/alarmDetailRemove.do',
				type :'post',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(datas),
				beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
			         xhr.setRequestHeader(header, token);
			    },
			    success : function(res){
			    	mythis.remove();
			    	
			    },
			    error : function(xhr){
			    	alert(xhr.status);
			    }

				
			})
			
		});
		
	});
	
token = $("meta[name='_csrf']").attr("content");
header = $("meta[name='_csrf_header']").attr("content");
currentDate = new Date();
	


	function showMyAlarm(){
		var empNo = "${empInfo.empNo}";
		let data = { empNo : empNo };
		
		
		$.ajax({
			url:'/alarmApp/alarmList.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(data),
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
			success : function(res){
				let alarmHtml = "";
				let changedType = "";
				for(i=0; i<res.length; i++){
					if(res[i].armCategoryNo==2){
						changedType ="일감 상태 변경";
					}else if(res[i].armCategoryNo==5){
						changedType ="프로젝트 생성 신청";
					}else if(res[i].armCategoryNo == 1){
						changedType ="프로젝트 승인";
					}else if(res[i].armCategoryNo == 6){
						changedType = "프로젝트 반려";
					}else if(res[i].armCategoryNo == 3){
						changedType = "프로젝트 공지사항 등록";
					}else if(res[i].armCategoryNo == 4){
						changedType = "새 이메일";
					}else if(res[i].armCategoryNo == 7){
						changedType ="일감 수정";
					}else if(res[i].armCategoryNo == 8){
						changedType ="일감 등록";
					}
					
					alarmHtml += "	<div class='dropdown-item p-0 notify-item card unread-noti shadow-none mb-2'>   ";
					alarmHtml += "		<input type='hidden' value='"+res[i].armNo+"' class='alarmToggleHiddenArmNo' '>   ";
					alarmHtml += "		<div class='card-body'>                                                    ";
					alarmHtml += "			<span class='float-end noti-close-btn text-muted read-alarm' style='cursor : pointer;'> ";
					alarmHtml += "			<i class='mdi mdi-close'></i></span>                                   ";
					alarmHtml += "			<div class='d-flex align-items-center'>                                ";
					alarmHtml += "				<div class='flex-shrink-0'>                                        ";
					alarmHtml += "					<div class='notify-icon bg-primary'>                           ";
					alarmHtml += "						<i class='mdi mdi-comment-account-outline'></i>            ";
					alarmHtml += "					</div>                                                         ";
					alarmHtml += "				</div>                                                             ";
					alarmHtml += "				<div class='flex-grow-1 text-truncate ms-2'>                       ";
					alarmHtml += "					<h5 class='noti-item-title fw-semibold font-14'>               ";
					alarmHtml += changedType;
					alarmHtml += "						<small class='fw-normal text-muted ms-1'>";
					alarmHtml += timeDifference(currentDate, new Date(res[i].armDateStr));
					alarmHtml += "</small> ";
					alarmHtml += "					</h5>                                                          ";
					alarmHtml += "					<small class='noti-item-subtitle text-muted'>";
					alarmHtml += "					<small class='noti-item-subtitle text-muted'>";
					alarmHtml += "<div href='#' data-bs-toggle='tooltip' data-bs-placement='bottom' style='white-space: normal' title='"+res[i].armContent+"'>";
					alarmHtml += res[i].armContent;
					alarmHtml += "</div>";
					alarmHtml += "</small>          ";
					alarmHtml += "				</div>                                                             ";
					alarmHtml += "			</div>                                                                 ";
					alarmHtml += "		</div>                                                                     ";
					alarmHtml += "	</div>                                                                           ";
					
					
				}
				
				
				$('#alarmToggleTarget').html(alarmHtml);
				
				$('#alarmToggleDropdownIcon').html('');
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
		
		$.ajax({
			url : '/alarmApp/changeYN.do',
			type : 'post',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
	        },
		      success : function(res){
			    	console.log("실행결과 : "+res);
		    },
			    error : function(xhr){
			    	console.log("오류 : "+xhr.status);
		    }
		});
		
		$.ajax({
			url :'/alarmApp/removeRed.do',
			type :'post',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
		    success : function(res){
		    	console.log("빨간점 없애기 성공!");
		    },
		    error : function(xhr){
		    	console.log("빨간점 없애기 실패 ");
		    }
			
		});
	}
	
	function alarmReadAndRemove(){
		console.log("클릭");
		
		var empNo = "${empInfo.empNo}";
		let data = { empNo : empNo };
		
		$.ajax({
			url:'/alarmApp/alarmRemove.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(data),
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
			success : function(res){
// 				alert("삭제가 완료되었습니다.");
				Swal.fire({
                    title: '삭제가 완료되었습니다..',
                    icon: 'info'
                }).then(() => {
					var dropdownElement = document.querySelector('.dropdown.notification-list .dropdown-toggle');
	                var dropdown = bootstrap.Dropdown.getInstance(dropdownElement);
	                if (dropdown) {
	                    dropdown.hide();
	                }
                });
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
		
	}
	
	
	function timeDifference(current, previous) {
        const msPerMinute = 60 * 1000;
        const msPerHour = msPerMinute * 60;
        const msPerDay = msPerHour * 24;
        const msPerMonth = msPerDay * 30;
        const msPerYear = msPerMonth * 12;
        const elapsed = Math.abs(current - previous);
        
        if (elapsed < msPerMinute) {
            return Math.round(elapsed / 1000) + ' 초 전';
        } else if (elapsed < msPerHour) {
            return Math.round(elapsed / msPerMinute) + ' 분 전';
        } else if (elapsed < msPerDay) {
            return Math.round(elapsed / msPerHour) + ' 시간 전';
        } else if (elapsed < msPerMonth) {
            return Math.round(elapsed / msPerDay) + ' 일 전';
        } else {
            return Math.round(elapsed / msPerMonth) + ' 개월 전';
        } 
    }
	
	
	$('#btn-autoInsertEmp').click(function() {
		$('#empName').val('김코딩');
		$('#positionNo').val(1);
		$('#empMail').val('codingKim@google.com');
		$('#empPhone').val('010-1234-1234');
		$('#empBirth').val('1999-12-31');
	})

</script>	

