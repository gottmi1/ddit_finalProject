<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
	<link href="${pageContext.request.contextPath }/resources/assets/vendor/jstree/themes/default/style.min.css"
	rel="stylesheet" type="text/css">
	
	
	<c:if test="${not empty message }">
		<div>${message }</div>
	</c:if>
	<!-- ============================================================== -->
	<!-- Start Page Content here -->
	<!-- ============================================================== -->
	<!-- start page title -->
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">File Manager</h4>
			</div>
		</div>
	</div>
	<!-- end page title -->

	<div class="row">

		<!-- Right Sidebar -->
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<!-- Left sidebar -->
					<div class="page-aside-left">
	
						<h4 class="header-title">폴더 목록</h4>
                        <ul class="nav nav-tabs nav-bordered mb-3"></ul>
                        
						<div class="tab-content">
							<div class="tab-pane show active" id="jstree-1-preview">
								<div id="jstree-2">
									<ul>

										<c:forEach items="${folderList }" var="folder">
											<c:if test="${ folder.parentFolderNo == 0 }">
												<li data-jstree='{ "opened" : true }' class="parentFolder Root" data-folder="${folder.folderNo }">${folder.folderName }
													<ul>
													<!-- 루트-하위 폴더 생성 --> 
													<c:forEach items="${folderList }" var="childFolder">
														<c:if
															test="${ folder.folderNo eq childFolder.parentFolderNo }">
																<li data-jstree='{ "opened" : true }' class="parentFolder"
																	data-folder="${childFolder.folderNo }">${childFolder.folderName }
																	<!-- 하위-하위 폴더 생성 --> 
																	<c:forEach items="${folderList }"
																		var="childChildFolder">
																		<c:if
																			test="${ childFolder.folderNo eq childChildFolder.parentFolderNo }">
																			<ul>
																				<li data-jstree='{ "opened" : true }' class="lastFolder" data-bs-toggle="dropdown" aria-expanded="false"
																					data-folder="${childChildFolder.folderNo }">${childChildFolder.folderName }</li>
																			</ul>
																		</c:if>
																	</c:forEach> 
																	<!-- 하위-하위 폴더 생성 -->
																</li>
														</c:if>
													</c:forEach> 
													<!-- 루트-하위 폴더 생성 -->
													</ul>
												</li>
											</c:if>	
										</c:forEach>
										<!-- 루트 폴더 생성 -->

									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- End Left sidebar -->

					<div class="page-aside-right">

						<div class="d-lg-flex justify-content-between align-items-center">
							<div class="app-search">
								<form id="fileSearchForm">
									<div class="mb-2 position-relative">
										<input type="text" id="fileSearch" class="form-control"
											placeholder="파일 검색"> <span
											class="mdi mdi-magnify search-icon"></span>
									</div>
								</form>
							</div>
							<div>
								<button id="btn-newFolder" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#newFolderModal" disabled>
									폴더 생성
								</button>
								<button type="button" id="btn_fileUpload" class="btn btn-primary btn-sm" disabled>
									파일 업로드
								</button>
								<form id="fileForm" action="/cloud/upload" method="post"
									enctype="multipart/form-data" hidden>
									<input id="input_fileUpload" name="file" type="file" />
									<input id="input_folderNo" name="folderNo" type="text" />
									<!-- 시큐리티 적용 한 상태에서 데이터 보낼 땐 꼭 이게 필요함. -->
									<sec:csrfInput/>
								</form>
								
							</div>
						</div>

							<div class="mt-3">
								
								<c:forEach items="${folderList }" var="initFolder">
									<c:if test="${initFolder.parentFolderNo == 0 }">
										
												<div id="home-menu" class="row mx-n1 g-0">
												<h5 class="mb-2">하위 폴더</h5>
												<c:forEach items="${folderList }" var="folder">
													<c:if test="${folder.parentFolderNo eq initFolder.folderNo }">
												<div class="col-xxl-3 col-lg-6 folderParent">
													<div class="card m-1 shadow-none border">
														<div class="p-2">
															<div class="row align-items-center">
																<div class="col-auto" >
																	<div class="avatar-sm">
																		<span class="avatar-title bg-light text-reset rounded">
																			<i class="mdi mdi-folder" style="font-size: 32px;"></i>
																		</span>
																	</div>
																</div>
																<div class="col ps-0 align-content-center">
																	<a class="text-muted fw-bold folder-title">${folder.folderName}</a>
																	<input type="text" class="folderNo" hidden value="${folder.folderNo}"/>
																	<div class="dropdown float-end">
																		<a href="#" class="dropdown-toggle arrow-none card-drop"
																			data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-vertical folder-more"></i>
																		</a>
																	<div class="dropdown-menu dropdown-menu-end" style="">
																		<a href="javascript:void(0);" class="dropdown-item modifyEle" data-bs-toggle="modal" data-bs-target="#modifyFolderModal">
																		<i class="mdi mdi-clipboard-edit me-1"></i> Edit</a>
																		<!-- item-->
																		<!-- 수정/삭제 세션아이디나 권한에 따라서만 보이게 해줘야 함 -->
																		<hr class="dropdown-divider">
																		<a href="javascript:void(0);" class="dropdown-item text-danger deleteEle" data-bs-toggle="modal" data-bs-target="#deleteFolderModal">
																			<i class="mdi mdi-trash-can-outline me-1"></i> Delete
																		</a>
																	</div>
																	
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
										</div>
										<!-- 하위 폴더들이 출력 될 메뉴 -->
										
										<!-- 폴더에 있는 파일들이 출력될 메뉴 -->
										<div id="main-menu" class="row mx-n1 g-0">
											<h5 class="mb-2">파일 목록</h5>
											<c:if test="${not empty fileList }">
												<c:forEach items="${fileList }" var="file">
												
													<c:if test="${file.folderNo eq initFolder.folderNo }">
													
														<c:set var="mimeType" value="${fn:toLowerCase(file.cloudMime) }" />
														
															<c:choose>
																<c:when test="${mimeType eq 'jpg'}">
																	<c:set var="mimeTypeClass" value="mdi-file-jpg-box" />
																</c:when>
																<c:when test="${mimeType eq 'png'}">
																	<c:set var="mimeTypeClass" value="mdi-file-png-box" />
																</c:when>
																<c:when test="${mimeType eq 'pdf'}">
																	<c:set var="mimeTypeClass" value="mdi-file-pdf-box" />
																</c:when>
																<c:when test="${mimeType eq 'jar'}">
																	<c:set var="mimeTypeClass" value="mdi-zip-box" />
																</c:when>
																<c:when test="${mimeType eq 'zip'}">
																	<c:set var="mimeTypeClass" value="mdi-zip-box" />
																</c:when>
																<c:when test="${mimeType eq 'rar'}">
																	<c:set var="mimeTypeClass" value="mdi-zip-box" />
																</c:when>
																<c:when test="${mimeType eq 'txt'}">
																	<c:set var="mimeTypeClass" value="mdi-note-text" />
																</c:when>
																<c:otherwise>
																	<c:set var="mimeTypeClass" value="mdi-file" />
																</c:otherwise>
															</c:choose>
												
														<div class="col-xxl-3 col-lg-6 fileParent">
															<input name="cloudNo" class="cloudNo" type="hidden" value="${file.cloudNo }"/>
															<div class="card m-1 shadow-none border">
																<div class="p-2">
																	<div class="row align-items-center"
																		style="flex-direction: column;">
																		<div class="col-auto" style="width: 100%; height: 200px;">
																			<div class="avatar-sm" style="width: 100%; height: 100%;">
																				<span class="avatar-title bg-light text-reset rounded">
																					<c:choose>
																						<c:when test="${mimeType eq 'png' or mimeType eq 'jpg'}">
																							<img src="${file.cloudImgpath}">
																						</c:when>
																						<c:otherwise>
																							<i class="mdi ${mimeTypeClass }" style="font-size: 180px;"></i>
																						</c:otherwise>
																					</c:choose>
																				</span>
																			</div>
																		</div>
																		<div class="col"
																			style="padding-left: 20px; padding-top: 10px;">
																			<div class="d-flex justify-content-between align-items-center">
																				<a href="javascript:void(0);" class="text-muted fw-bold" style="max-width : 90%; white-space: nowrap; overflow: hidden;">${file.cloudOriginName }</a>
																				<div class="dropdown float-end">
																				<a href="#" class="dropdown-toggle arrow-none card-drop"
																					data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-vertical"></i>
																				</a>
																				<div class="dropdown-menu dropdown-menu-end" style="">
																					<a href="${file.cloudDownloadpath}" download="${file.cloudOriginName }"
																					 class="dropdown-item">
																					 <i class="mdi mdi-file-download me-1"></i> Download</a>
																					<a href="javascript:void(0);" class="dropdown-item modifyEle" data-bs-toggle="modal" data-bs-target="#exampleModal">
																					<i class="mdi mdi-clipboard-edit me-1"></i> Edit</a>
																					<!-- item-->
																					<!-- 수정/삭제 세션아이디나 권한에 따라서만 보이게 해줘야 함 -->
																					<hr class="dropdown-divider">
																					<a href="javascript:void(0);" class="dropdown-item text-danger deleteEle" data-bs-toggle="modal" data-bs-target="#danger-header-modal">
																						<i class="mdi mdi-trash-can-outline me-1"></i> Delete
																					</a>
																				</div>
																				
																			</div>
																			</div>
																			<p class="mb-0 font-13">용량 : ${file.cloudFancysize }
																				/ 확장자 : <span class="mimeType">${file.cloudMime }</span></p>
																			<p class="mb-0 font-13 text-secondary">등록일시 :
																				${file.cloudDate }</p>
																			
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
												</c:forEach>
											</c:if>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<!-- end row-->
						</div>
						<!-- end .mt-3-->
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
	
	<!-- 파일 수정/삭제용 폼 -->
	<form action="/cloud/fileDelete" id="deleteForm" method="post" hidden>
		<input type="text" id="cloudNoInput" name="cloudNo" value=""/>
		<input type="text" id="cloudNameInput" name="cloudOriginName" value=""/>
		<sec:csrfInput/>
	</form>
	<!-- 파일 수정/삭제용 폼 끝 -->
	
	<!-- 폴더 수정/삭제용 폼 -->
	<form action="/cloud/folderDelete" id="folderDeleteForm" method="post" hidden>
		<input type="text" id="folderNoInput" name="folderNo" value=""/>
		<input type="text" id="folderNameInput" name="folderName" value=""/>
		<sec:csrfInput/>
	</form>
	<!-- 파일 수정/삭제용 폼 끝 -->
	
	<!-- 폴더 생성용 폼 -->
	<form action="/cloud/newFolder" id="newFolderForm" method="post" hidden>
		<input type="text" id="createFolderNameInput" name="folderName" value=""/>
		<input type="text" id="parentFolderNoInput" name="parentFolderNo" value=""/>
		<sec:csrfInput/>
	</form>
	<!-- 폴더 생성용 폼 끝 -->
	
	<!-- 파일 수정용 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">파일명 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<input type="text" placeholder="수정할 파일 이름을 입력해주세요."
								class="form-control" id="input-modifyFileName">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btn-modifyFileName">수정</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 파일 수정용 모달 끝 -->
	
	<!-- 폴더 수정용 모달 -->
	<div class="modal fade" id="modifyFolderModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">폴더명 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<input type="text" placeholder="수정할 폴더이름을 입력해주세요."
								class="form-control" id="input-modifyFolderName">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btn-modifyFolder">수정</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 폴더 수정용 모달 끝 -->
	
	<!-- 새 폴더 모달 -->
	<div class="modal fade" id="newFolderModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새 폴더 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<input type="text" placeholder="생성할 폴더 이름을 입력해주세요."
								class="form-control" id="input-createFolder">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btn-createFolder">생성</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 새 폴더 모달 끝 -->

	<!-- 삭제용 모달 -->
	<div id="danger-header-modal" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="danger-header-modalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger">
					<h4 class="modal-title" id="danger-header-modalLabel">삭제</h4>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-hidden="true"></button>
				</div>
				<div class="modal-body">파일을 정말 삭제할까요?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제용 모달 끝 -->
	
	<!-- 폴더 삭제용 모달 -->
	<div id="deleteFolderModal" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="danger-header-modalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger">
					<h4 class="modal-title">폴더 삭제</h4>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-hidden="true"></button>
				</div>
				<div class="modal-body">폴더를 정말 삭제할까요?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="btn-deleteFolder">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 폴더 삭제용 모달 끝 -->

<script>
	$(function() {
		// 초기화면에서 Root select되어 있도록
		$('.Root').children('a').addClass('jstree-clicked');
		
		// 현재 선택한 파일의 번호를 얻기 위해 미리 선언
		let selectFileNo;
		let mimeType;
		
		let selectFolderNo = 0;
		
		// 현재 선택된 폴더 번호를 담기 위함(파일 저장할 때 사용)
		let currentFolderNo;
		
		// 부모 폴더 번호를 담기 위함
		let selectedParentFolderNo = 1;
		
		// 파일 등록
		let fileInput = $('#input_fileUpload');
		let fileBtn = $('#btn_fileUpload');
		let fileForm = $('#fileForm');
		let inputFolderNo = $('#input_folderNo');

		// 수정/딜리트 드랍다운 아이템
		let deleteEle = $('.deleteEle');
		
		let folderModifyEle = $('.folderModifyEle');
		let folderDeleteEle = $('.folderDeleteEle');

		// 실제 수정 모달의 인풋과 버튼
		let modifyBtn = $('#btn-modifyFileName');

		// 삭제 모달의 버튼
		let deleteBtn = $('#deleteBtn');

		let deleteForm = $('#deleteForm');

		let folderLi = $('.page-aside-left');
		
		// 퀵메뉴
		let homeMenu = $('#home-menu');
		// 메인 메뉴
		let mainMenu = $('#main-menu');
	
		// 폴더 생성 모달 버튼
		let btnCreateFolder = $('#btn-createFolder');

		// 자식 폴더 목록을 담을 변수
		let ChildFolderList;
		
		// 파일검색 폼
		let fileSearchForm = $('#fileSearchForm');
		
		fileSearchForm.submit(function(e) {
			e.preventDefault();
			let searchString = $(this).find('input').val();
			if(searchString == "" || searchString == null ) {
				Swal.fire({title : '검색어를 입력해 주세요.',
	    			icon : 'warning'});
			} else {
				fileSearch(searchString);
			}
		})
		
		// 새 폴더 만들기
		btnCreateFolder.click(function() {
			$("#createFolderNameInput").val($('#input-createFolder').val());
			$("#parentFolderNoInput").val(currentFolderNo);
			
			$('#newFolderForm').submit();
		})
		
		// 파일 수정 모달 띄우기 + 파일 번호 얻기 이벤트
		mainMenu.on("click",".modifyEle",function() {
			selectFileNo = $(this).parents('.fileParent').find('.cloudNo')
					.val();
			mimeType = $(this).parents('.fileParent').find(".mimeType").text();
		})

		// 파일 삭제 모달 띄우기 + 파일 번호 얻기 이벤트
		mainMenu.on("click",".deleteEle",function() {
			selectFileNo = $(this).parents('.fileParent').find('.cloudNo')
					.val();
		})

		modifyBtn.click(function() {
			let modifyName = $('#input-modifyFileName').val() + "." + mimeType;

			$('#cloudNoInput').val(selectFileNo);
			$('#cloudNameInput').val(modifyName);

			deleteForm.attr('action', '/cloud/fileModify')
			deleteForm.submit();
		})

		deleteBtn.click(function() {
			$('#cloudNoInput').val(selectFileNo);
			deleteForm.submit();
		})
		
		$('#btn-deleteFolder').click(function() {
			// 여기서 ajax로 현재 selectFolderNo를 parentFolderNo로 가진 놈들을 가져오고. size가 0보다 크면 삭제 안되도록해야 함
			console.log(selectFolderNo)
			
			let childFolderCount = hasParent(selectFolderNo);
			
			if(childFolderCount > 0) {
// 				alert("자식 폴더가 있는 폴더는 삭제할 수 없습니다!")
				Swal.fire({title : '자식 폴더가 있는 폴더는 삭제할 수 없습니다!',
	    			icon : 'warning'});
			} else {
 				$('#folderNoInput').val(selectFolderNo);
 				$('#folderDeleteForm').submit();
			}
			
		})
		
		$('#btn-modifyFolder').click(function() {
			let modifyName = $('#input-modifyFolderName').val();

			$('#folderNoInput').val(selectFolderNo);
			$('#folderNameInput').val(modifyName);

			$('#folderDeleteForm').attr('action', '/cloud/folderModify')
			$('#folderDeleteForm').submit();
		})

		fileBtn.click(function() {
			fileInput.click();
		})
		
		fileInput.change(function() {
			fileForm.submit();
		})
		
		
		// 폴더 a태그 클릭했을 때
		folderLi.on("click", "a", function(e) {
			e.preventDefault();
			
			// 파일 업로드버튼 활성화
			fileBtn.attr('disabled',false)
			
			
			let selectedFolderNo = $(this).parent("li").data("folder");
			
			let rootFolderFlag = $(this).parent("li").hasClass("Root");
			
			let newBtnFlag = $(this).parent("li").hasClass('lastFolder');
			// 폴더 생성 버튼 막기
			if(newBtnFlag) {
				$('#btn-newFolder').attr('disabled',true)
			} else {
				$('#btn-newFolder').attr('disabled',false)
			}
			
			currentFolderNo = selectedFolderNo;
			inputFolderNo.val(currentFolderNo);
			
			// 부모 폴더 번호를 가져오기 위함. 이 값으로 해당 부모 폴더를 가진 폴더들을 불러와야 함
			// 루트 폴더면 부모 번호 가져올필요 x
			if(!rootFolderFlag) {
				$.ajax({
					url : "/cloud/findParentFolder",
					type : "post",
					async : false,
					beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
						xhr.setRequestHeader(header, token);
					},
					data : { folderNo : selectedFolderNo},
					success : function(res) {
						selectedParentFolderNo = res;
					}
				})	
			}
			
			selectFolder(selectedFolderNo);
		})
		
		// 폴더 more버튼 클릭시 현재 폴더 번호를 받아옴
		homeMenu.on("click",".folder-more",function() {
			selectFolderNo = $(this).parents('.folderParent').find('.folderNo')
					.val();
		})
		
		// 폴더명을 클릭시 폴더로 이동 함.
		homeMenu.on("click",".folder-title",function() {
			let folNo = $(this).parent().find(".folderNo").val();
			selectFolder(folNo);
		})
		
		// 현재 선택된 폴더가 부모 폴더인지 여부 확인
		function hasParent(selectFolderNo) {
			let count = 0;
				
			$.ajax({
				url : "/cloud/hasParent",
				type : "post",
				async : false,
				beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
					xhr.setRequestHeader(header, token);
				},
				data : { folderNo : selectFolderNo},
				success : function(res) {
					count = res;
				}
			})
			return count;
		}
		
		// 파일 검색
		function fileSearch(searchString) {
			// 검색시에는 현재 선택된 폴더 해제
			let selectedTree = $('.jstree-clicked');
			selectedTree.removeClass('jstree-clicked');
			
			$.ajax({
				url : "/cloud/fileSearch",
				type : "post",
				async : false,
				beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
					xhr.setRequestHeader(header, token);
				},
				data : { fileName : searchString},
				success : function(res) {
					viewSearchFile(res);
				}
			})
		}
	

	// 폴더를 선택했을 때 선택한 폴더의 하위폴더/파일을 가져오는 이벤트
	function selectFolder(selectedFolderNo) {
		let selectedTree = $('.jstree-clicked');
		selectedTree.removeClass('jstree-clicked');
		
		let selectLi = $('li').find(`[data-folder=\${selectedFolderNo}]`)
		selectLi.children('a').addClass("jstree-clicked");
// 		"jstree-clicked"
		// 현재 폴더를 ParnetFolder로 가진 하위폴더들의 리스트를 불러 온다.
		$.ajax({
			url : "/cloud/childFolderList",
			type : "post",
			async : false,
			beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
				xhr.setRequestHeader(header, token);
			},
			data : { parentFolderNo : selectedFolderNo},
			success : function(res) {
				ChildFolderList = res;
			}
		});
		
		viewAllFile(selectedFolderNo);
	}
	
	function viewSearchFile(searchFileList) {
		// 바뀌었을 때 상위폴더 메뉴 비워 줌
		homeMenu.html("");
		mainMenu.html("");
		
		
		let html = `<h5 class="mb-2">파일 목록</h5>`;
		
		for(let i = 0; i < searchFileList.length; i++) {
			console.log("리턴 파일들의 파일 번호 : " + searchFileList[i].cloudNo);
			console.log("리턴 파일들의 mimeType : " + searchFileList[i].cloudMime);
			
			let imgMime = searchFileList[i].cloudMime.toLowerCase();
			
			// 기본 값 파일 아이콘
			let iconClass = "mdi-file";
			
			if(searchFileList[i].cloudMime == 'pdf') {
				iconClass = "mdi-file-pdf-box";
			}
			if(searchFileList[i].cloudMime == 'jar' || searchFileList[i].cloudMime == 'zip' || searchFileList[i].cloudMime == 'rar') {
				iconClass = "mdi-zip-box";
			}
			if(searchFileList[i].cloudMime == 'txt') {
				iconClass = "mdi-note-text";
			}
			
			
			html += `
				<div class="col-xxl-3 col-lg-6 fileParent">
				<input name="cloudNo" class="cloudNo" type="hidden" value="\${searchFileList[i].cloudNo }"/>
				<div class="card m-1 shadow-none border">
					<div class="p-2">
						<div class="row align-items-center"
							style="flex-direction: column;">
							<div class="col-auto" style="width: 100%; height: 200px;">
								<div class="avatar-sm" style="width: 100%; height: 100%;">
									<span class="avatar-title bg-light text-reset rounded">`
									
			if(imgMime == 'jpg' || imgMime == 'png') {
				html += `<img src="\${searchFileList[i].cloudImgpath}">`;
			} else {
				html += `<i class="mdi \${iconClass}" style="font-size: 180px;"></i>`;
			}
									
			html +=	`				</span>
								</div>
							</div>
							<div class="col"
								style="padding-left: 20px; padding-top: 10px;">
								<div class="d-flex justify-content-between align-items-center">
									<a href="javascript:void(0);" class="text-muted fw-bold" style="max-width : 90%; white-space: nowrap; overflow: hidden;">\${searchFileList[i].cloudOriginName }</a>
									<div class="dropdown float-end">
										<a href="#" class="dropdown-toggle arrow-none card-drop"
											data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-vertical"></i>
										</a>
									<div class="dropdown-menu dropdown-menu-end" style="">
										<a href="\${searchFileList[i].cloudDownloadpath}" download="\${searchFileList[i].cloudOriginName }"
										 class="dropdown-item">
										 <i class="mdi mdi-file-download me-1"></i> Download</a>
										<a href="javascript:void(0);" class="dropdown-item modifyEle" data-bs-toggle="modal" data-bs-target="#exampleModal">
										<i class="mdi mdi-clipboard-edit me-1"></i> Edit</a>
										<!-- item-->
										<!-- 수정/삭제 세션아이디나 권한에 따라서만 보이게 해줘야 함 -->
										<hr class="dropdown-divider">
										<a href="javascript:void(0);" class="dropdown-item text-danger deleteEle" data-bs-toggle="modal" data-bs-target="#danger-header-modal">
											<i class="mdi mdi-trash-can-outline me-1"></i> Delete
										</a>
									</div>
									
								</div>
								</div>
								<p class="mb-0 font-13">용량 : \${searchFileList[i].cloudFancysize }
									/ 확장자 : <span class="mimeType"> \${searchFileList[i].cloudMime }</span></p>
								<p class="mb-0 font-13 text-secondary">등록일시 :
									\${searchFileList[i].cloudDate }</p>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			`
		}
		mainMenu.append(html);
	}
	
	function viewAllFile(selectedFolderNo) {
		$.ajax({
			url : "/cloud/selectFolder",
			type : "post" ,
			async : false,
			beforeSend : function(xhr) {	// 데이터 전송 전, 헤더에 csrf 값을 설정하기 위함.
				xhr.setRequestHeader(header, token);
			},
			data : { folderNo : selectedFolderNo},
			success : function(data) {
				// 바뀌었을 때 상위폴더 메뉴 비워 줌
				homeMenu.html("");
				mainMenu.html("");
				
				
				let html = `<h5 class="mb-2">파일 목록</h5>`;
				
				for(let i = 0; i < data.length; i++) {
					console.log("리턴 파일들의 파일 번호 : " + data[i].cloudNo);
					console.log("리턴 파일들의 mimeType : " + data[i].cloudMime);
					
					let imgMime = data[i].cloudMime.toLowerCase();
					
					// 기본 값 파일 아이콘
					let iconClass = "mdi-file";
					
					if(data[i].cloudMime == 'pdf') {
						iconClass = "mdi-file-pdf-box";
					}
					if(data[i].cloudMime == 'jar' || data[i].cloudMime == 'zip' || data[i].cloudMime == 'rar') {
						iconClass = "mdi-zip-box";
					}
					if(data[i].cloudMime == 'txt') {
						iconClass = "mdi-note-text";
					}
					
					
					html += `
						<div class="col-xxl-3 col-lg-6 fileParent">
						<input name="cloudNo" class="cloudNo" type="hidden" value="\${data[i].cloudNo }"/>
						<div class="card m-1 shadow-none border">
							<div class="p-2">
								<div class="row align-items-center"
									style="flex-direction: column;">
									<div class="col-auto" style="width: 100%; height: 200px;">
										<div class="avatar-sm" style="width: 100%; height: 100%;">
											<span class="avatar-title bg-light text-reset rounded">`
											
					if(imgMime == 'jpg' || imgMime == 'png') {
						html += `<img src="\${data[i].cloudImgpath}">`;
					} else {
						html += `<i class="mdi \${iconClass}" style="font-size: 180px;"></i>`;
					}
											
					html +=	`				</span>
										</div>
									</div>
									<div class="col"
										style="padding-left: 20px; padding-top: 10px;">
										<div class="d-flex justify-content-between align-items-center">
											<a href="javascript:void(0);" class="text-muted fw-bold" style="max-width : 90%; white-space: nowrap; overflow: hidden;">\${data[i].cloudOriginName }</a>
											<div class="dropdown float-end">
												<a href="#" class="dropdown-toggle arrow-none card-drop"
													data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-vertical"></i>
												</a>
											<div class="dropdown-menu dropdown-menu-end" style="">
												<a href="\${data[i].cloudDownloadpath}" download="\${data[i].cloudOriginName }"
												 class="dropdown-item">
												 <i class="mdi mdi-file-download me-1"></i> Download</a>
												<a href="javascript:void(0);" class="dropdown-item modifyEle" data-bs-toggle="modal" data-bs-target="#exampleModal">
												<i class="mdi mdi-clipboard-edit me-1"></i> Edit</a>
												<!-- item-->
												<!-- 수정/삭제 세션아이디나 권한에 따라서만 보이게 해줘야 함 -->
												<hr class="dropdown-divider">
												<a href="javascript:void(0);" class="dropdown-item text-danger deleteEle" data-bs-toggle="modal" data-bs-target="#danger-header-modal">
													<i class="mdi mdi-trash-can-outline me-1"></i> Delete
												</a>
											</div>
											
										</div>
										</div>
										<p class="mb-0 font-13">용량 : \${data[i].cloudFancysize }
											/ 확장자 : <span class="mimeType"> \${data[i].cloudMime }</span></p>
										<p class="mb-0 font-13 text-secondary">등록일시 :
											\${data[i].cloudDate }</p>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					`
				}
				if(ChildFolderList.length > 0) {
					let quickHtml = `<h5 class="mb-2">하위 폴더</h5>`;
									
						for(let i = 0; i < ChildFolderList.length; i++) {
							quickHtml += `
									<div class="col-xxl-3 col-lg-6 folderParent">
										<div class="card m-1 shadow-none border">
								<div class="p-2">
								<div class="row align-items-center">
								<div class="col-auto" >
													<div class="avatar-sm">
														<span class="avatar-title bg-light text-reset rounded">
															<i class="mdi mdi-folder" style="font-size: 32px;"></i>
														</span>
													</div>
												</div>
												<div class="col ps-0 align-content-center">
													<a class="text-muted fw-bold folder-title">\${ChildFolderList[i].folderName}</a>
													<input type="text" class="folderNo" hidden value="\${ChildFolderList[i].folderNo}"/>
													<div class="dropdown float-end">
													<a href="#" class="dropdown-toggle arrow-none card-drop"
														data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-vertical folder-more"></i>
													</a>
												<div class="dropdown-menu dropdown-menu-end" style="">
													<a href="javascript:void(0);" class="dropdown-item modifyEle" data-bs-toggle="modal" data-bs-target="#modifyFolderModal">
													<i class="mdi mdi-clipboard-edit me-1"></i> Edit</a>
													<!-- item-->
													<!-- 수정/삭제 세션아이디나 권한에 따라서만 보이게 해줘야 함 -->
													<hr class="dropdown-divider">
													<a href="javascript:void(0);" class="dropdown-item text-danger deleteEle" data-bs-toggle="modal" data-bs-target="#deleteFolderModal">
														<i class="mdi mdi-trash-can-outline me-1"></i> Delete
													</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							`;
						}
					homeMenu.append(quickHtml);
				}
				mainMenu.append(html);
			}
		})
	}
	
	
	}) // $(function(){}) 끝
</script>

    <!-- Code Highlight js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/highlightjs/highlight.pack.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/clipboard/clipboard.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/hyper-syntax.js"></script>

    <!-- jstree -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/jstree/jstree.min.js"></script>

    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.jstree.js"></script>

    <!-- App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>
</html>