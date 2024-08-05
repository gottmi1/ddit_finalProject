<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Apex</title>
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/assets/js/hyper-config.js"></script>
<link href="${pageContext.request.contextPath }/resources/assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link href="${pageContext.request.contextPath }/resources/privateCSS/PSA/styles.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<tiles:insertAttribute name="body"/>
</body>
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.dashboard.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>
</html>