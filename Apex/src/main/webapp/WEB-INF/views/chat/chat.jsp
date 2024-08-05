<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    

	<div style="position: fixed; right: 30px; bottom: 40px;">
		<span class="float-start m-2 me-4">
			<i class="chatBg ri-message-3-line text-primary" id="messengerEnterIcon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottomRight">
			</i>
			<span id="chatAlarmIconArea">
				<c:if test="${not empty sessionScope.chatHtml }">
					<span class='position-absolute bottom-50 start-60 translate-middle p-1 bg-danger border border-light rounded-circle'></span>
				</c:if>
			</span>
	    </span>
	</div> 
	
	
	
	<div>
        <div class="offcanvas offcanvas-bottom-right myChatCanvas bg-light"  tabindex="-1" id="offcanvasBottomRight" aria-labelledby="offcanvasBottomRightLabel" style="position : absolute; right : 30px; bottom : 0;">
<!-- 	        <div class="offcanvas-header"> -->
	        
<!-- 	        </div> -->

			<div class="offcanvas-body">
       		
            <div class="row">
			<!-- start chat users-->
			
			
			<div class="col-xxl-4">
			
				<div class="card mb-0" style="height: 75vh;">
					<div class="card-body chatBody p-0">
							
						<!-- end nav-->
					
						<div class="tab-content">
							<div class="row">
								<div class="p-3 justify-content-between d-flex align-items-center">
								<div class="d-flex align-items-center">
									<!-- 업로드된 프로필사진 넣을곳 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	                                 <img src="${pageContext.request.contextPath }${empInfo.empProfileimg}" alt="noimg" class="img-thumbnail avatar-md rounded-circle mx-2">
	                                <h5>${empInfo.positionName} ${empInfo.empName }</h5>
								</div>
	                                <div class="">
	                                 <i class="mdi mdi-chat-plus-outline text-muted pe-3" id="newChatBtn" tabindex="0" data-bs-toggle="modal" data-bs-target="#newCahtModal" style="cursor:pointer; font-size:30px;"></i>
	                                </div>
		                        </div>
							</div>
						
						
							<div class="tab-pane show active card-body chatBody py-0" id="newpost">
							
								<!-- start search box -->
								<div class="dropdown d-none d-lg-block">
									<div class="w-100 position-relative">
										<input type="search" class="form-control mb-3"placeholder="사원을 입력해 주세요." id="searchChatEmpKeyup" data-bs-toggle="dropdown" style="display: none" />
										<div class="dropdown-menu dropdown-menu-animated" id="newChatDropDownArea" >
									   		</div>
										
										 
									</div>
										<input type="search" class="form-control form-control-light" id="searchDaehwabangKeyup" placeholder="대화방 검색"/> 
										 <div>
								   		</div>
											
								</div>
								<!-- end search box -->
							</div>
							
							

							<!-- users -->
							<div class="row">
								<div class="col">
									<div class="card-body chatBody py-0 my-3" data-simplebar 
									id="DaeHwaRoomTarget" style="max-height: 546px">
										
										<!-- 채팅방 선택 item 입력 ~!!!!!!!!!!!!!! ~~~~~~~~~~~~~~~~~~~~~~~~~-->

										<!-- 채팅방 선택 item 입력 ~!!!!!!!!!!!!!!  끝~~~~~~~~~~~~~~~~~~~~-->
										
									</div>
									<!-- end slimscroll-->
								</div>
								<!-- End col -->
							</div>
							<!-- end users -->
						</div>
						<!-- end tab content-->
					</div>
					<!-- end card-body-->
				</div>
				<!-- end card-->
			</div>
			<!-- end chat users-->

			<!-- chat area -->
			
			
			
			<div class="col-xxl-8" >
				<div class="card" style="height: 100%;" >
				
				

				<div class="nav nav-tabs d-flex align-items-center" style="border-bottom: 1px solid #ddd">
					<div class="col-lg-4 col-md-5 col-sm-5" style="padding: 10px;">
						<span class="chatbody2HiddenArea" style="display: none">
	                    	<img id="chatThumbnail" src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="noimg" class="img-thumbnail avatar-sm rounded-circle">
	                    	
	                    	<span style="align-items: center; justify-content: center;" class="mt-2">&nbsp;&nbsp;
	                    	 	<span style="font-size:17px; font-weight: bold;" id="myChatSangDae"></span>
	                    	 </span>
	                    	 &nbsp;&nbsp;
						</span>
                    </div>
                    <div class="col-lg-7 col-md-6 col-sm-6" style="text-align: right; margin-left: 40px ;">
                    	<span class="mt-5">
                    		<i class="ri-close-fill" id="closeOffcanvasBtn" style="font-size: 30px; cursor:pointer;"></i>
                    	</span>
                    </div>
					
                 </div>				
				
				
				
				
				
				
					<div class="card-body chatBody2 px-0 pb-0"  style="display : none">
						<ul class="conversation-list chatConversation-list px-3" data-simplebar
							style="max-height: 554px">
							
							
<!-- 							<li class="clearfix"> -->
<!-- 								<div class="chat-avatar"> -->
<!-- 									<img -->
<%-- 										src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg" --%>
<!-- 										class="rounded" alt="Shreyu N" /> <i>10:00</i> -->
<!-- 								</div> -->
<!-- 								<div class="conversation-text"> -->
<!-- 									<div class="ctext-wrap"> -->
<!-- 										<i>Shreyu N</i> -->
<!-- 										<p>Hello!</p> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="conversation-actions dropdown"> -->
<!-- 									<button class="btn btn-sm btn-link" data-bs-toggle="dropdown" -->
<!-- 										aria-expanded="false"> -->
<!-- 										<i class='uil uil-ellipsis-v'></i> -->
<!-- 									</button> -->

<!-- 									<div class="dropdown-menu dropdown-menu-end"> -->
<!-- 										<a class="dropdown-item" href="#">Copy Message</a> <a -->
<!-- 											class="dropdown-item" href="#">Edit</a> <a -->
<!-- 											class="dropdown-item" href="#">Delete</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</li> -->
							
							
							<li class="clearfix odd">
								<div class="chat-avatar">
									<img
										src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg"
										alt="dominic" class="rounded" /> <i>10:05</i>
								</div>
								<div class="conversation-text">
									<div class="ctext-wrap">
										<i>Dominic</i>
										<p>3pm it is. Sure, let's discuss about presentation
											format, it would be great to finalize today. I am attaching
											the last year format and assets here...</p>
									</div>
									<div class="card mt-2 mb-1 shadow-none border text-start">
										<div class="p-2">
											<div class="row align-items-center">
												<div class="col-auto">
													<div class="avatar-sm">
														<span class="avatar-title rounded"> .ZIP </span>
													</div>
												</div>
												<div class="col ps-0">
													<a href="javascript:void(0);" class="text-muted fw-bold">Hyper-admin-design.zip</a>
													<p class="mb-0">2.3 MB</p>
												</div>
												<div class="col-auto">
													Button
													<a href="javascript:void(0);"
														class="btn btn-link btn-lg text-muted"> <i
														class="ri-download-2-line"></i>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							
							
							
						</ul>
						
						
					<form class="needs-validation chatForm" novalidate="novalidate" name="chat-form"
						id="chat-form">
						<div class="row">
							<div class="col-md-9">
								<input type="text" class="form-control border-0"
									placeholder="메세지를 입력하세요." id="chatTextUpload" required="required"/>
									
							</div>
<!-- 								<div class="invalid-feedback">Please enter your -->
<!-- 									messsage</div> -->
								<div class="btn-group col-md-3">
								
									<label for="chatFileUpload" id="chatFileUploadIcon" class="btn btn-light">
										<i class="uil uil-paperclip"></i>
									</label>
									
									<input type="file" id="chatFileUpload" name="chatFile" style="display: none"/>
									
									<div class="d-grid">
										<button type="submit" id="chatSubmitBtn" class="btn btn-success chat-send chat-sendMyMessage">
											<i class='uil uil-message'></i>
										</button>
									</div>
								</div>
							<!-- end col -->
						</div>
						<!-- end row-->
					</form>
					
					
					
					</div>
					<!-- end card-body -->
				</div>
				<!-- end card -->
			</div>
			<!-- end chat area-->

		</div>
        </div>
        </div>
    </div>
    

                            
    
