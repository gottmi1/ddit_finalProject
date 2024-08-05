<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!-- Select2 css -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/privateCSS/PSA/styles.css" rel="stylesheet" type="text/css" />



 <div class="row">
     <div class="col-12">
         <div class="page-title-box ">
              <h4 class="page-title">이메일</h4>
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
            <!-- Left sidebar -->
            <div class="page-aside-left">
               <div class="d-grid">
                  <button type="button" class="btn btn-info" id="compose">메일 쓰기</button>
               </div>

               <div class="email-menu-list mt-3">
                  <a href="javascript: void(0);" data-status="1" class="text-danger fw-bold selectMenu">
                     <i class="ri-inbox-line me-2">
                     </i>
                     받은메일함
<!--                      <span class="badge badge-danger-lighten float-end ms-2">7</span> -->
                  </a> 
                  <a href="javascript: void(0);" data-status="2">
                     <i class="ri-mail-send-line me-2"></i>
                     보낸메일함
                  </a>
                  <a href="javascript: void(0);" data-status="3">
                     <i class="ri-price-tag-3-line me-2"></i>
                     중요메일함
                  </a> 
                  <a href="javascript: void(0);" data-status="4">
                     <i class="ri-article-line me-2"></i>
                     임시보관함
<!--                      <span class="badge badge-info-lighten float-end ms-2">32</span> -->
                  </a>
                  <a href="javascript: void(0);" data-status="5">
                     <i class="ri-delete-bin-line me-2"></i>
                     휴지통
                     <button type="button" id="btn-trashClean" class="btn btn-outline-light rounded-pill">비우기</button>
                  </a>
                     
               </div>

            </div>
            <!-- End Left sidebar -->

            <div class="page-aside-right">
               <div class="mt-3 inbox" id="targetInbox">
               		<div class="email-top-menu">
	               	<hr/>
                       <div class="d-flex flex-wrap gap-2">
                     		<div class="form-check" style="margin-top: 10px; margin-left:20px;">
                              <input type="checkbox" class="form-check-input" id="customCheck1">
                              <label class="form-check-label" for="customCheck1">&nbsp;</label>
                          </div>
                          <button type="button" class="btn btn-secondary" id="btn-emailRead" data-topbtn="1" disabled>읽음</button>
                          <button type="button" class="btn btn-secondary" id="btn-emailReply" data-topbtn="2" disabled>답장</button>
                          <button type="button" class="btn btn-secondary" id="btn-emailimportant" data-topbtn="3" disabled>중요메일</button>
                          <button type="button" class="btn btn-secondary" id="btn-emailTrash" data-topbtn="4" disabled>삭제</button>
                       </div>
                    	<hr/>
               		</div>
                    
                    
                  <ul class="email-list">
                     <c:forEach var="receiveVO" items="${pagingVO.dataList}" varStatus="stat">
                     
                     	<c:if test="${receiveVO.receiveRead == 1 }">
                     		<li class="unread one-email">
		                        <div class="email-sender-info">
		                           <div class="checkbox-wrapper-mail">
		                              <div class="form-check">
		                                 <input type="checkbox" class="form-check-input email-check">
		                                 <label class="form-check-label"></label>
		                              </div>
		                           </div>
		                           
		                           <c:choose>
		                           		<c:when test="${receiveVO.receiveCategory == 2}">
		                           			<span class="star-toggle mdi mdi-star text-warning"></span>
		                           		</c:when>
		                           		<c:otherwise>
		                           			<span class="star-toggle mdi mdi-star-outline"></span>
		                           		</c:otherwise>
		                           </c:choose>
		                           
		                           <a href="javascript: void(0);" class="email-title">${receiveVO.empName }</a>
		                        </div>
		                        
		                        <div class="email-content" data-id="${receiveVO.mailVO.mailNo}" data-empname="${receiveVO.empName }" data-send-empno="${receiveVO.mailSender }">
		                           <a href="javascript: void(0);" class="email-subject">
		                           	  ${receiveVO.mailVO.mailTitle }
		                           </a>
		                           <small class="email-date" style="width:auto"><fmt:formatDate value="${receiveVO.mailVO.mailDate }" pattern="yyyy. M. d. a h:mm:ss" /></small>
		                        </div>
		                     </li>
                     	</c:if>
                     
                     	<c:if test="${receiveVO.receiveRead == 2 }">
                     		<li class="read one-email">
		                        <div class="email-sender-info">
		                           <div class="checkbox-wrapper-mail">
		                              <div class="form-check">
		                                 <input type="checkbox" class="form-check-input email-check" id="mail1">
		                                 <label class="form-check-label" for="mail1"></label>
		                              </div>
		                           </div>
		                           
		                           <c:choose>
		                           		<c:when test="${receiveVO.receiveCategory == 2}">
		                           			<span class="star-toggle mdi mdi-star text-warning"></span>
		                           		</c:when>
		                           		<c:otherwise>
		                           			<span class="star-toggle mdi mdi-star-outline"></span>
		                           		</c:otherwise>
		                           </c:choose>
		                           
		                           <a href="javascript: void(0);" class="email-title">${receiveVO.empName }</a>
		                        </div>
		                        <div class="email-content" data-id="${receiveVO.mailVO.mailNo}" data-empname="${receiveVO.empName }" data-send-empno="${receiveVO.mailSender }">
		                           <a href="javascript: void(0);" class="email-subject">
		                           	  ${receiveVO.mailVO.mailTitle }
		                           </a>
		                           <small class="email-date" style="width:auto"><fmt:formatDate value="${receiveVO.mailVO.mailDate }" pattern="yyyy. M. d. a h:mm:ss" /></small>
		                        </div>
		                     </li>
                     	</c:if>
                     </c:forEach>
                  </ul>
                  
                  <td colspan="5" id="pagingArea">${pagingVO.getPagingHTML()}</td>
                  
               </div>
            <div class="mt-3 compose-email-form d-none">
            <hr/>
                <div class="list-inline d-flex flex-wrap gap-3">
                     <button type="button" id="sendEmailButton" class="btn btn-primary"><i class="mdi mdi-send me-1"></i>보내기</button>
                     <button type="button" id="saveSendMailButton" class="btn btn-soft-secondary">임시저장</button>
                     <div style="width : 70%"></div>
                     <button type="button" id="btn-autoInsert" class="btn btn-soft-primary">자동완성</button>
                </div>
            <hr/>
               <div class="px-3 pt-3 pb-0">
                   <form id="sendEmailForm" action="/email/send" method="post" enctype="multipart/form-data">
                       <div class="mb-2" id="msgtoDiv">
                           <label for="msgto" class="form-label">받는사람</label>
                           <select id="msgto" class="select2 form-control select2-multiple" data-toggle="select2" multiple="multiple">
							</select>
                       </div>
                       <div class="mb-2">
                           <label for="mailsubject" class="form-label">제목</label>
                           <input type="text" id="mailsubject" name="mailTitle" class="form-control" placeholder="Your subject">
                       </div>
                  <div class="mb-2">
                     <label class="form-label">첨부 파일</label>
                     <input class="form-control" id="mailFiles" type="file" multiple="multiple" name="mailFiles">
                  </div>
                       <div class="write-mdg-box mb-3">
                           <textarea class="form-control" name="mailContent" id="mailEdit" required></textarea>
                       </div>
                       <sec:csrfInput/>
                   </form>
               </div>
              </div>
               <div class="mt-3 compose-email-form"></div>
            </div>
            <!-- end inbox-rightbar-->
         </div>
         <!-- end card-body -->
         <div class="clearfix"></div>
      </div>
      <!-- end card-box -->
   </div>
   <!-- end Col -->
</div>
<!-- End row -->

    <!-- SimpleMDE js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.js"></script>

    <!-- Page init js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.inbox.js"></script>
    
    <!--  Select2 Js -->
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/select2/js/select2.min.js"></script>   
    
    <!-- Alert Script -->
	<c:if test="${not empty msg}">
	    <script>
	//         alert("${message}");
	        Swal.fire({title : '${msg}',
				icon : 'info'});
	    </script>
	</c:if>
    
    
<script>
$(document).ready(function() {
	
    CKEDITOR.replace("mailContent", {
		filebrowserUploadUrl : "${pageContext.request.contextPath}/imageUpload.do?${_csrf.parameterName}=${_csrf.token}"
	});
    CKEDITOR.config.height = "600px";
    
 // 자동완성 버튼
	$('#btn-autoInsert').click(function() {
		$('#mailsubject').val('자동완성 메일 제목. 뭘 넣어야 할까?');
		CKEDITOR.instances.mailEdit.setData("자동완성 내용입니다 뭘 넣어야할까요?");
	})

	$('.page-link').attr('href','javascript:void(0)');
	
	// 셀렉터에 사원 목록 불러오기
	$.ajax({
		url :'/email/selectAllMember',
		type :'post',
		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	         xhr.setRequestHeader(header, token);
	      },
	    success : function(res){
	    	let html = "";
	    	for(let i = 0; i < res.length; i++) {
		    	html += `<option value="\${res[i].empNo}"><p>\${res[i].empName}</p></option>`;
	    	}
	    	$('#msgto').append(html);
	    }
	});
	
	let targetStatus = 1;
	// 체크박스 선택된 이메일 목록
	let checkedObject =  $('.email-check:checked');
	
	let topMenuChange = function(targetStatus) {
		if(targetStatus == 2 || targetStatus == 4) {
	    	  $('.email-top-menu').show();
	    	  
	    	 $("#btn-emailRead").hide();
	    	 $("#btn-emailReply").hide();
	    	 $("#btn-emailimportant").hide();
	      } else if( targetStatus == 5) {
	    	  $('.email-top-menu').hide();
	      }
	      else {
	    	 $('.email-top-menu').show();
	    	  
	    	 $("#btn-emailRead").show();
	     	 $("#btn-emailReply").show();
	     	 $("#btn-emailimportant").show();
	      }
	}
	
	let fn_topBtnDisabled = function() {
		$("#btn-emailRead").attr('disabled',true);
   	 	$("#btn-emailReply").attr('disabled',true);
   	 	$("#btn-emailimportant").attr('disabled',true);
   	 	$("#btn-emailTrash").attr('disabled',true);
	}
	
	// 메일 메뉴 이동
   $(document).on('click', '.email-menu-list a', function(e) {
	  
	   // 이전 선택되어있던 select2 요소 삭제
	   $('#msgto').select2().val(null).trigger('change');
	   
	   // 전체체크 풀리게
	   $('#customCheck1').prop('checked',false);
	   
	  // 탑버튼 막음
	  fn_topBtnDisabled();
	   
	  $('.email-top-menu').show();
      $('.compose-email-form').addClass("d-none");
      $('.inbox').removeClass("d-none")
      
      e.preventDefault();
      
      let menuListLength = $('.email-menu-list').children().length;
      
      for(let i = 0; i < menuListLength; i ++) {
         $('.email-menu-list').children().removeClass('text-danger fw-bold selectMenu');
      }
      
      targetStatus = $(this).data('status');
      $(this).addClass('text-danger fw-bold selectMenu');
      
      // 중요메일 버튼 text 바꾸기
      if(targetStatus == 3) {
    	  $('#btn-emailimportant').text("중요메일 해제")
      } else {
    	  $('#btn-emailimportant').text("중요메일")
      }
    	  
      // 탑메뉴 변경 함수
      topMenuChange(targetStatus);
      
      // 보낼 데이터 선언
      let sendData;
      if(targetStatus == 1) {
    	  sendData = JSON.stringify({ receiveCategory : 1 }) 
      } else if(targetStatus == 2) {
    	  sendData = JSON.stringify({ sendCategory : 1 }) 
      } else if(targetStatus == 3) {
    	  sendData = JSON.stringify({ receiveCategory : 2 }) 
      } else if(targetStatus == 4) {
    	  sendData = JSON.stringify({ sendCategory : 2 }) 
      } else {
    	  sendData = JSON.stringify({ receiveCategory : 3 }) 
      }
      
      $.ajax({
         url: "/email/menuChange",
         type: 'post',
         data : sendData,
         contentType : 'application/json',
         beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	         xhr.setRequestHeader(header, token);
	      },
         success: function(data) {
        	 console.log(data);
            $('.email-list').html("");

             let html = "";
            if(data.receiveList.length === 0 && data.mailList.length === 0) {
                 switch(targetStatus) {
                     case 1:
                         html = `<div class="text-center">
                       			<i class="mdi mdi-email-variant text-body"></i>
                       			<p>받은 메일이 없습니다.</p>
                         		</div>`;
                         break;
                     case 2:
                         html = `<div class="text-center">
	                  			<i class="mdi mdi-email-variant text-body"></i>
	               				<p>보낸 메일이 없습니다.</p>
	               				</div>`;
                         break;
                     case 3:
                         html = `<div class="text-center">
	                  			<i class="mdi mdi-email-variant text-body"></i>
	               				<p>중요 메일이 없습니다.</p>
	               				</div>`;
                         break;
                     case 4:
                         html = `<div class="text-center">
	                  			<i class="mdi mdi-email-variant text-body"></i>
	               				<p>임시 보관함이 비어 있습니다.</p>
	               				</div>`;
                         break;
                     case 5:
                         html = `<div class="text-center">
	                  			<i class="mdi mdi-trash-can-outline text-body"></i>
                  				<p>휴지통이 비어있습니다.</p>
                  				</div>`;
                         break;
                 }
                 $('.pagination').remove(); 
                 $('.email-list').html(html);
             } else
	             {
	           	 	drawMailList(data);
	             }
         }, error : function(xhr){
        	 console.log(xhr.status);
         }
         
      });
   }); // 메일 메뉴 이동 끝

   
   // 메일쓰기 메뉴 이동 시작
   $(document).on('click', '#compose', function() {
	   // 답장 눌렀을 때 숨긴 select2-container를 다시 보여주기 위함.
	   CKEDITOR.instances.mailEdit.setData("");
	   viewSendMailForm();
   });// 메일쓰기 메뉴 이동 끝
  
   let viewSendMailForm = function() {
	   // 메일 쓰기 - select2 선택된 거 비우기
	   $('#msgto').select2().val(null).trigger('change');
	   
	   $('.input-mailNo').remove();
	   
	   // 변경되었을 때 타이틀/컨텐츠 비우기
	   $('#mailsubject').val("");
	   $('#mailEdit').val("");
	   
	   // $('#cke_1_contents').remove();
	   $('.cke_editable').remove();
	   
	   $('.compose-email-form').removeClass("d-none");
	      $('.inbox').addClass("d-none")
	     $('.email-menu-list').children().removeClass('text-danger fw-bold');

   }
   
   
   
   // 삭제 일관 처리(휴지통으로 감)
   $('#btn-emailTrash').click(function() {
	   
	   let currentMenu = $('.selectMenu').data('status');
	   let currentPage = $('.active').find('span').text();
	   
	   currentPage = parseInt(currentPage.split(" ")[2]);
	   
	   $('#customCheck1').prop('checked',false);
	   
	   let emailNoList = [];
	   for(let i = 0; i < checkedObject.length; i++) {
		   let emailNo = checkedObject.eq(i).parents('.one-email').find('.email-content').data('id');
		   emailNoList.push(emailNo);
	   }
	   
		let receiveCategory = 1;
		
		let sendData;
	   
		let goUrl = "/email/allTrash";
		
		// 중요메일함에서 삭제할 때
	   if(targetStatus == 3) {
		   receiveCategory = 2;
		   sendData = { receiveCategory : receiveCategory, emailNoList : emailNoList, selectedMenu : currentMenu , selectedPage : currentPage };
     	} 
	   else if(targetStatus == 2) { // 보낸 메일함에서 삭제할 때
     		let sendCategory = 1;
     		sendData = { sendCategory : sendCategory, emailNoList : emailNoList, selectedMenu : currentMenu , selectedPage : currentPage };
     		goUrl = "/email/deleteSendMail";
     	} 
	   else if(targetStatus == 4) { // 임시 보관함에서 삭제할 때
     		let sendCategory = 2;
     		sendData = { sendCategory : sendCategory, emailNoList : emailNoList, selectedMenu : currentMenu , selectedPage : currentPage };
     		goUrl = "/email/deleteSendMail";
     	} 
	   else { // 받은 메일함에서 삭제할 때 ( 기본 ) 
     		sendData = { receiveCategory : receiveCategory, emailNoList : emailNoList, selectedMenu : currentMenu , selectedPage : currentPage };
     	}
 	   
	   $.ajax({
			url :goUrl,
			type :'post',
			data : JSON.stringify(sendData),
			contentType : 'application/json',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
		    success : function(data){
		    	if(targetStatus == 4) {
		    		let data = {
		    				selectedPage : 1,
		    				selectedMenu : 4
		    		}
		    		fn_asyncPaging(data);
		    	} else {
		    		drawMailList(data);
		    	}
		    }
		});
	   fn_topBtnDisabled();
   })
   
   // 중요메일 버튼으로 일괄 처리 이벤트
   $("#btn-emailimportant").click(function() {
	   let currentMenu = $('.selectMenu').data('status');
	   let currentPage = $('.active').find('span').text();
	   
	   currentPage = parseInt(currentPage.split(" ")[2]);
	   
	   $('#customCheck1').prop('checked',false);
	   
	   if(checkedObject.length == 0) {
// 		   alert("이메일을 선택해주세요.");
		   Swal.fire({title : '이메일을 선택해 주세요',
   			icon : 'warning'});
		   return false;
	   }
	   let receiveCategory = 1;
	   
	   if(targetStatus == 3) {
		   receiveCategory = 2;
     	}
	   
	   let emailNoList = [];
	   for(let i = 0; i < checkedObject.length; i++) {
		   let emailNo = checkedObject.eq(i).parents('.one-email').find('.email-content').data('id');
		   emailNoList.push(emailNo);
	   }
	   
	   let sendData = { receiveCategory : receiveCategory, emailNoList : emailNoList, selectedMenu : currentMenu , selectedPage : currentPage};
	   
	   	let goUrl = "";
	   
	   if(targetStatus == 1) {
		   goUrl = "/email/allImportant";
	   } 
	   else 
	   {
		   goUrl = '/email/clearImpotant';
	   }
	   
	   console.log(sendData);
	   
	   $.ajax({
			url : goUrl,
			type :'post',
			data : JSON.stringify(sendData),
			contentType : 'application/json',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
		    success : function(data){
		    	drawMailList(data);
		    	console.log(data);
		    	if(data.receiveList.length == 0) {
		    		let html = `
		    		<div class="text-center">
          				<i class="mdi mdi-email-variant text-body"></i>
       					<p>중요 메일이 없습니다.</p>
       				</div>`;
       				
		    		$('.email-list').html(html);
		    	}
		    }
		});
	   fn_topBtnDisabled();
   })
   
   // 읽음 버튼으로 일괄 처리 이벤트
   $('#btn-emailRead').click(function(){
	   let currentMenu = $('.selectMenu').data('status');
	   let currentPage = $('.active').find('span').text();
	   
	   currentPage = parseInt(currentPage.split(" ")[2]);
	   
	   $('#customCheck1').prop('checked',false);
	   if(checkedObject.length == 0) {
// 		   alert("이메일을 선택해주세요.");
		   Swal.fire({title : '이메일을 선택해 주세요.',
   			icon : 'warning'});
		   return false;
	   }
	   
	   let receiveCategory = 1;
	   
	   if(targetStatus == 3) {
		   receiveCategory = 2;
     	}
	   
	   let emailNoList = [];
	   for(let i = 0; i < checkedObject.length; i++) {
		   let emailNo = checkedObject.eq(i).parents('.one-email').find('.email-content').data('id');
		   emailNoList.push(emailNo);
	   }
	   
	   let sendData = { receiveCategory : receiveCategory, emailNoList : emailNoList, selectedMenu : currentMenu , selectedPage : currentPage};
	   
	   $.ajax({
			url :'/email/allRead',
			type :'post',
			data : JSON.stringify(sendData),
			contentType : 'application/json',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
		    success : function(data){
		    	drawMailList(data);
		    }
		});
	   fn_topBtnDisabled();
   })
   
   
   
   // 휴지통 비우기
   $('#btn-trashClean').click(function() {
	   if(targetStatus != 5) {
		   return;
	   }
	   
	   if($('.email-list').find('p').text() == '휴지통이 비어있습니다.') {
		   Swal.fire({
               title: '휴지통에 메일이 없습니다.',
               icon: 'warning'
           })
           return;
	   } else {
		   Swal.fire({
		        title: '정말로 휴지통을 비우시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonText: '삭제',
		        cancelButtonText: '취소'
		    }).then((result) => {
		        if (result.isConfirmed) {
		            $.ajax({
		                url: '/email/trashClean',
		                type: 'post',
		                beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
		                    xhr.setRequestHeader(header, token);
		                },
		                success: function(data) {
		                    let html = `<div class="text-center">
	                  			<i class="mdi mdi-trash-can-outline text-body"></i>
                  				<p>휴지통이 비어있습니다.</p>
                  				</div>`;
                  				
                  			$('.pagination').remove();
                  			$('.email-list').html(html);
		                },
		            });
		        } else {
		            Swal.fire({
		                title: '취소되었습니다.',
		                icon: 'info'
		            });
		        }
		    });
	   }
	   
	   
	   
	   
	   
	   
   })
   
   $('#msgto').change(function() {

	   // select2를 통해 값 가져오기
	   var selectedValue = $('#msgto').select2('val');

	   for(let i = 0; i < selectedValue.length; i++) {
	   }
	  
	   // select2를 통해 값 설정하기
	   //select2Element.select2('val', 'newValue');
   })
   
	// 메일 전송 시작
   $('#sendEmailButton').on('click', function() {
// 	   event.preventDefault();
	   // 선택된 받는 사람들을 한꺼번에 가져와서 submit 전에 처리한다.
	   var lis = $("#msgtoDiv").find("li");
	   var options = $("#msgto").find("option");
	   var html = "";
	   
	   lis.map(function(i, v){
		   options.map(function(j, x){
			   if(v.title == x.innerText){
				   html += "<input type='hidden' name='mailArr' value='"+x.value+"'/>";
				   // point1
				   sendAlarm("email","0",x.value,"0","0");
			   }
		   });
	   });
	   
	   $('#sendEmailForm').append(html);
	   $('#sendEmailForm').submit();
	});
   // 메일 전송 끝   
   
   // 임시저장
   $('#saveSendMailButton').on('click', function() {
	   var lis = $("#msgtoDiv").find("li");
	   var options = $("#msgto").find("option");
	   var html = "";
	   
	   lis.map(function(i, v){
		   options.map(function(j, x){
			   if(v.title == x.innerText){
				   html += "<input type='hidden' name='mailArr' value='"+x.value+"'/>";
			   }
		   });
	   });
	   
	   $('#sendEmailForm').attr("action","/email/saveSendMail");
	   $('#sendEmailForm').append(html);
	   $('#sendEmailForm').submit();
	});
   
   
   
   // 디테일 내부 답장버튼 이벤트
   $(document).on('click', '.btn-mailReply', function(e) {
	   CKEDITOR.instances.mailEdit.setData("");
	   e.preventDefault();
	   $('#msgtoDiv').children().hide();
	   let targetContainer = $('.currentSenderNo');
	   $('.replyMemberHiddenInput').remove();
	   fn_replyMail(targetContainer);
   });
   // 화면 상단 답장버튼 이벤트
   $(document).on('click', '#btn-emailReply', function(e) {
	   e.preventDefault();
	   CKEDITOR.instances.mailEdit.setData("");
	   $('#msgtoDiv').children().hide();
	   let targetContainer = $('.email-check:checked').parents('.one-email').find(".email-content");
	   $('.replyMemberHiddenInput').remove();
	   fn_replyMail(targetContainer);
   });
   
   // btn-mailForward
   $(document).on('click', '.btn-mailForward', function(e) {
	   e.preventDefault();
	   $('#msgtoDiv').children().hide();
	   $('.replyMemberHiddenInput').remove();
	   viewSendMailForm();
	   
	   let name = $('.currentSenderNo').data('empname');
	   let subject = $('.currentSenderNo').next().text();
	   
	   let content = $('.detailContent').nextAll("p").text();
	   
	   
	   let textareaContent = `
		<p>-----Original Message-----</p>
	   	<p>FROM : ` + name +  `</p>
	   	<p>Sent : ` + $('#mail-date').text() + ` </p>
		<p>Subject : ` + subject + ` </p>
		<p>content : </p>
	   `
	   
	   textareaContent += content;
	   
	   
// 	   $('#mailEdit').val(textareaContent);
	   CKEDITOR.instances.mailEdit.setData(textareaContent);
   });
   
   
   // 답장 이벤트
   let fn_replyMail = function(targetContainer) {
	   viewSendMailForm();
	   
	   let replyName = targetContainer.data('empname');
	   let replyEmpNo = targetContainer.data('send-empno');
	   
	   $('#msgto').select2().val(replyEmpNo).trigger('change');
   }
   
   let selectEmailCheckBox = function() {
	   $('#btn-emailRead').attr('disabled', false);
	   
	   let checkedLength = $('.email-check:checked').length;
	   console.log(checkedLength);
	   
	   checkedObject =  $('.email-check:checked');
	   
	   let importantMailFlag = false;
	   
	   console.log(checkedObject);
	   // 현재 선택된 체크박스에 중요메일이 포함되어있는지 확인
	   
	   if(targetStatus != 3) {
		   for(let i = 0; i < checkedLength; i++) {
			   if(checkedObject.eq(i).parents('.one-email').find('.star-toggle').hasClass('text-warning')) {
		   			importantMailFlag = true;
	   			}
		   }
	   }
	   
	   // 중요메일 포함하는지 확인
	   if(importantMailFlag) {
		   $('#btn-emailimportant').attr('disabled',true);
	   } else {
		   $('#btn-emailimportant').attr('disabled',false);
	   }
	   
	   // 일반
	   if (checkedLength == 0) {
		   $("#btn-emailRead").attr('disabled',true);
		   $("#btn-emailReply").attr('disabled',true);
		   $("#btn-emailimportant").attr('disabled',true);
		   $("#btn-emailTrash").attr('disabled',true);
	   }  else {
		   $("#btn-emailRead").attr('disabled',false);
		   $("#btn-emailTrash").attr('disabled',false);
	   }
	   
		// 1개 초과해서 선택할 시 답장버튼 막기
	   if(checkedLength == 1) {
		   $("#btn-emailReply").attr('disabled',false);
	   } else {
		   $("#btn-emailReply").attr('disabled',true);
	   }
	   
   }
   
// 체크박스 선택에 따른 이벤트
   $('#targetInbox').on('click','.email-check', function() {
	   selectEmailCheckBox();
   })

   // 체크박스 전체 선택 이벤트
   $('#customCheck1').click(function(){
		var checked = $('#customCheck1').is(':checked');
		
		if(checked) {
			$('.email-check').prop('checked',true);
			selectEmailCheckBox();
		} else {
			$('.email-check').prop('checked',false);
			selectEmailCheckBox();
			fn_topBtnDisabled();
		}
	});
   
   
   // 리스트 받아서 이메일 리스트 그려주는 함수
   let drawMailList = function(dataMap) {
	   
	   console.log(dataMap);
	   
	   $('.pagination').remove();
	   $('.email-list').html("");
   	
 	  	let html = "";
 	  	
 	  	let data = dataMap.pagingVO.dataList;
 	  	
 	  	if(targetStatus == 4) {
 	  		data = dataMap.pagingMailVO.dataList;
 	  	}
 	  		
	   if(targetStatus != 4) {
		   for(let i = 0; i < data.length; i++) {
		   		
	         	 let star = `<span class="star-toggle mdi mdi-star-outline"></span>`
	         	 if(data[i].receiveCategory == 2 && data[i].receiveCategory != 3) {
	         		 star = `<span class="star-toggle mdi mdi-star text-warning"></span>`
	         	 }
	         	 
	         	 if(targetStatus == 2 || targetStatus == 5 || targetStatus == 4) {
	           		 star = ``;
	           	 }
	         	 
	         	 let leadFlag = `unread`;
	         	 if(data[i].receiveRead == 2) {
	         		 leadFlag = `read`;
	         	 }
	         	 
	         	 let checkBox = `<input type="checkbox" class="form-check-input email-check">`;
	         	 if(targetStatus == 5) {
	         		 checkBox = ``;
	         	 }
	         	 
	         	 let date = new Date(data[i].mailVO.mailDate);
	         	 let formattedDate = date.toLocaleString();
	         	 
	              html += `
	              <li class="\${leadFlag} one-email">
	                  <div class="email-sender-info">
	                      <div class="checkbox-wrapper-mail">
	                          <div class="form-check">
	                          		\${checkBox}
	                              <label class="form-check-label"></label>
	                          </div>
	                      </div>
	                      \${star}
	                      <a href="javascript: void(0);" class="email-title">\${data[i].empName }</a>
	                  </div>
	                  <div class="email-content" data-id="\${data[i].mailVO.mailNo}" data-empname="\${data[i].empName}" data-send-empno="\${data[i].mailSender}">
	                      <a href="javascript: void(0);" class="email-subject">
	                     	 \${data[i].mailVO.mailTitle }
	                      </a>
	                      <small class="email-date" style="width:auto">\${formattedDate}</small>
	                  </div>
	              </li>
	              `;
	          }
	   } else {
		   for(let i = 0; i < data.length; i++) {
		   		
	         	 let checkBox = `<input type="checkbox" class="form-check-input email-check">`;
	         	 
	         	 let date = new Date(data[i].mailDate);
	         	 let formattedDate = date.toLocaleString();
	         	 
	              html += `
	              <li class="unread one-email">
	                  <div class="email-sender-info">
	                      <div class="checkbox-wrapper-mail">
	                          <div class="form-check">
	                          		\${checkBox}
	                              <label class="form-check-label"></label>
	                          </div>
	                      </div>
	                      <a href="javascript: void(0);" class="email-title">작성중인 메일</a>
	                  </div>
 	                  <div class="email-content" data-id="\${data[i].mailNo}" data-empname="\${data[i].empName}" data-title="\${data[i].mailTitle}" data-send-empno="\${data[i].mailSender}" data-content="\${data[i].mailContent}" data-receiver-list="\${data[i].mailReceiverList}">
	                      <a href="javascript: void(0);" class="email-subject">
	                     	 \${data[i].mailTitle }
	                      </a>
	                      <small class="email-date" style="width:auto">\${formattedDate}</small>
	                  </div>
	              </li>
	              `;
	          }
	   }
	   
	   $('.email-list').append(html);
	   $('#targetInbox').append(dataMap.pagingVO.pagingHTML);
	   $('.page-link').attr('href','javascript:void(0)');
   }
   
   
   
   
   
   // 메일 상세보기 페이지 시작
   $(document).on('click', '.email-list .email-content', function(e) {
	   $('.pagination').hide();
	   $('.email-top-menu').hide();
	   
        let mailNo = $(this).data('id'); // 클릭된 email-content 요소의 data-id 속성 값 가져오기
        console.log(mailNo); // 확인을 위해 콘솔에 출력
        
        if (mailNo === undefined) {
            console.error('mailNo is undefined');
            return;
        }

        if(targetStatus != 4) {
        $.ajax({
            url: "/email/detail",
            type: 'POST',
            data: JSON.stringify({ id: mailNo, targetStatus : targetStatus }),
            contentType : 'application/json',
            beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
            success: function(result) {
               	let res = result.receiveList;
               	let fileList = result.fileList;
               	
                   console.log(res); 
                   console.log(fileList);
               	
               	$('.email-list').html("");
               	
               	let date = new Date(res[0].mailVO.mailDate);
               	let detailDate = date.toLocaleString();
                   
                   emailHtml = "";
                   emailHtml += "<hr/>";
                   emailHtml += "<div class='mt-3'>                                                                                                              ";
                   emailHtml += `<input type='text' class="currentSenderNo" value='\${res[0].mailNo}' data-empname="\${res[0].empName}" data-send-empno="\${res[0].mailSender}" hidden />                                                                                                              `;
   	            emailHtml += "    <h5 class='font-18'>"+ res[0].mailVO.mailTitle +"</h5> ";
   	            emailHtml += "    <hr>                                                                                                                        ";
   	            emailHtml += "    <div class='d-flex mb-3 mt-1 align-items-center'>                                                                                              ";
   	            emailHtml += "        <img class='d-flex me-2 rounded-circle' src='"+res[0].empProfileimg+"' alt='placeholder image' height='32'>     ";
   	            emailHtml += "        <div class='w-100 overflow-hidden'>                                                                                     ";
   	            emailHtml += "            <small class='float-end' id='mail-date'>" + detailDate + "</small>             ";
   	            emailHtml += "            <h6 class='m-0 font-14'>"+res[0].empName+"</h6> ";
   	            emailHtml += "        </div>                                                                                                                  ";
   	            emailHtml += "    </div>                                                                                                                      ";
   	            emailHtml += "    <p class='detailContent'>"+res[0].mailVO.mailContent+"</p>        ";
   	            emailHtml += "    <hr>                                                                                                                        ";
   	            emailHtml += "<h5 class='mb-3'>파일</h5>";
   	            
                   emailHtml += "<div class='row'>                                                                                                                                                     ";
   	            for(let i = 0; i < fileList.length; i++ ) {
   	            	emailHtml += "    <div class='col-xl-4 mb-1'>                                                                                                                                            ";
   	                emailHtml += "        <div class='card mb-0 shadow-none border'>                                                                                                                    ";
   	                emailHtml += "            <div class='p-2'>                                                                                                                                         ";
   	                emailHtml += "                <div class='row align-items-center'>                                                                                                                  ";
   	                emailHtml += "                    <div class='col-auto'>                                                                                                                            ";
   	                emailHtml += "                        <div class='avatar-sm'>                                                                                                                       ";
   	                emailHtml += "                            <span class='avatar-title text-bg-secondary rounded'>                                                                                     ";
   	                emailHtml += `                                .\${fileList[i].fileMime.split('/')[1]}                                                                                                                                `;
   	                emailHtml += "                            </span>                                                                                                                                   ";
   	                emailHtml += "                        </div>                                                                                                                                        ";
   	                emailHtml += "                    </div>                                                                                                                                            ";
   	                emailHtml += "                    <div class='col ps-0'>                                                                                                                            ";
   	                emailHtml += `                        <a href='javascript:void(0);' class='text-muted fw-bold'>\${fileList[i].fileOriginName} </a>                                                  `;
   	                emailHtml += "                    </div>                                                                                                                                            ";
   	                emailHtml += "                    <div class='col-auto'>                                                                                                                            ";
   	                emailHtml += `                        <a href='javascript:void(0);' class='btn btn-link btn-lg text-muted downloadLink' data-filename='\${fileList[i].fileSaveName }' data-originalfilename='\${fileList[i].fileOriginName }'>                                                                         `;
   	                emailHtml += "                            <i class='ri-download-2-line'></i>                                                                                                        ";
   	                emailHtml += "                        </a>                                                                                                                                          ";
   	                emailHtml += "                    </div>                                                                                                                                            ";
   	                emailHtml += "                </div>                                                                                                                                                ";
   	                emailHtml += "            </div>                                                                                                                                                    ";
   	                emailHtml += "        </div>                                                                                                                                                        ";
   	                emailHtml += "    </div> <!-- end col -->                                                                                                                                           ";
   	            }
   	            
   	            // 답장버튼은 받은메일함과 중요메일함만 추가
   	            if(targetStatus == 1 || targetStatus == 3) {
   	                emailHtml += "</div>                                                                                                                                                                ";
   		            emailHtml += "    <div class='mt-5'>                                                                                                          ";                                    
   		            emailHtml += "        <a href='' class='btn btn-secondary me-2 btn-mailReply'><i class='mdi mdi-reply me-1'></i> 답장</a>                                  ";
   		            emailHtml += `<a href="" class="btn btn-light btn-mailForward">Forward <i class="mdi mdi-forward ms-1"></i></a>`;
   		            emailHtml += "    </div>                                                                                                                      ";
   		            emailHtml += "</div>      ";
   		            
   		            
   	            }
   	            
   	            $('.email-list').html(emailHtml)
   	            
   	            let mailDate = new Date(res.mailVO.mailDate);
   	            let formattedDate = mailDate.toLocaleString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' });
                   $('#mail-date').text(formattedDate);
            }
        });
       } else {
    	   viewSendMailForm();
    	   
    	   $('#sendEmailForm').remove('.input-mailNo')
    	   
    	   let receiverListStr = $(this).data('receiver-list');
    	   let title = $(this).data('title');
    	   let content = $(this).data('content');
    	   let mailNo = $(this).data('id');
    	   
    	   let html = `<input type='hidden' name='mailNo' class="input-mailNo" value="\${mailNo}" />`;
    	   
    	   $('#sendEmailForm').append(html);
    	   // 제목 담아줌
    	   $('#mailsubject').val(title);
    	   // ckeditor로 해야해서 변경
    	   CKEDITOR.instances.mailEdit.setData(content);
    	   // 리시버 넘버 리스트 넘김
    	   fn_tempMailForm(receiverListStr);
       }
    });
   // 메일 상세보기 페이지 끝
   
   
   // 파일다운로드
   $(document).on('click','.downloadLink',function() {
	   
	    let fileName = $(this).data("filename");
	    let originalFileName = $(this).data("originalfilename");
	    
	    $.ajax({
	        url: "/email/downloadFile",
	        type: "POST",
	        data: {
	            fileName: fileName,
	            originalFileName: originalFileName
	        },
	        beforeSend : function(xhr){
	         xhr.setRequestHeader(header, token);
	      	},
	        xhrFields: {
	            responseType: 'blob'
	        },
	        success: function(blob) {
	            var link = document.createElement('a');
	            var url = window.URL.createObjectURL(blob);
	            link.href = url;
	            link.download = originalFileName;
	            document.body.append(link);
	            link.click();
	            link.remove();
	            window.URL.revokeObjectURL(url);
	        }
	    });
	});
});

let fn_tempMailForm = function(receiverList) {
	
	let selectedValues = [];
	// 길이 1일 때
	if(receiverList.length === undefined) {
		$('#msgto').select2().val(receiverList).trigger('change');
	} else {
		let receiverArr = receiverList.split(" ");
		
		for (let i = 0; i < receiverArr.length; i++) {
			selectedValues.push(receiverArr[i]);
		}
	    // select2 초기화 및 미리 선택된 값 설정
	    $('#msgto').select2().val(selectedValues).trigger('change');
	}
}

$('#targetInbox').on('click','.page-link',function() {
	// 페이지 이동시 전체 체크 체크박스도 체크 풀어줘야함
	$('#customCheck1').prop('checked',false);
	
	let selectedPage = parseInt($(this).text());
	let selectedMenu = $('.selectMenu').data('status');
	
	data = {
			selectedPage : selectedPage,
			selectedMenu : selectedMenu
	}
	fn_asyncPaging(data);
})

let fn_asyncPaging = function(data) {
	
	// 현재 이동할 페이지와 현재 선택된 메뉴를 가지고 메일을 필터링해오면 됨.
	$.ajax({
	 url: "/email/asyncPaging",
	 type: "GET",
	 data: data,
	 contentType : 'application/json',
	 success: function(res) {
		 $('.pagination').remove();
		 
		 $('.email-list').html("")
		let html = "";
		 
		let currentMenu = res.selectedMenu;
		 
		let data = res.pagingVO.dataList;
		if(currentMenu == 4) {
			data = res.pagingMailVO.dataList;
			
			
			
			for(let i = 0; i < data.length; i++) {
				
	 			let star = ``
	         	 
	         	 let leadFlag = `unread`;
	         	 
	         	 let checkBox = `<input type="checkbox" class="form-check-input email-check">`;
	         	 
	         	 let date = new Date(data[i].mailDate);
	         	 let formattedDate = date.toLocaleString();
	         	 
	              html += `
	              <li class="\${leadFlag} one-email">
	                  <div class="email-sender-info">
	                      <div class="checkbox-wrapper-mail">
	                          <div class="form-check">
	                          		\${checkBox}
	                              <label class="form-check-label"></label>
	                          </div>
	                      </div>
	                      \${star}
	                      <a href="javascript: void(0);" class="email-title">작성중인 메일</a>
	                  </div>
	                  <div class="email-content" data-id="\${data[i].mailNo}" data-send-empno="\${data[i].mailSender}">
	                      <a href="javascript: void(0);" class="email-subject">
	                     	 \${data[i].mailTitle }
	                      </a>
	                      <small class="email-date" style="width:auto">\${formattedDate}</small>
	                  </div>
	              </li>
	              `;
	          }
		} 
		else {
			
			
			for(let i = 0; i < data.length; i++) {
				
	 			let star = `<span class="star-toggle mdi mdi-star-outline"></span>`
	         	 if(data[i].receiveCategory == 2 && data[i].receiveCategory != 3) {
	         		 star = `<span class="star-toggle mdi mdi-star text-warning"></span>`
	         	 }
	         	 
	         	 if(currentMenu == 2 || currentMenu == 5 || currentMenu == 4) {
	           		 star = ``;
	           	 }
	         	 
	         	 let leadFlag = `unread`;
	         	 if(data[i].receiveRead == 2) {
	         		 leadFlag = `read`;
	         	 }
	         	 
	         	 let checkBox = `<input type="checkbox" class="form-check-input email-check">`;
	         	 if(currentMenu == 5) {
	         		 checkBox = ``;
	         	 }
	         	 
	         	 let date = new Date(data[i].mailVO.mailDate);
	         	 let formattedDate = date.toLocaleString();
	         	 
	              html += `
	              <li class="\${leadFlag} one-email">
	                  <div class="email-sender-info">
	                      <div class="checkbox-wrapper-mail">
	                          <div class="form-check">
	                          		\${checkBox}
	                              <label class="form-check-label"></label>
	                          </div>
	                      </div>
	                      \${star}
	                      <a href="javascript: void(0);" class="email-title">\${data[i].empName }</a>
	                  </div>
	                  <div class="email-content" data-id="\${data[i].mailVO.mailNo}" data-empname="\${data[i].empName}" data-send-empno="\${data[i].mailSender}">
	                      <a href="javascript: void(0);" class="email-subject">
	                     	 \${data[i].mailVO.mailTitle }
	                      </a>
	                      <small class="email-date" style="width:auto">\${formattedDate}</small>
	                  </div>
	              </li>
	              `;
	          }
			
		}
		
		
	
		$('.email-list').html(html);
		$('#targetInbox').append(res.pagingVO.pagingHTML);
		$('.page-link').attr('href','javascript:void(0)');
	 	}
	});
}


</script>
