<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
<title>Apex</title>
<head>

<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- App favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

<!-- Daterangepicker css -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">

<!-- Vector Map css -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css">

<!-- Theme Config Js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/hyper-config.js"></script>

<!-- App css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- Icons css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<!-- 채팅창 css -->
<link href="${pageContext.request.contextPath }/resources/privateCSS/PJH/chatLayout.css" rel="stylesheet" type="text/css" />

<!-- Datatable css -->
<%-- <link href="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" /> --%>
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css"> -->
<%-- <link href="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" /> --%>

<!-- sweetalert2 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- CKEditor -->
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

<!-- moment js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<!-- Quill css -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/quill/quill.core.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/vendor/quill/quill.snow.css" rel="stylesheet" type="text/css" /> 

<!-- template custom css -->
<link href="${pageContext.request.contextPath }/resources/privateCSS/PSA/styles.css" rel="stylesheet" type="text/css" />
<!-- Vendor js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- SockJS CDN - 실시간 웹소켓용 -->	
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>	




<!-- 다음주소 api : 사용자가 선택한 값 이용하기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오지도API > Sample > 라이브러리-주소로 장소 표시하기 > Javascript + HTML 에서 script 복사 -->
<!-- 카카오디벨로퍼?>앱키> JavaScript 키 에서 맞는거 복사 : 발급받은key 텍스트에 붙여넣기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=514f5269741c3bb2824fe72540c4c158&libraries=services"></script>


</head>
<script>
$(function(){
	token = $("meta[name='_csrf']").attr("content");
	header = $("meta[name='_csrf_header']").attr("content");
	var chatRoomNo = "";
	chatSocket = new SockJS("http://192.168.35.29/chat");
	alarmSocket = new SockJS("http://192.168.35.29/alarm");
	var offcanvasElement = document.getElementById("offcanvasBottomRight");
	let isOffcanvasOpen = false;
	
	var chatFiles;
	var chatFile;
	
	$.ajax({
		url : "/alarmApp/firstShowRed.do",
		type : "post",
		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	         xhr.setRequestHeader(header, token);
	    },
	    success : function(res){
	    	console.log(res);
	    	let html = "<span class='noti-icon-badge'></span>";
	    	if(res == "EXIST"){
	    		$('#alarmToggleDropdownIcon').html(html);
	    	}
	    },
	    error : function(xhr){
	    	alert("오류 :  "+xhr.status);
	    }
	});
	
	
	
	////////////////////////////////////////////////////////////////////////
	// 실시간 알림 영역
	////////////////////////////////////////////////////////////////////////
	
	// 연결이 열렸을 때 호출
	alarmSocket.onopen = function(){
		console.log("실시간 알림 연결됨");
	};
	
	// 메세지 수신
	alarmSocket.onmessage = function(message){
		if(message.data != null){
			let html = "<span class='noti-icon-badge'></span>";
			
			
			$.ajax({
				url : '/alarmApp/viewRed.do',
				type : 'post',
				data : { alarmHtml : html },
				beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
			         xhr.setRequestHeader(header, token);
			      },

				success : function(res){
					console.log("세션에 업데이트해주기 완료..");
					$('#alarmToggleDropdownIcon').html(html);
				}, 
				error : function(xhr){
					alert("오류내용 : "+xhr.status);
				}
				
			});
			
			
		}
//   		Swal.fire({title : '새로운 알람이 도착했습니다 . ',
//     			icon : 'info'});
// 		console.log(message.data);
// 		showTemporaryAlert();
		
	};
	
	// 연결이 닫혔을 때 
	alarmSocket.onclose = function(){
		console.log("실시간 알림 닫힘")
	};
	
	 offcanvasElement.addEventListener('show.bs.offcanvas', () => {
         isOffcanvasOpen = true;
		 console.log("open"+isOffcanvasOpen);
     });
     offcanvasElement.addEventListener('hide.bs.offcanvas', () => {
         isOffcanvasOpen = false;
    	 console.log("hide"+isOffcanvasOpen);
     });
	
	 function showTemporaryAlert() {
         var alertContainer = document.getElementById('alertContainer');
         var alertElement = document.createElement('div');
         alertElement.className = 'alert alert-warning alert-dismissible fade show';
         alertElement.role = 'alert';
         alertElement.innerHTML = `
             <strong>새로운 알림이 도착했습니다.</strong> 
         `;
         alertContainer.appendChild(alertElement);
         // 5초 후에 알림을 자동으로 닫기
         setTimeout(function() {
             var alert = new bootstrap.Alert(alertElement);
             alert.close();
         }, 2000);
     }
	 
	 function showNewChatTemporaryAlert() {
         var alertContainer = document.getElementById('alertContainer');
         var alertElement = document.createElement('div');
         alertElement.className = 'alert alert-info alert-dismissible fade show';
         alertElement.role = 'alert';
         alertElement.innerHTML = `
             <strong>새로운 메세지가 도착했습니다.</strong> 
         `;
         alertContainer.appendChild(alertElement);
         // 5초 후에 알림을 자동으로 닫기
         setTimeout(function() {
             var alert = new bootstrap.Alert(alertElement);
             alert.close();
         }, 2000);
     }
	
	// 웹소켓에 실시간으로 보내버리는 함수
	
	
	//////////////////////////////////////////////////////////////////////////////
	// 실시간 알림 영역 끝
	//////////////////////////////////////////////////////////////////////////////
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////
	// 실시간 채팅 영역
	//////////////////////////////////////////////////////////////////////////////
	
	chatSocket.onopen = function(){
		console.log("## 실시간 채팅 연결됨");
	};
	
	// 메세지 수신
	chatSocket.onmessage = function(message){
		
		
		console.log("## 메세지 도착 ");
		if(message.data != null){
// 			showNewChatTemporaryAlert();
		}
		let dataArray = message.data.split(',');
		chatroomNo = dataArray[0];
		var empNo = dataArray[1];
		chatAlarmHtml = "<span class='position-absolute bottom-50 start-60 translate-middle p-1 bg-danger border border-light rounded-circle'></span>";
		
		
		

		
		console.log("dataArray[0]"+dataArray[0])
		console.log("dataArray[1]"+dataArray[1])
		
		let chatData = {chatroomNo : chatroomNo};
		
		//////////////////////////////////////////!!!!!!!
		
		
		setTimeout(() => {
			console.log("isOffcanvasOpen : "+isOffcanvasOpen)
			if(isOffcanvasOpen){
				
			
				$.ajax({
					url : '/chatApp/showChatListByChatroomNo.do',
					type : 'post',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(chatData),
					beforeSend : function(xhr){
						xhr.setRequestHeader(header,token);
					},
					success : function(res){
						let chatHtml = "";
						chatRoomNo = res.chatroomNo;
						console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ")
						for(i=0; i<res.chatList.length; i++){
							
							if(res.chatList[i].fileDetailVO == null){
								chatHtml += "<li class='clearfix ";
								if(${empInfo.empNo} == res.chatList[i].chatWriter){
									chatHtml += "odd";
								}
								chatHtml += "'>";      
								chatHtml += "	<div class='chat-avatar ";
								chatHtml += " '> ";
								chatHtml += "		<img                                                                                      ";
								chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
								chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
								chatHtml += "	</div>                                                                                        ";
								chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' >";
								chatHtml += "	<div class='conversation-text'>                                                               ";
								chatHtml += "		<div class='ctext-wrap'>                                                                  ";
								chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>    ";
								chatHtml += "			<p>"+res.chatList[i].chatContent+"</p>                                                                         ";
								chatHtml += "		</div>                                                                                    ";
								chatHtml += "	</div>                                                                                        ";
								chatHtml += "</li>                                                                                            ";
							}else{
								chatHtml += "<li class='clearfix ";
								if(${empInfo.empNo} == res.chatList[i].chatWriter){
									chatHtml += "odd";
								}
								chatHtml += "'>";      
								chatHtml += "	<div class='chat-avatar ";
								chatHtml += " '> ";
								chatHtml += "		<img                                                                                      ";
								chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
								chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
								chatHtml += "	</div>                                                                                        ";
								chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' > &nbsp;";
								chatHtml += "	<div class='conversation-text'>         ";
								chatHtml += "		<div class='ctext-wrap'>  ";
								chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>    ";
								if(res.chatList[i].fileDetailVO.fileMime == 'jpg' || res.chatList[i].fileDetailVO.fileMime == 'png'){
									chatHtml += "<div class='row g-0 align-items-center motherItem";
									if(${empInfo.empNo} != res.chatList[i].chatWriter){
										chatHtml += " ms-2";
									}
									chatHtml += "'> ";
			                        chatHtml += "    <div class='col-8'>                                                                                                                                            ";
			                        chatHtml += "        <img src='${pageContext.request.contextPath }"+res.chatList[i].fileDetailVO.imgUrl+"' class='rounded-start thumbnailImg justify-content-center' alt='...'>      ";
			                        chatHtml += " 		 <input type='hidden' class='fileDetailNo' value='"+res.chatList[i].fileDetailVO.imgUrl+"'> ";
									chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName' > ";
			                        chatHtml += "	</div>         ";
									chatHtml += "			<div class='col-4'>                                                                  ";
									chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
									chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
									chatHtml += "				</button>                                                                                ";
									chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName' > ";
									
									chatHtml += "			</div>                                                                                  ";
									                                                                                                                                                                                   
								}else{
									chatHtml += "<div class='row ";
									if(${empInfo.empNo} == res.chatList[i].chatWriter){
										chatHtml += "justify-content-end";
									}
									chatHtml += "'>";
									chatHtml += "	<div class='row align-items-center motherItem";
									if(${empInfo.empNo} != res.chatList[i].chatWriter){
										chatHtml += " ms-2";
									}
									chatHtml += "'> ";
									chatHtml += "			<div class='col-3 ps-0'>                                                                  ";
									chatHtml += "				<div class='avatar-sm'>                                                             ";
									chatHtml += "					<span class='avatar-title rounded'>."+res.chatList[i].fileDetailVO.fileMime+" </span>";
									chatHtml += "					</div>                                                                          ";
									chatHtml += "			</div>                                                                                  ";
									chatHtml += "			<div class='col-6'>                                                                  ";
									chatHtml += "				<div class='text-muted fw-bold'>"+res.chatList[i].fileDetailVO.fileOriginName+"</div> ";
									chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName' > ";
									chatHtml += "				<p class='mb-0'>"+res.chatList[i].fileDetailVO.fileFancysize+"</p> ";
									chatHtml += "			</div>                                                                                  ";
									chatHtml += "			<div class='col-2 ps-0'>                                                                  ";
									chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
									chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
									chatHtml += "				</button>                                                                                ";
									chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName' > ";
									chatHtml += "			</div>                                                                                  ";
									chatHtml += "		</div>                                                                                      ";
									chatHtml += "	</div>                                                                                          ";
								}
								chatHtml += "		</div>      ";
								chatHtml += "	</div>              ";
								chatHtml += "</li>";
								
								
							}
						
						}
						$('.chatConversation-list').html(chatHtml);
						$('.chatBody2').show();
						$('.chatbody2HiddenArea').show();
						
		// 				console.log("업데이트된 chatConversation-list:", $('.chatConversation-list').html());
						
						setTimeout(function() {
				            var chatListt = $('.chatConversation-list');
				            chatListt.scrollTop(chatListt.prop("scrollHeight"));
				        }, 100); // 100ms 지연 후 스크롤 설정
						
						
					},
					error : function(xhr){
						alert("챗룸no 이용한 오류 : "+xhr.status);
					}
					
				});
			}
		
		
		
		if(empNo == '${empInfo.empNo}'){
			
			console.log("세션이랑 보낸사람이랑 같음..");
		}else{
			
			$.ajax({
				url : '/chatApp/viewRed.do',
				type : 'post',
				data : JSON.stringify({ chatHtml : chatAlarmHtml }),
				contentType : 'application/json',
				beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
			         xhr.setRequestHeader(header, token);
			      },

				success : function(res){
					console.log("세션에 업데이트해주기 완료..");
					console.log(chatAlarmHtml);
					$('#chatAlarmIconArea').html(chatAlarmHtml);
					
				}, 
				error : function(xhr){
					alert("오류내용 : "+xhr.status);
				}
				
			});
		}
		
		
		let mdata = {empNo : '${empInfo.empNo}'};
		
		$.ajax({
			url : '/chatApp/showChatRoomList.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(mdata),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				let chatRoomHtml = "";
				for(i=0; i<res.length; i++){
					chatRoomHtml += "<div class='text-body daehwabang' style='cursor:pointer; border-bottom: 1px solid #f0f0f0;''>                                      ";
					chatRoomHtml += "	<div class='d-flex align-items-start mt-1 p-2'>                                              ";
					chatRoomHtml += "	<input type='hidden' class='hiddenChatRoomNoAt' value='"+res[i].chatroomNo+"'>                                              ";
					chatRoomHtml += "		<img src='${pageContext.request.contextPath }"+res[i].otherEmpProfileimg+"' ";
					chatRoomHtml += "			class='me-2 rounded-circle' height='48' alt='no picture' />                       ";
					chatRoomHtml += "		<div class='w-100 overflow-hidden'>                                                      ";
					chatRoomHtml += "			<h5 class='mt-0 mb-0 font-14'>                                                       ";
					chatRoomHtml += "				<span class='float-end text-muted font-12'>"+chatTimeFormat(new Date(res[i].chatDateStr))+"</span> <span class='chatSangDaes'>";
					chatRoomHtml += res[i].otherEmpName;
					chatRoomHtml += " </span>			</h5>                                                                                ";
					chatRoomHtml += "			<p class='mt-1 mb-0 text-muted font-14'>                                             ";
					chatRoomHtml += "				<span class='w-25 float-end text-end'>                                    ";
					chatRoomHtml += "				 </span> <span                     ";
					chatRoomHtml += "					class='w-75'>"+res[i].lastChat+"</span>                                       ";
					chatRoomHtml += "			</p>                                                                                 ";
					chatRoomHtml += "		</div>                                                                                   ";
					chatRoomHtml += "	</div>                                                                                       ";
					chatRoomHtml += "</div>                                                                                          ";
				}
				$('#DaeHwaRoomTarget').html(chatRoomHtml);
				
				
				
				
				new SimpleBar(document.getElementById('DaeHwaRoomTarget'));
					
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
			
		}, 200);
		
	};
	
	
	// 연결이 닫혔을 때 
	chatSocket.onclose = function(){
		console.log("## 실시간 채팅 닫힘");
	};
	
	
	
	//////////////////////////////////////////////////////////////////////////////
	// 실시간 채팅 영역 끝
	//////////////////////////////////////////////////////////////////////////////
	
	
	



	
	$(document).on('keyup','#searchChatEmpKeyup',function(){
		let empNameData = $('#searchChatEmpKeyup').val();
		if(empNameData == '' || empNameData ==null){
			$('#searchChatEmpKeyup').dropdown('hide');
		}
		let empNameObj = {empNameData : empNameData};
		console.log(empNameData);
		$.ajax({
			url : '/employee/keyupSearchEmp',
			type : 'post',
			contentType : 'application/json',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
				xhr.setRequestHeader(header, token);
			},
			data : JSON.stringify(empNameObj),
			success : function(res){
				let html = "";
// 				if(res.length ==0 ){
// 					$('#newChatDropDownArea').hide();
// 				}else{
// 					$('#newChatDropDownArea').show();
					
// 				}
				
				
				for(i=0; i<res.length; i++){
					console.log("이름 "+res[i].empName)
					html+= "<div class='dropdown-item startChatWithOther'  style='cursor : pointer'>"
					html+= "<input type='hidden' value='"+res[i].empNo+"' class='chatHiddenEmpNo'>";
					html+= "<input type='hidden' value='"+res[i].empName+"' class='chatHiddenEmpName'>";
					html+= res[i].empName+"</div>";
				}
				
				$('#newChatDropDownArea').html(html);
				$('#searchChatEmpKeyup').dropdown('show');
				
			},
			error : function(xhr){
				alert(xhr.status)
			}
			
		});
		
	});
	
	// 새로운 대화
	$(document).on('click','#newChatBtn',function(){
		console.log("새로운ㄷ ㅐ화 버튼");
		$('#searchChatEmpKeyup').show();
		
		
		
	});
	
	
	
	// 대화방 찾기
	$(document).on('keyup','#searchDaehwabangKeyup',function(){
		$('#searchChatEmpKeyup').hide();
		console.log($('#searchDaehwabangKeyup').val())
		let searchValue = $('#searchDaehwabangKeyup').val();
		
		if(searchValue == null || searchValue == ''){
			
			let mdata = {empNo : '${empInfo.empNo}'};
			
			$.ajax({
				url : '/chatApp/showChatRoomList.do',
				type : 'post',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(mdata),
				beforeSend : function(xhr){
					xhr.setRequestHeader(header,token);
				},
				success : function(res){
					let chatRoomHtml = "";
					for(i=0; i<res.length; i++){
						chatRoomHtml += "<div class='text-body daehwabang' style='cursor:pointer; border-bottom: 1px solid #f0f0f0;''>                                      ";
						chatRoomHtml += "	<div class='d-flex align-items-start mt-1 p-2'>                                              ";
						chatRoomHtml += "	<input type='hidden' class='hiddenChatRoomNoAt' value='"+res[i].chatroomNo+"'>                                              ";
						chatRoomHtml += "		<img src='${pageContext.request.contextPath }"+res[i].otherEmpProfileimg+"' ";
						chatRoomHtml += "			class='me-2 rounded-circle' height='48' alt='no picture' />                       ";
						chatRoomHtml += "		<div class='w-100 overflow-hidden'>                                                      ";
						chatRoomHtml += "			<h5 class='mt-0 mb-0 font-14'>                                                       ";
						chatRoomHtml += "				<span class='float-end text-muted font-12'>"+chatTimeFormat(new Date(res[i].chatDateStr))+"</span> <span class='chatSangDaes'>";
						chatRoomHtml += res[i].otherEmpName;
						chatRoomHtml += " </span>			</h5>                                                                                ";
						chatRoomHtml += "			<p class='mt-1 mb-0 text-muted font-14'>                                             ";
						chatRoomHtml += "				<span class='w-25 float-end text-end'>                                     ";
						chatRoomHtml += "					</span> <span                     ";
						chatRoomHtml += "					class='w-75'>"+res[i].lastChat+"</span>                                       ";
						chatRoomHtml += "			</p>                                                                                 ";
						chatRoomHtml += "		</div>                                                                                   ";
						chatRoomHtml += "	</div>                                                                                       ";
						chatRoomHtml += "</div>                                                                                          ";
					}
					$('#DaeHwaRoomTarget').html(chatRoomHtml);
					
					
					new SimpleBar(document.getElementById('DaeHwaRoomTarget'));
						
				},
				error : function(xhr){
					alert(xhr.status);
				}
			});
			
			
		}else{
			let mdata = {empNo : '${empInfo.empNo}', searchValue : searchValue};
			$.ajax({
				url : '/chatApp/showChatRoomListSearch.do',
				type : 'post',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(mdata),
				beforeSend : function(xhr){
					xhr.setRequestHeader(header,token);
				},
				success : function(res){
					let chatRoomHtml = "";
					for(i=0; i<res.length; i++){
						chatRoomHtml += "<div class='text-body daehwabang' style='cursor:pointer; border-bottom: 1px solid #f0f0f0;''>                                      ";
						chatRoomHtml += "	<div class='d-flex align-items-start mt-1 p-2'>                                              ";
						chatRoomHtml += "	<input type='hidden' class='hiddenChatRoomNoAt' value='"+res[i].chatroomNo+"'>                                              ";
						chatRoomHtml += "		<img src='${pageContext.request.contextPath }"+res[i].otherEmpProfileimg+"' ";
						chatRoomHtml += "			class='me-2 rounded-circle' height='48' alt='no picture' />                       ";
						chatRoomHtml += "		<div class='w-100 overflow-hidden'>                                                      ";
						chatRoomHtml += "			<h5 class='mt-0 mb-0 font-14'>                                                       ";
						chatRoomHtml += "				<span class='float-end text-muted font-12'>"+chatTimeFormat(new Date(res[i].chatDateStr))+"</span> <span class='chatSangDaes'>";
						chatRoomHtml += res[i].otherEmpName;
						chatRoomHtml += " </span>			</h5>                                                                                ";
						chatRoomHtml += "			<p class='mt-1 mb-0 text-muted font-14'>                                             ";
						chatRoomHtml += "				<span class='w-25 float-end text-end'><span                                      ";
						chatRoomHtml += "				 </span> <span                     ";
						chatRoomHtml += "					class='w-75'>"+res[i].lastChat+"</span>                                       ";
						chatRoomHtml += "			</p>                                                                                 ";
						chatRoomHtml += "		</div>                                                                                   ";
						chatRoomHtml += "	</div>                                                                                       ";
						chatRoomHtml += "</div>                                                                                          ";
					}
					$('#DaeHwaRoomTarget').html(chatRoomHtml);
					
					
					new SimpleBar(document.getElementById('DaeHwaRoomTarget'));
						
				},
				error : function(xhr){
					alert(xhr.status);
				}
			});
			
		}
		
		
	});
	
	
	// 메신저 키는 버튼
	$(document).on('click','#messengerEnterIcon',function(){
		
		$.ajax({
			url :'/chatApp/removeRed.do',
			type :'post',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
		    success : function(res){
		    	console.log("채팅 빨간점 없애기 성공!");
		    	$('#chatAlarmIconArea').html('');
		    },
		    error : function(xhr){
		    	console.log("빨간점 없애기 실패 ");
		    }
			
		});
		
		
		$('#searchChatEmpKeyup').hide();
		let mdata = {empNo : '${empInfo.empNo}'};
		
		$.ajax({
			url : '/chatApp/showChatRoomList.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(mdata),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				let chatRoomHtml = "";
				for(i=0; i<res.length; i++){
					chatRoomHtml += "<div class='text-body daehwabang' style='cursor:pointer; border-bottom: 1px solid #f0f0f0;''>                                      ";
					chatRoomHtml += "	<div class='d-flex align-items-start mt-1 p-2'>                                              ";
					chatRoomHtml += "	<input type='hidden' class='hiddenChatRoomNoAt' value='"+res[i].chatroomNo+"'>                                              ";
					chatRoomHtml += "		<img src='${pageContext.request.contextPath }"+res[i].otherEmpProfileimg+"' ";
					chatRoomHtml += "			class='me-2 rounded-circle' height='48' alt='no picture' />                       ";
					chatRoomHtml += "		<div class='w-100 overflow-hidden'>                                                      ";
					chatRoomHtml += "			<h5 class='mt-0 mb-0 font-14'>                                                       ";
					chatRoomHtml += "				<span class='float-end text-muted font-12'>"+chatTimeFormat(new Date(res[i].chatDateStr))+"</span> <span class='chatSangDaes'>";
					chatRoomHtml += res[i].otherEmpName;
					chatRoomHtml += " </span>			</h5>                                                                                ";
					chatRoomHtml += "			<p class='mt-1 mb-0 text-muted font-14'>                                             ";
					chatRoomHtml += "				<span class='w-25 float-end text-end'>                                    ";
					chatRoomHtml += "				 </span> <span                     ";
					chatRoomHtml += "					class='w-75'>"+res[i].lastChat+"</span>                                       ";
					chatRoomHtml += "			</p>                                                                                 ";
					chatRoomHtml += "		</div>                                                                                   ";
					chatRoomHtml += "	</div>                                                                                       ";
					chatRoomHtml += "</div>                                                                                          ";
				}
				$('#DaeHwaRoomTarget').html(chatRoomHtml);
				
				
				
				
				new SimpleBar(document.getElementById('DaeHwaRoomTarget'));
					
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
	});
	
	
	//////////////////////////////////////////!!!!!!!
	// 채팅리스트 (chatroomNo)로 
	$(document).on('click','.daehwabang',function(){
		$('#searchChatEmpKeyup').hide();
		let chatRoomNo = $(this).find('.hiddenChatRoomNoAt').val();
		let chatSangDae = $(this).find('.chatSangDaes').text();
		let chatData = {chatroomNo : chatRoomNo};
		let findData = {chatroomNo : chatRoomNo, empNo : ${empInfo.empNo}};
		$.ajax({
			url : '/chatApp/showChatListByChatroomNo.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(chatData),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				let chatHtml = "";
				chatRoomNo = res.chatroomNo;
				for(i=0; i<res.chatList.length; i++){
					
					if(res.chatList[i].fileDetailVO == null){
						chatHtml += "<li class='clearfix ";
						if(${empInfo.empNo} == res.chatList[i].chatWriter){
							chatHtml += "odd";
						}
						chatHtml += "'>";      
						chatHtml += "	<div class='chat-avatar ";
						chatHtml += " '> ";
						chatHtml += "		<img                                                                                      ";
						chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
						chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
						chatHtml += "	</div>                                                                                        ";
						chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' >";
						chatHtml += "	<div class='conversation-text'>                                                               ";
						chatHtml += "		<div class='ctext-wrap'>                                                                  ";
						chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>                                                                       ";
						chatHtml += "			<p>"+res.chatList[i].chatContent+"</p>                                                                         ";
						chatHtml += "		</div>                                                                                    ";
						chatHtml += "	</div>                                                                                        ";
						chatHtml += "</li>                                                                                            ";
					}else{
						chatHtml += "<li class='clearfix ";
						if(${empInfo.empNo} == res.chatList[i].chatWriter){
							chatHtml += "odd";
						}
						chatHtml += "'>";      
						chatHtml += "	<div class='chat-avatar ";
						chatHtml += " '> ";
						chatHtml += "		<img                                                                                      ";
						chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
						chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
						chatHtml += "	</div>                                                                                        ";
						chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' > &nbsp;";
						chatHtml += "	<div class='conversation-text'>         ";
						chatHtml += "		<div class='ctext-wrap'>  ";
						chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>    ";
						
						if(res.chatList[i].fileDetailVO.fileMime == 'jpg' || res.chatList[i].fileDetailVO.fileMime == 'png'){
							chatHtml += "<div class='row g-0 align-items-center motherItem";
							if(${empInfo.empNo} != res.chatList[i].chatWriter){
								chatHtml += " ms-2";
							}
							chatHtml += "'> ";
	                        chatHtml += "    <div class='col-8'>                                                                                                                                            ";
	                        chatHtml += "        <img src='${pageContext.request.contextPath }"+res.chatList[i].fileDetailVO.imgUrl+"' class='rounded-start thumbnailImg justify-content-center' alt='...'>      ";
	                        chatHtml += " 		 <input type='hidden' class='fileDetailNo' value='"+res.chatList[i].fileDetailVO.imgUrl+"'> ";
							chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName' > ";
	                        chatHtml += "	</div>         ";
							chatHtml += "			<div class='col-4'>                                                                  ";
							chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
							chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
							chatHtml += "				</button>                                                                                ";
							chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName'>  ";
							chatHtml += "			</div>                                                                                  ";
						}else{
							chatHtml += "<div class='row ";
							if(${empInfo.empNo} == res.chatList[i].chatWriter){
								chatHtml += "justify-content-end";
							}
							chatHtml += "'>";
							chatHtml += "		<div class='row align-items-center motherItem";
							if(${empInfo.empNo} != res.chatList[i].chatWriter){
								chatHtml += " ms-2";
							}
							chatHtml += "'>   ";
							chatHtml += "			<div class='col-3 ps-0'>                                                                  ";
							chatHtml += "				<div class='avatar-sm'>                                                             ";
							chatHtml += "					<span class='avatar-title rounded'>."+res.chatList[i].fileDetailVO.fileMime+" </span>";
							chatHtml += "					</div>                                                                          ";
							chatHtml += "			</div>                                                                                  ";
							chatHtml += "			<div class='col-6'>                                                                  ";
							chatHtml += "				<div class='text-muted fw-bold'>"+res.chatList[i].fileDetailVO.fileOriginName+"</div> ";
							chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName'>  ";
							chatHtml += "				<p class='mb-0'>"+res.chatList[i].fileDetailVO.fileFancysize+"</p> ";
							chatHtml += "			</div>                                                                                  ";
							chatHtml += "			<div class='col-2 ps-0'>                                                                  ";
							chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
							chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
							chatHtml += "				</button>                                                                                ";
							chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName' > ";
							chatHtml += "			</div>                                                                                  ";
							chatHtml += "		</div>                                                                                      ";
							chatHtml += "	</div>                                                                                          ";
						}
						chatHtml += "		</div>      ";
						chatHtml += "	</div>              ";
						chatHtml += "</li>";
						
						
					}
				
				}
				$('.chatConversation-list').html(chatHtml);
				
				$('#myChatSangDae').text(chatSangDae);
				
				$('#searchDaehwabangKeyup').val('');
				
				$('.chatBody2').show();
				$('.chatbody2HiddenArea').show();
				setTimeout(function() {
		            var chatListt = $('.chatConversation-list');
		            chatListt.scrollTop(chatListt.prop("scrollHeight"));
		        }, 100); // 100ms 지연 후 스크롤 설정
				
				
			},
			error : function(xhr){
				alert("챗룸no 이용한 오류 : "+xhr.status);
			}
			
		});
	
		
		$.ajax({
			url : '/chatApp/findOtherByChatroomNo.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'text',
			data : JSON.stringify(findData),
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
			success : function(res){
				$('#chatThumbnail').attr('src', '${pageContext.request.contextPath }'+res);
				
			},
			error : function(xhr){
				alert("왜 오류가났나요 ? :"+xhr.status);
			}
			
		});
		
		
	});
	
	
	
	
	
	//////////////////////////////////////////!!!!!!!
	// 대화상대검색으로  (chatroomNo) 채팅목록뽑아오기 
	// 대화 상대 검색하기
	$(document).on('click','.startChatWithOther',function(){
		console.log($(this).children().val()+"다른사람과 채팅하기");
		let chatTargetEmpNo = $(this).children().eq(0).val();
		let chatTargetEmpName = $(this).children().eq(1).val();
		console.log("타겟no"+chatTargetEmpNo);
		
		let chatTargetData = {targetEmpNo : chatTargetEmpNo, myEmpNo : ${empInfo.empNo}};
		
		$('#searchEmpKeyup').val('');
		
		let chatRoomNo;
		
		
		
		$.ajax({
			url : '/chatApp/showChatList.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(chatTargetData),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				console.log(res)
				chatRoomNo = res.chatroomNo;
				console.log("나오나?"+res.chatroomNo)
				let chatHtml = "";
				if(res.chatList==null || res.chatList.length ==0){
					
					chatHtml += "<li class='clearfix'>                                                                            ";
					chatHtml += "	<div class='conversation-text'>                                                               ";
					chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' >";
					chatHtml += "<p>대화 내용이 없습니다.</p>"
					chatHtml += "	</div>                                                                                        ";
					chatHtml += "</li>                                                                                            ";
				}else{
					for(i=0; i<res.chatList.length; i++){
						
						if(res.chatList[i].fileDetailVO == null){
							chatHtml += "<li class='clearfix ";
							if(${empInfo.empNo} == res.chatList[i].chatWriter){
								chatHtml += "odd";
							}
							chatHtml += "'>";      
							chatHtml += "	<div class='chat-avatar ";
							chatHtml += " '> ";
							chatHtml += "		<img                                                                                      ";
							chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
							chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
							chatHtml += "	</div>                                                                                        ";
							chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' >";
							chatHtml += "	<div class='conversation-text'>                                                               ";
							chatHtml += "		<div class='ctext-wrap'>                                                                  ";
							chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>                                                                       ";
							chatHtml += "			<p>"+res.chatList[i].chatContent+"</p>                                                                         ";
							chatHtml += "		</div>                                                                                    ";
							chatHtml += "	</div>                                                                                        ";
							chatHtml += "</li>                                                                                            ";
						}else{
							chatHtml += "<li class='clearfix ";
							if(${empInfo.empNo} == res.chatList[i].chatWriter){
								chatHtml += "odd";
							}
							chatHtml += "'>";      
							chatHtml += "	<div class='chat-avatar ";
							chatHtml += " '> ";
							chatHtml += "		<img                                                                                      ";
							chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
							chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
							chatHtml += "	</div>                                                                                        ";
							chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' > &nbsp;";
							chatHtml += "	<div class='conversation-text'>         ";
							chatHtml += "		<div class='ctext-wrap'>  ";
							chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>    ";
							
							
							if(res.chatList[i].fileDetailVO.fileMime == 'jpg' || res.chatList[i].fileDetailVO.fileMime == 'png'){
								chatHtml += "<div class='row g-0 align-items-center motherItem";
								if(${empInfo.empNo} != res.chatList[i].chatWriter){
									chatHtml += " ms-2";
								}
								chatHtml += "'> ";
		                        chatHtml += "    <div class='col-8'>                                                                                                                                            ";
		                        chatHtml += "        <img src='${pageContext.request.contextPath }"+res.chatList[i].fileDetailVO.imgUrl+"' class='rounded-start thumbnailImg justify-content-center' alt='...'>      ";
		                        chatHtml += " 		 <input type='hidden' class='fileDetailNo' value='"+res.chatList[i].fileDetailVO.imgUrl+"'> ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName' > ";
		                        chatHtml += "	</div>         ";
								chatHtml += "			<div class='col-4'>                                                                  ";
								chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
								chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
								chatHtml += "				</button>                                                                                ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName' > ";
								chatHtml += "			</div>                                                                                  ";
								                                                                                                                                                                                   
							}else{
								chatHtml += "<div class='row ";
								if(${empInfo.empNo} == res.chatList[i].chatWriter){
									chatHtml += "justify-content-end";
								}
								chatHtml += "'>";
								chatHtml += "		<div class='row align-items-center motherItem";
								if(${empInfo.empNo} != res.chatList[i].chatWriter){
									chatHtml += " ms-2";
								}
								chatHtml += "'>  ";
								chatHtml += "			<div class='col-3 ps-0'>                                                                  ";
								chatHtml += "				<div class='avatar-sm'>                                                             ";
								chatHtml += "					<span class='avatar-title rounded'>."+res.chatList[i].fileDetailVO.fileMime+" </span>";
								chatHtml += "					</div>                                                                          ";
								chatHtml += "			</div>                                                                                  ";
								chatHtml += "			<div class='col-6'>                                                                  ";
								chatHtml += "				<div class='text-muted fw-bold'>"+res.chatList[i].fileDetailVO.fileOriginName+"</div> ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName' > ";
								chatHtml += "				<p class='mb-0'>"+res.chatList[i].fileDetailVO.fileFancysize+"</p> ";
								chatHtml += "			</div>                                                                                  ";
								chatHtml += "			<div class='col-2 ps-0'>                                                                  ";
								chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
								chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
								chatHtml += "				</button>                                                                                ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName' > ";
								chatHtml += "			</div>                                                                                  ";
								chatHtml += "		</div>                                                                                      ";
								chatHtml += "	</div>                                                                                          ";
							}
							chatHtml += "		</div>      ";
							chatHtml += "	</div>              ";
							chatHtml += "</li>";
							
							
						}
					
					}
					
				}
				$('.chatBody2').show();
				$('.chatbody2HiddenArea').show();
				$('.chatConversation-list').html(chatHtml);
				$('#myChatSangDae').text(chatTargetEmpName);
				$('#searchChatEmpKeyup').hide();
				
				setTimeout(function() {
		            var chatListt = $('.chatConversation-list');
		            chatListt.scrollTop(chatListt.prop("scrollHeight"));
		        }, 100); // 100ms 지연 후 스크롤 설정
				
				
				
			},
			error : function(xhr){
				alert(xhr.status);
			}
		
		
		});
		
		let mdata = {empNo : '${empInfo.empNo}'};
		
		$.ajax({
			url : '/chatApp/showChatRoomList.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(mdata),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				let chatRoomHtml = "";
				for(i=0; i<res.length; i++){
					chatRoomHtml += "<div class='text-body daehwabang' style='cursor:pointer; border-bottom: 1px solid #f0f0f0;''>                                      ";
					chatRoomHtml += "	<div class='d-flex align-items-start mt-1 p-2'>                                              ";
					chatRoomHtml += "	<input type='hidden' class='hiddenChatRoomNoAt' value='"+res[i].chatroomNo+"'>                                              ";
					chatRoomHtml += "		<img src='${pageContext.request.contextPath }"+res[i].otherEmpProfileimg+"' ";
					chatRoomHtml += "			class='me-2 rounded-circle' height='48' alt='no picture' />                       ";
					chatRoomHtml += "		<div class='w-100 overflow-hidden'>                                                      ";
					chatRoomHtml += "			<h5 class='mt-0 mb-0 font-14'>                                                       ";
					chatRoomHtml += "				<span class='float-end text-muted font-12'>"+chatTimeFormat(new Date(res[i].chatDateStr))+"</span> <span class='chatSangDaes'>";
					chatRoomHtml += res[i].otherEmpName;
					chatRoomHtml += " </span>			</h5>                                                                                ";
					chatRoomHtml += "			<p class='mt-1 mb-0 text-muted font-14'>                                             ";
					chatRoomHtml += "				<span class='w-25 float-end text-end'>                                    ";
					chatRoomHtml += "				 </span> <span                     ";
					chatRoomHtml += "					class='w-75'>"+res[i].lastChat+"</span>                                       ";
					chatRoomHtml += "			</p>                                                                                 ";
					chatRoomHtml += "		</div>                                                                                   ";
					chatRoomHtml += "	</div>                                                                                       ";
					chatRoomHtml += "</div>                                                                                          ";
				}
				$('#DaeHwaRoomTarget').html(chatRoomHtml);
				
				
				
				
				new SimpleBar(document.getElementById('DaeHwaRoomTarget'));
					
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
		
		setTimeout(() => {
			let findData = {chatroomNo : chatRoomNo, empNo : ${empInfo.empNo}};
			console.log("여기서 쓰이는 챗룸넘버 : "+chatRoomNo);
			
			$.ajax({
				url : '/chatApp/findOtherByChatroomNo.do',
				type : 'post',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(findData),
				beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
			         xhr.setRequestHeader(header, token);
			      },
				success : function(res){
					console.log(res);
					$('#chatThumbnail').attr('src','${pageContext.request.contextPath }'+res);
					
				},
				error : function(xhr){
					alert("왜 오류가났나요 ? :"+xhr.status);
				}
				
			});
			
		}, 200);
		
	});
	
	//채팅방 나가기
	$(document).on('click','#chatNagagiBtn',function(){
// 		console.log("채팅방 나가기s~");
		let chatroomNo = console.log($(this).parents('.card').find('.myChatroomNo').val());
		let empNo = ${empInfo.empNo};
		
		let nData = {chatroomNo : chatroomNo , empNo : empNo};
		
	});
	
	
	// 파일 업로드
	$(document).on('change','#chatFileUpload',function(event){
		
		chatFiles = event.target.files;
		console.log("files = "+chatFiles);
		chatFile = chatFiles[0];
		console.log("file = "+chatFile);
		
		$('#chatFileUploadIcon').html("<i class='uil uil-check'>");
		$('#chatTextUpload').val("FileName : "+chatFile.name);
		$('#chatTextUpload').attr('readonly', true);
		
	});
	
	
	//////////////////////////////////////////!!!!!!!
	// 채팅에 입력하면
	$(document).on('submit','#chat-form',function(){
		event.preventDefault();
		$('#searchChatEmpKeyup').hide();
		$('#chatFileUploadIcon').html("<i class='uil uil-paperclip'>");
		
		console.log($('#chatTextUpload').val());
		console.log($('.myChatroomNo').val());
		
		textInput =$('#chatTextUpload').val();
		chatroomNo = $('.myChatroomNo').val();
		$('#chatTextUpload').attr('readonly', false);
		$('#chatTextUpload').val('');
		let chatNo = "";
		
		
		
		
		let chatData = {chatroomNo : chatroomNo};
		let chatInsertData = {chatroomNo : chatroomNo , empNo : '${empInfo.empNo}', textInput : textInput}
		
		$.ajax({
			url : '/chatApp/insertChat.do',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(chatInsertData),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				chatNo = res;
				console.log("챗 넘버 : 가장중요 : "+chatNo);
				console.log("insertChat : "+res);
				
				
				
				if(chatFiles != null){
					console.log("수신시에도 파일 files = "+chatFiles);
					console.log("수신시에도 파일 file = "+chatFile);
					var formData = new FormData();
					formData.append("file",chatFile);
					console.log("챗 넘버 : 가장중요 2 : "+chatNo);
					$.ajax({
						url : '/chatApp/uploadChatFile.do/'+chatNo,
						type : 'post',
						contentType : false,
						data : formData,
						dataType : 'text',
						processData : false,
						beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
					         xhr.setRequestHeader(header, token);
					      },
						success : function(res){
							$('#chatFileUpload').val('');
							$('#chatFileUploadIcon').val('')
							chatFiles = null;
							chatFile = null;
						},
						error : function(xhr){
							alert("파일 업로드 오류 : "+xhr.status);
						}
						
					})
				}
				
			},
			error : function(xhr){
				alert("입력오류 "+xhr.status)
			}
			
			
		});
		
		//파일영역
		
		
		
		
		
		sendTextChat(chatroomNo, '${empInfo.empNo}' ,textInput);
		
		setTimeout(() => {
			$.ajax({
				url : '/chatApp/showChatListByChatroomNo.do',
				type : 'post',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(chatData),
				beforeSend : function(xhr){
					xhr.setRequestHeader(header,token);
				},
				success : function(res){
					let chatHtml = "";
					chatRoomNo = res.chatroomNo;
					for(i=0; i<res.chatList.length; i++){
						
						if(res.chatList[i].fileDetailVO == null){
							chatHtml += "<li class='clearfix ";
							if(${empInfo.empNo} == res.chatList[i].chatWriter){
								chatHtml += "odd";
							}
							chatHtml += "'>";      
							chatHtml += "	<div class='chat-avatar ";
							chatHtml += " '> ";
							chatHtml += "		<img                                                                                      ";
							chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
							chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
							chatHtml += "	</div>                                                                                        ";
							chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' >";
							chatHtml += "	<div class='conversation-text'>                                                               ";
							chatHtml += "		<div class='ctext-wrap'>                                                                  ";
							chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>                                                                       ";
							chatHtml += "			<p>"+res.chatList[i].chatContent+"</p>                                                                         ";
							chatHtml += "		</div>                                                                                    ";
							chatHtml += "	</div>                                                                                        ";
							chatHtml += "</li>                                                                                            ";
						}else{
							chatHtml += "<li class='clearfix ";
							if(${empInfo.empNo} == res.chatList[i].chatWriter){
								chatHtml += "odd";
							}
							chatHtml += "'>";      
							chatHtml += "	<div class='chat-avatar ";
							chatHtml += " '> ";
							chatHtml += "		<img                                                                                      ";
							chatHtml += "			src='${pageContext.request.contextPath }"+res.chatList[i].chatEmpProfileImg+"'  ";
							chatHtml += "			class='rounded' alt='no img' /> <i>"+chatTimeFormat(new Date(res.chatList[i].chatDateStr))+"</i>                                        ";
							chatHtml += "	</div>                                                                                        ";
							chatHtml += "<input type='hidden' value='"+res.chatroomNo+"' class='myChatroomNo' > &nbsp;";
							chatHtml += "	<div class='conversation-text'>         ";
							chatHtml += "		<div class='ctext-wrap'>  ";
							chatHtml += "			<i>"+res.chatList[i].chatWriterName+"</i>    ";
							
							
							if(res.chatList[i].fileDetailVO.fileMime == 'jpg' || res.chatList[i].fileDetailVO.fileMime == 'png'){
								chatHtml += "<div class='row g-0 align-items-center motherItem";
								if(${empInfo.empNo} != res.chatList[i].chatWriter){
									chatHtml += " ms-2";
								}
								chatHtml += "'> ";
		                        chatHtml += "    <div class='col-8'>                                                                                                                                            ";
		                        chatHtml += "        <img src='${pageContext.request.contextPath }"+res.chatList[i].fileDetailVO.imgUrl+"' class='rounded-start thumbnailImg justify-content-center' alt='...'>      ";
		                        chatHtml += " 		 <input type='hidden' class='fileDetailNo' value='"+res.chatList[i].fileDetailVO.imgUrl+"'> ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName' > ";
		                        chatHtml += "	</div>         ";
								chatHtml += "			<div class='col-4'>                                                                  ";
								chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
								chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
								chatHtml += "				</button>                                                                                ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName' > ";
								chatHtml += "			</div>                                                                                  ";
								                                                                                                                                                                                   
							}else{
								chatHtml += "<div class='row ";
								if(${empInfo.empNo} == res.chatList[i].chatWriter){
									chatHtml += "justify-content-end";
								}
								chatHtml += "'>";
								chatHtml += "		<div class='row align-items-center motherItem";
								if(${empInfo.empNo} != res.chatList[i].chatWriter){
									chatHtml += " ms-2";
								}
								chatHtml += "'>   ";
								chatHtml += "			<div class='col-3 ps-0'>                                                                  ";
								chatHtml += "				<div class='avatar-sm'>                                                             ";
								chatHtml += "					<span class='avatar-title rounded'>."+res.chatList[i].fileDetailVO.fileMime+" </span>";
								chatHtml += "					</div>                                                                          ";
								chatHtml += "			</div>                                                                                  ";
								chatHtml += "			<div class='col-6'>                                                                  ";
								chatHtml += "				<div class='text-muted fw-bold'>"+res.chatList[i].fileDetailVO.fileOriginName+"</div> ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileOriginName+"' class='chatFileName' > ";
								chatHtml += "				<p class='mb-0'>"+res.chatList[i].fileDetailVO.fileFancysize+"</p> ";
								chatHtml += "			</div>                                                                                  ";
								chatHtml += "			<div class='col-2 ps-0'>                                                                  ";
								chatHtml += "				<button type='button' class='btn btn-link btn-lg text-muted''> <i      ";
								chatHtml += "				class='ri-download-2-line downloadChatFileLink'></i>                                                     ";
								chatHtml += "				</button>                                                                                ";
								chatHtml += "				<input type='hidden' value='"+res.chatList[i].fileDetailVO.fileSaveName+"' class='chatSaveFileName' > ";
								chatHtml += "			</div>                                                                                  ";
								chatHtml += "		</div>                                                                                      ";
								chatHtml += "	</div>                                                                                          ";
							}
							chatHtml += "		</div>      ";
							chatHtml += "	</div>              ";
							chatHtml += "</li>";
							
							
							
						}
					
					}
					$('.chatConversation-list').html(chatHtml);
					
					
					setTimeout(function() {
			            var chatListt = $('.chatConversation-list');
			            chatListt.scrollTop(chatListt.prop("scrollHeight"));
			        }, 100); // 100ms 지연 후 스크롤 설정
					
					
				},
				error : function(xhr){
					alert("챗룸no 이용한 오류 : "+xhr.status);
				}
				
			});
			
			let mdata = {empNo : '${empInfo.empNo}'};
			
			$.ajax({
				url : '/chatApp/showChatRoomList.do',
				type : 'post',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(mdata),
				beforeSend : function(xhr){
					xhr.setRequestHeader(header,token);
				},
				success : function(res){
					let chatRoomHtml = "";
					for(i=0; i<res.length; i++){
						chatRoomHtml += "<div class='text-body daehwabang' style='cursor:pointer; border-bottom: 1px solid #f0f0f0;''>                                      ";
						chatRoomHtml += "	<div class='d-flex align-items-start mt-1 p-2'>                                              ";
						chatRoomHtml += "	<input type='hidden' class='hiddenChatRoomNoAt' value='"+res[i].chatroomNo+"'>                                              ";
						chatRoomHtml += "		<img src='${pageContext.request.contextPath }"+res[i].otherEmpProfileimg+"' ";
						chatRoomHtml += "			class='me-2 rounded-circle' height='48' alt='no picture' />                       ";
						chatRoomHtml += "		<div class='w-100 overflow-hidden'>                                                      ";
						chatRoomHtml += "			<h5 class='mt-0 mb-0 font-14'>                                                       ";
						chatRoomHtml += "				<span class='float-end text-muted font-12'>"+chatTimeFormat(new Date(res[i].chatDateStr))+"</span> <span class='chatSangDaes'>";
						chatRoomHtml += res[i].otherEmpName;
						chatRoomHtml += " </span>			</h5>                                                                                ";
						chatRoomHtml += "			<p class='mt-1 mb-0 text-muted font-14'>                                             ";
						chatRoomHtml += "				<span class='w-25 float-end text-end'>                                    ";
						chatRoomHtml += "				 </span> <span                     ";
						chatRoomHtml += "					class='w-75'>"+res[i].lastChat+"</span>                                       ";
						chatRoomHtml += "			</p>                                                                                 ";
						chatRoomHtml += "		</div>                                                                                   ";
						chatRoomHtml += "	</div>                                                                                       ";
						chatRoomHtml += "</div>                                                                                          ";
					}
					$('#DaeHwaRoomTarget').html(chatRoomHtml);
					
					
					
					
					new SimpleBar(document.getElementById('DaeHwaRoomTarget'));
						
				},
				error : function(xhr){
					alert("200?"+xhr.status);
				}
			});
		}, 200);
		
		
		
		
		
		
		
	});
	
	// 닫기용 x버튼 
	$(document).on('click','#closeOffcanvasBtn',function(){
		var offcanvasElement = document.getElementById("offcanvasBottomRight");
        var offcanvasInstance = bootstrap.Offcanvas.getInstance(offcanvasElement);
        if (!offcanvasInstance) {
            offcanvasInstance = new bootstrap.Offcanvas(offcanvasElement);
        }
        offcanvasInstance.hide();
        
        $.ajax({
			url :'/chatApp/removeRed.do',
			type :'post',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
		    success : function(res){
		    	console.log("채팅 빨간점 없애기 성공!");
		    	$('#chatAlarmIconArea').html('');
		    },
		    error : function(xhr){
		    	console.log("빨간점 없애기 실패 ");
		    }
			
		});
	});


	$(document).on('click','.downloadChatFileLink',function(){
		
		console.log($(this));
		let originalFileName =  $(this).parents('.motherItem').find('.chatFileName').val();
		let fileName = $(this).parents('.motherItem').find('.chatSaveFileName').val();
		console.log("파일다운로드1 : "+originalFileName);
		console.log("파일다운로드1 : "+fileName);
		
		$.ajax({
	        url: "/chatApp/downloadFile.do",	// 요청 URI는 변경
	        type: "POST",
	        data: {
	            fileName: fileName,
	            originalFileName: originalFileName
	        },
	        beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	         xhr.setRequestHeader(header, token);
	       },
	        xhrFields: {
	            responseType: 'blob'
	        },
	        success: function(blob, status, xhr) {
	            var link = document.createElement('a');
	            var url = window.URL.createObjectURL(blob);
	            link.href = url;
	            link.download = originalFileName;
	            document.body.append(link);
	            link.click();
	            link.remove();
	            window.URL.revokeObjectURL(url);
	        },
	        error: function(error) {
	            alert("파일 다운로드 중 오류가 발생했습니다.");
	        }
	    });
	});
	
	
	
	// 썸네일
	$(document).on('click','.thumbnailImg',function(){
		let fileUrl = $(this).next().val();
	    console.log(fileUrl);

	    let cutting = "\\resources\\upload";
	    let cutting2 = "/s_";
	    let fileUrl2 = fileUrl.replace(cutting, '');
	    let fileName = fileUrl2.replace(cutting2, '/');
	    let url = "/chatApp/view.do?fileName=" + encodeURIComponent(fileName);

	    // 새로운 작은 창을 엽니다.
// 	    window.open(url, 'newWindow', 'width=600,height=400');
	    
	    $.ajax({
	        type: 'POST',
	        url: '/chatApp/view.do',
	        data: {
	            fileName: fileName,
	        },
	        beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
	        xhrFields: {
	            responseType: 'blob' // 응답을 Blob으로 처리
	        },

	        success: function(response) {
	        	let newWindow = window.open('', 'newWindow', 'width=700,height=700');
	            let url = URL.createObjectURL(response);

	            // 이미지 태그를 동적으로 생성하여 새로운 창에 추가합니다.
	            newWindow.document.write('<html><head><title>상세보기</title></head><body>');
	            newWindow.document.write('<style>body { display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; } img { max-width: 100%; max-height: 100%; }</style>');
	            newWindow.document.write('<img src="' + url + '" alt="Image">');
	            newWindow.document.write('</body></html>');

	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	        }
	    });
	});
		
	
	
	
	
	
});



function sendAlarm(type,value,name,workNo,proNo){
	
	alarmSocket.send(changeAlarmType(type,value,name,workNo,proNo));
};

function sendTextChat(chatroomNo, empNo, chatContent){
	chatSocket.send(changeTextChatType(chatroomNo, empNo, chatContent));
};


function changeAlarmType(type,value,name,workNo,proNo){
	return '{\"type\":\"'+type+'\", \"value\":\"'+value+'\", \"name\":\"'+name+'\", \"workNo\":\"'+workNo+'\",  \"proNo\":\"'+proNo+'\"}';
};

function changeTextChatType(chatroomNo, empNo, chatContent){
	return '{\"chatroomNo\":\"'+chatroomNo+'\", \"empNo\":\"'+empNo+'\", \"chatContent\":\"'+chatContent+'\"}';
	
};

function chatTimeFormat(chatDate){
	 return chatDate.toLocaleTimeString('ko-KR', {
	        hour: '2-digit',
	        minute: '2-digit',
	        hour12: false
	 });
}










</script>

<!-- layout wrapper -->
<body>
	<div id="alertContainer" class="position-fixed top-0 start-50 translate-middle-x p-3 text-center" style="z-index: 1050;"></div>

	<div class="wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="sidebar" />

		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">
<%-- 					<tiles:insertAttribute name="gnb"/> --%>
					<tiles:insertAttribute name="body" />
					<tiles:insertAttribute name="chat"/>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 채팅창 js파일 -->
	<script src="${pageContext.request.contextPath }/resources/privateCSS/PJH/chatLayoutJS.js">
	</script>
	
	
	<!-- Daterangepicker js -->
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/daterangepicker/daterangepicker.js"></script>

	<!-- Apex Charts js -->
<%-- 	<script src="${pageContext.request.contextPath }/resources/assets/vendor/apexcharts/apexcharts.min.js"></script> --%>

	<!-- Vector Map Js -->
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/jsvectormap/js/jsvectormap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/jsvectormap/maps/world-merc.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/jsvectormap/maps/world.js"></script>

	<!-- Dashboard App js -->
<!-- 	<script -->
<%-- 		src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.dashboard.js"></script> --%>

	<!-- App js -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>
	
	<!-- Datatable js -->
<%-- 	<script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script> --%>
    <!-- DataTables Buttons JS -->
<!--     <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script> -->
	<!-- JSZip (필요한 경우) -->
    <!-- JSZip (필요한 경우) -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> -->
    <!-- pdfmake (필요한 경우) -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script> -->
	<!-- Buttons HTML5 export JS -->
<!--     <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script> -->
    <!-- Buttons Print JS -->
<!--     <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script> -->
    <!-- Buttons ColVis JS -->
<!--     <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.colVis.min.js"></script> -->
    <!-- Buttons Bootstrap5 JS (선택 사항) -->
<!--     <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.bootstrap5.min.js"></script> -->
    
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/privateCSS/LDY/empList/jszip/jszip.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/privateCSS/LDY/empList/pdfmake/pdfmake.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/privateCSS/LDY/empList/pdfmake/vfs_fonts.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-buttons/js/buttons.colVis.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-datatables-checkboxes/js/dataTables.checkboxes.min.js"></script> --%>

<!-- Customers Demo App js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.customers.js"></script> --%>
	

</body>



</html>