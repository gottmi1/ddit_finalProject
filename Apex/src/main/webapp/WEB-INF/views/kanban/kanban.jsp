<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   




 <!-- Begin page -->
 		<!-- 일감상태별로 정리 -->
 		<c:set var="toDoListLength" value="${fn:length(toDoList)}" />
 		<c:set var="goingListLength" value="${fn:length(goingList)}" />
 		<c:set var="doneListLength" value="${fn:length(doneList)}" />
 		<c:set var="issueListLength" value="${fn:length(issueList)}" />
 		
<%--  		<c:set var="goingListLength" value="${fn:length(goingList)}" /> --%>
<%--  		<c:set var="doneListLength" value="${fn:length(doneList)}" /> --%>
<%--  		<c:set var="issueListLength" value="${fn:length(issueList)}" /> --%>
 		
		<!--  일감상태별로 정리 끝 -->
       <!-- Start Content-->
       <div class="container-fluid">

           <div class="row">
			     <div class="col-12">
			         <div class="page-title-box ">
			              <h4 class="page-title">칸반보드</h4>
			         </div>
			     </div>
			</div>

           <div class="row">
           <input type="hidden" value="${proNo }" id="proNo">
               <div class="col-12">
                   <div class="board">
                       <div class="tasks" data-plugin="dragula" data-containers='["task-list-one", "task-list-two", "task-list-three", "task-list-four"]'>
                           <h5 class="mt-0 task-header">할 일  </h5>
							
                           <div id="task-list-one" class="task-list-items">
								

								<c:forEach items="${toDoList }" var="toDoList" >
		                             <!-- Task Item -->
		                             <div class="card mb-0 taskItems" draggable="true">
		                             		<input type="hidden" class="workNo" value="${toDoList.workNo }"/>
		                                 <div class="card-body p-3">
		                                     
		                                     <h4 class="mt-2 mb-2" draggable="false">
		                                         <a href="/works/detail?workNo=${toDoList.workNo }" draggable="false" class="text-body">${toDoList.workTitle }</a>
		                                     </h4>
		                                     
		                                     <br/>
		                                     
											<div class="row">
			                                     <p class="col-8 mb-0">
			                                         <i class="mdi mdi-briefcase-outline text-muted"></i>
			                                         <span class="align-middle todohover" data-bs-toggle="tooltip"  data-bs-custom-class="primary-tooltip" data-bs-placement="bottom"
			                                         data-bs-title="
			                                         	<c:forEach items="${toDoList.managerList}" var="toDoManager" varStatus="status">
								                            ${toDoManager.empName}<c:if test="${!status.last}">, </c:if>
								                        </c:forEach>
			                                         	
			                                         ">
		                                         		${toDoList.managerList[0].empName } 
			                                         	<c:if test="${toDoList.managerCount ne 1 }">외  ${toDoList.managerCount -1 } 명</c:if>
			                                         </span>
			                                         
			                                         
			                                         
			                                     </p>
												<div class="col-4">
				                                     <h4 style="text-align: right;"><span class="badge <c:if test="${toDoList.workFirstName eq '낮음' }">text-bg-secondary</c:if>
													<c:if test="${toDoList.workFirstName eq '중간' }">bg-success</c:if>
													<c:if test="${toDoList.workFirstName eq '높음' }">bg-danger</c:if>">${toDoList.workFirstName }</span></h4>
												</div>
											</div>
		
		                                     <p class="mb-0">
		                                     </p>
		
	                                    	<small class="float-end text-muted">${toDoList.workStartdate } ~ ${toDoList.workEnddate }</small>
		                                 </div> <!-- end card-body -->
		                             </div>
		                             <!-- Task Item End -->
								
								</c:forEach>
                           </div> <!-- end company-list-1-->
                       </div>
                       
                       

                       <div class="tasks">
                           <h5 class="mt-0 task-header text-uppercase">진행중 </h5>

                           <div id="task-list-two" class="task-list-items">

                               	<c:forEach items="${goingList }" var="goingList" >
		                             <!-- Task Item -->
		                             <div class="card mb-0 taskItems" draggable="true">
		                             		<input type="hidden" class="workNo" value="${goingList.workNo }"/>
		                                 <div class="card-body p-3">
		                                     <h4 class="mt-2 mb-2" draggable="false">
		                                         <a href="/works/detail?workNo=${goingList.workNo }" draggable="false" class="text-body">${goingList.workTitle }</a>
		                                     </h4>
		                                     <br/>
		                                     
		                                     <p class="mb-0">
		                                     </p>
		
		                                     
		                                     <div class="row">
			                                     <p class="col-8 mb-0">
			                                         <i class="mdi mdi-briefcase-outline text-muted"></i>
			                                         <span class="align-middle goinghover"  data-bs-toggle="tooltip"  data-bs-custom-class="primary-tooltip" data-bs-placement="bottom"
			                                         data-bs-title="
			                                         	<c:forEach items="${goingList.managerList}" var="goingManager" varStatus="status">
								                            ${goingManager.empName}<c:if test="${!status.last}">, </c:if>
								                        </c:forEach>
			                                         ">
		                                         		${goingList.managerList[0].empName } 
			                                         	<c:if test="${goingList.managerCount ne 1 }">외  ${goingList.managerCount -1 } 명</c:if>
			                                         </span>
			                                     </p>
												<div class="col-4">
				                                     <h4 style="text-align: right;"><span class="badge <c:if test="${goingList.workFirstName eq '낮음' }">text-bg-secondary</c:if>
													<c:if test="${goingList.workFirstName eq '중간' }">bg-success</c:if>
													<c:if test="${goingList.workFirstName eq '높음' }">bg-danger</c:if>">${goingList.workFirstName }</span></h4>
												</div>
											</div>
		                                     
		                                     
		                                    <small class="float-end text-muted">${goingList.workStartdate } ~ ${goingList.workEnddate }</small>
		                                 </div> <!-- end card-body -->
		                             </div>
		                             <!-- Task Item End -->
								
								</c:forEach>

                           </div> <!-- end company-list-2-->
                       </div>


                       <div class="tasks">
                           <h5 class="mt-0 task-header text-uppercase">완료 </h5>
                           <div id="task-list-three" class="task-list-items">


                               	<c:forEach items="${doneList }" var="doneList" >
		                             <!-- Task Item -->
		                             <div class="card mb-0 taskItems" draggable="true">
		                             		<input type="hidden" class="workNo" value="${doneList.workNo }"/>
		                                 <div class="card-body p-3">
		                                     <h4 class="mt-2 mb-2" draggable="false">
		                                         <a href="/works/detail?workNo=${doneList.workNo }" draggable="false" class="text-body">${doneList.workTitle }</a>
		                                     </h4>
		                                     <br/>
		                                     
		                                     <p class="mb-0">
		                                     </p>
		
		                                     
		                                     <div class="row">
			                                     <p class="col-8 mb-0">
			                                         <i class="mdi mdi-briefcase-outline text-muted"></i>
			                                         <span class="align-middle donehover"  data-bs-toggle="tooltip"  data-bs-custom-class="primary-tooltip" data-bs-placement="bottom"
			                                         data-bs-title="
			                                         	<c:forEach items="${doneList.managerList}" var="doneManager" varStatus="status">
								                            ${doneManager.empName}<c:if test="${!status.last}">, </c:if>
								                        </c:forEach>
			                                         ">
		                                         		${doneList.managerList[0].empName } 
			                                         	<c:if test="${doneList.managerCount ne 1 }">외  ${doneList.managerCount -1 } 명</c:if>
			                                         </span>
			                                     </p>
												<div class="col-4">
				                                     <h4 style="text-align: right;"><span class="badge <c:if test="${doneList.workFirstName eq '낮음' }">text-bg-secondary</c:if>
													<c:if test="${doneList.workFirstName eq '중간' }">bg-success</c:if>
													<c:if test="${doneList.workFirstName eq '높음' }">bg-danger</c:if>">${doneList.workFirstName }</span></h4>
												</div>
											</div>
		                                     
		                                     
		                                    <small class="float-end text-muted">${doneList.workStartdate } ~ ${doneList.workEnddate }</small>
		                                 </div> <!-- end card-body -->
		                             </div>
		                             <!-- Task Item End -->
								
								</c:forEach>

                           </div> <!-- end company-list-3-->
                       </div>

                       <div class="tasks">
                           <h5 class="mt-0 task-header text-uppercase">이슈발생 </h5>
                           <div id="task-list-four" class="task-list-items">

                               	<c:forEach items="${issueList }" var="issueList" >
		                             <!-- Task Item -->
		                             <div class="card mb-0 taskItems" draggable="true">
		                             		<input type="hidden" class="workNo" value="${issueList.workNo }"/>
		                                 <div class="card-body p-3">
		                                     <h4 class="mt-2 mb-2" draggable="false">
		                                         <a href="/works/detail?workNo=${issueList.workNo }" draggable="false" class="text-body">${issueList.workTitle }</a>
		                                     </h4>
		                                     <br/>
		                                     
		                                     <p class="mb-0">
		                                     </p>
		
		                                     
		                                     <div class="row">
			                                     <p class="col-8 mb-0">
			                                         <i class="mdi mdi-briefcase-outline text-muted"></i>
			                                         <span class="align-middle issuehover" data-bs-custom-class="primary-tooltip" data-bs-toggle="tooltip" data-bs-placement="bottom"
			                                         data-bs-title="
			                                         	<c:forEach items="${issueList.managerList}" var="issueManager" varStatus="status">
								                            ${issueManager.empName}<c:if test="${!status.last}">, </c:if>
								                        </c:forEach>
			                                         ">
		                                         		${issueList.managerList[0].empName } 
			                                         	<c:if test="${issueList.managerCount ne 1 }">외  ${issueList.managerCount -1 } 명</c:if>
			                                         </span>
			                                     </p>
												<div class="col-4">
				                                     <h4 style="text-align: right;"><span class="badge <c:if test="${issueList.workFirstName eq '낮음' }">text-bg-secondary</c:if>
													<c:if test="${issueList.workFirstName eq '중간' }">bg-success</c:if>
													<c:if test="${issueList.workFirstName eq '높음' }">bg-danger</c:if>">${issueList.workFirstName }</span></h4>
												</div>
											</div>
		                                     
		                                     
		                                    <small class="float-end text-muted">${issueList.workStartdate } ~ ${issueList.workEnddate }</small>
		                                 </div> <!-- end card-body -->
		                             </div>
		                             <!-- Task Item End -->
								
								</c:forEach>

                           </div> <!-- end company-list-4-->
                       </div>

                   </div> <!-- end .board-->
               </div> <!-- end col -->
           </div>
           <!-- end row-->

       </div> <!-- container -->

    <!-- END wrapper -->
                         



<script>

$(function(){
	token = $("meta[name='_csrf']").attr("content");
	header = $("meta[name='_csrf_header']").attr("content");

	let dragged;
	let dropTarget;
	let draggedStarted;
	let proNo;
	
	
	
	// 드래그 가능한 대상
	$(document).on('drag','.task-list-items',function(event){
// 		console.log("드래그~");
	});
	
	// 드래그 시작
	$(document).on('dragstart','.task-list-items',function(event){
		dragged = event.target;
		event.target.classList.add("dragging");
		
// 		console.log("드래그 시작~~~");
	});
	
	//드래그 끝	
	$(document).on('dragend','.task-list-items',function(event){
		event.target.classList.remove("dragging");
// 		console.log("드래그 끝~~");
	});
	
	// 드롭 대상에서 발생하는 이벤트..
	$(document).on('dragover','.task-list-items',function(event){
		//기본 동작 취소?
// 		console.log("기본 동작 취소 ㅎ");
		// 드롭을 허용하려고 기본 동작 취소
		event.preventDefault();
	});
	
	// 드래그 가능한 요소가 대상 위로 오면 강조
	$(document).on('dragenter','.tasks',function(event){
		console.log("dragenter");
		if(event.target.classList.contains("task-list-items")){
			event.target.classList.add("dragover");
		}
	});
	
	$(document).on('dragleave','.tasks',function(event){
		console.log("dragleave");
		if(event.target.classList.contains("task-list-items")){
			event.target.classList.remove("dragover");
		}
	});
	
	
	
	
	$(document).on('drop','.task-list-items',function(event){
		dropTarget = $(event.target).closest('.task-list-items')[0];
		console.log($(event.target).closest('.task-list-items')[0]);
		console.log(dropTarget.id);
		event.preventDefault();
		
		let workStatus = null;
		let workNo = null;
		proNo = $('#proNo').val();
		
		
		// 아무것도없을때
		if(event.target.classList.contains("task-list-items")){
			
			event.target.classList.remove("dragover");
			
			
			dragged.parentNode.removeChild(dragged);
			workNo = $(dragged).find('.workNo').val()

			
			event.target.appendChild(dragged);
			console.log(event.target.id);

			
			if(event.target.id == "task-list-one"){ //할일
// 				alert("할일로이동")
				workStatus = 1;
			}else if(event.target.id == "task-list-two"){ //진행중
// 				alert("진행중으로이동")
				workStatus = 2;
			}else if(event.target.id == "task-list-three"){ //완료
// 				alert("완료로이동")
				workStatus = 3;
			}else if(event.target.id == "task-list-four"){ // 이슈발생
// 				alert("이슈발생으로이동")
				workStatus = 4;
			}
			
		// 다른 일감이 있을때	
		}else if(dropTarget.classList.contains("task-list-items")){
			dragged.parentNode.removeChild(dragged);
			
			dropTarget.appendChild(dragged);
			console.log(event.target.id);
			workNo = $(dragged).find('.workNo').val()
			
			if(dropTarget.id == "task-list-one"){ //할일
// 				alert("할일로이동")
				workStatus = 1;
			}else if(dropTarget.id == "task-list-two"){ //진행중
// 				alert("진행중으로이동")
				workStatus = 2;
			}else if(dropTarget.id == "task-list-three"){ //완료
// 				alert("완료로이동")
				workStatus = 3;
			}else if(dropTarget.id == "task-list-four"){ // 이슈발생
// 				alert("이슈발생으로이동")
				workStatus = 4;
			}
		}
		
		
		let myData = {
				workNo : workNo,
				workStatus : workStatus
		};
		console.log(myData);
		
		
		
		
		// 바뀔때 상태변경
		$.ajax({
			url : '/kanban/updateStatus.do',
			type : 'post',
			dataType : 'json',
			data : JSON.stringify(myData),
			contentType : 'application/json',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
			success : function(res){
				Swal.fire({title : '상태 변경이 완료되었습니다.',
					icon : 'info'});
				sendAlarm("updateStatus",workStatus,"${empInfo.empName}",workNo, proNo);
			},
			error : function(xhr){
				alert(xhr.status);
			}
			
		});
		
		
		
		
		
		
	});
	
	
	
	
	
	
});

</script>
