<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
/* 전체 미리보기 */
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 20px;
}
/* 하얀 A4용지 부분 */
.preview-container {
	/*             text-align: center; */
	padding-right: 20px;
}
/* A4용지 부분 안의 div */
.preview {
	border: 1px solid #ddd;
	padding: 10px;
	background-color: white;
	transform: scale(1.0);
	transform-origin: top left;
	margin-bottom: 20px;
	color: black;
}
/* 하단 PDF 생성 버튼 */
.actions-container {
	text-align: center;
	width: 100%;
}
/* .preview 안 */
.certificate-container {
	width: 210mm;
	height: 297mm;
	background-color: white;
	position: relative;
	border: 3px solid #800020;
	/*             padding: 20px; */
	box-sizing: border-box;
}

.certificate {
	width: 100%;
	height: 100%;
	padding: 20px;
	background-color: white;
/* 	font-family: 'Times New Roman', serif; */
	line-height: 1.6;
	position: relative;
	box-sizing: border-box;
}
/* 완료보고서 타이틀 */
.header {
	text-align: center;
	margin-bottom: 20px;
}

.header h1 {
	font-size: 3em;
	margin: 0;
	font-weight: bold;
}

.footer {
	text-align: center;
	margin-top: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.2em;
}
/* 발급일자 */
.timestamp {
	font-size: 1.2em;
 	color: black;
	text-align: right;
}
/* 직인 */
.seal-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}
/* 직인 */
.seal {
	margin-left: 20px;
}
/* 직인 */
.seal img {
	width: 100px;
	height: 100px;
}
/* 로고 워터마크 */
.logo-container {
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
/* 로고 사이즈 */
.apexLogoImg {
	width: 300px;
	height: 300px;
	opacity: 0.1; /* 투명도 설정 (0.0 ~ 1.0) */
}
/* PDF생성 버튼 */
#generatePdf {
	padding: 10px 20px;
	font-size: 1.2em;
	cursor: pointer;
	background-color: #800020;
	color: white;
	border: none;
	border-radius: 5px;
	margin-top: 20px;
}
/*         .table-borderless th{ */
/*         	text-align: center; */
/*         } */
.table td, .table th {
	/*         	font-size: 1rem; */
	color: black;
	/*         	text-align: center; */
}

.header-body {
	/*         	border: 1px; */
	
}
</style>
	<div class="container">
		<h1>미리보기</h1>
		<div class="preview-container">
			<div class="preview">
				<div class="certificate-container" id="previewContainer">
					<div class="certificate">
						<div class="logo-container">
							<img class="apexLogoImg"
								src="${pageContext.request.contextPath}/resources/assets/images/apexLogo.png"
								alt="APEX 로고" style="width: 300px; height: 300px;">
						</div>
						<p style="text-align: left;">
							발급 번호 : 제 <span id="certificate-Number"></span> 호
						</p>
						<br />
						<div class="header mb-3">
							<h1>프 로 젝 트 완 료 보 고 서</h1>
						</div>
						<div class="header-body p-2">
							<div class="body">
								<!-- 프로젝트명 -->
								<table class="table table-bordered table-centered mb-0">
									<!-- 									<table class="table table-borderless"> -->
									<tr>
										<th class="pb-0 pt-1">프로젝트명</th>
										<td class="pb-0 pt-1">${projectsReport.proName}</td>
									</tr>
									<tr>
										<th class="pb-0 pt-1">개발&nbsp;&nbsp;&nbsp;목적</th>
										<td class="pb-0 pt-1">직관적이고 사용이 간편하여 업무의 피로도를 줄여줍니다.<br />
											필수 기능과 효율적인 인터페이스 덕분에 사용자가 원하는 정보를 빠르게 찾을수 있고,<br /> 팀 간 협업을
											촉진하여 프로젝트 진행 속도를 높입니다.
										</td>
									</tr>
									<tr>
										<th class="pb-0 pt-1">개발&nbsp;&nbsp;&nbsp;기간</th>
										<td class="pb-0 pt-1">
											<fmt:formatDate value="${projectsReport.proStartdate}" pattern="yyyy-MM-dd" />
											~ <fmt:formatDate value="${projectsReport.proEnddate}" pattern="yyyy-MM-dd" />
										</td>
									</tr>
									<tr>
										<th class="pb-0 pt-1">팀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장</th>
										<td class="pb-0 pt-1">${projectsReport.hisProLeaderName}</td>
									</tr>
									<tr>
										<th class="pb-0 pt-1">팀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원</th>
										<td class="pb-0 pt-1">${projectsReport.hisProMemberList}
											(총 ${projectsReport.proMemberCount}명)</td>
									</tr>
								</table>
								<hr />

								<!-- 프로젝트 일감 목록 -->
								<div class="row">
									<h3 class="mt-2" style="text-align: center;">프로젝트 일감 목록</h3>
									<table class="table table-striped table-centered mb-0">
										<!-- 								<table class="table table-borderless"> -->
										<tr style="background-color: #d3d3d3;">
											<th class="pb-0 pt-1">일감명</th>
											<th class="pb-0 pt-1">기간</th>
											<th class="pb-0 pt-1">인원수</th>
										</tr>
										<c:forEach items="${projectsReport.workList }" var="work"
											varStatus="status">
											<%-- 	                            <span class="field-value">관리번호 : ${work.workNo }</span> --%>
											<tr
												style="${status.index % 2 == 1 ? 'background-color: #f2f2f2;' : ''}">
												<td class="pb-0 pt-1">${work.workTitle }</td>
												<fmt:parseDate value="${work.workStartdate}" var="workStartdate" pattern="yyyyMMdd"/>
												<fmt:parseDate value="${work.workEnddate}" var="workEnddate" pattern="yyyyMMdd"/>
												
<%-- 												<td class="pb-0 pt-1">${work.workStartdate}~${work.workEnddate}</td> --%>
												<td class="pb-0 pt-1"><fmt:formatDate value="${workStartdate}" pattern="yyyy-MM-dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${workEnddate}" pattern="yyyy-MM-dd"/></td>
												<td class="pb-0 pt-1">
													${fn:length(work.managerList)}명
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<!-- 프로젝트 일감 목록 row끝 -->
							</div>
							<!-- body끝 -->
						</div>
						<!-- header-body -->

					</div>
					<!-- certificate끝 -->

					<div class="footer">
						<div class="timestamp">
							발급일자: <span id="currentDate"></span>
						</div>
					</div>
					<!-- footer 끝 -->
				</div>
				<!-- certificate-container끝 -->
			</div>
			<!-- preview끝 -->
		</div>
		<!-- preview-container끝 -->

		<div class="actions-container">
			<button id="generatePdf">PDF 생성</button>
		</div>
	</div>
	<!-- container끝 -->

	<script>

    // 오늘 날짜를 '년 월 일' 형식으로 반환하는 함수
    function getToday() {
        var date = new Date();
        return date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일";
    }

    // 랜덤 발급 번호를 생성하는 함수
    var sequenceNumber = 1; // 순번 초기값
    function getRandomCertificateNumber() {
    	var date = new Date();
    	var year = date.getFullYear().toString();
    	var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1
    	var day = date.getDate().toString().padStart(2, '0');
        
        // 0001부터 9999 사이의 랜덤 순번 생성
        var sequence = ('000' + sequenceNumber).slice(-4);
        
        // 년월일과 순번을 '-'로 연결하여 반환
        return `\${year}\${month}\${day}-\${sequence}`;
    }
    
    $(document).ready(function() {
    	
		// 발급번호
        var certificateNumber = getRandomCertificateNumber();
        console.log("# certificateNumber : ", certificateNumber);
        $('#certificate-Number').text(certificateNumber);
        
        // HTML 요소에 오늘 날짜와 랜덤 발급 번호 설정
        $('#currentDate').text(getToday());

        // PDF 생성 버튼 클릭 이벤트 핸들러
        $('#generatePdf').on('click', function() {
            // html2canvas를 사용하여 특정 HTML 요소를 캡처
            html2canvas($('#previewContainer')[0], {
                scale: 2 // 해상도를 2배로 설정하여 고화질로 캡처
            }).then(function(canvas) {
                // 캡처된 내용을 이미지 데이터 URL로 변환
                var imgData = canvas.toDataURL('image/png');
                var imgWidth = 210; // A4 용지의 너비 (단위: mm)
                var pageHeight = 297; // A4 용지의 높이 (단위: mm)
                var imgHeight = canvas.height * imgWidth / canvas.width; // 이미지의 높이를 비율에 맞게 계산
                var { jsPDF } = window.jspdf; // jsPDF를 jspdf 객체에서 가져옴
                var doc = new jsPDF('p', 'mm', 'a4'); // 새로운 jsPDF 문서 생성

                // PDF에 이미지 추가
                doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
                
                // PDF를 Blob 형식으로 출력
                var pdfBlob = doc.output('blob');

                // Blob URL 생성
                var pdfUrl = URL.createObjectURL(pdfBlob);

                // 새 창에서 PDF 보기
                window.open(pdfUrl, '_blank');
            });
        });
    });
</script>
