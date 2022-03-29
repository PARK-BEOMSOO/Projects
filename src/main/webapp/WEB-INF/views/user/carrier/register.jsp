<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title> HMIS :: 보유기술</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="/resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<style>
body.loading {
	visibility: hidden;
}
</style>

<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css"
	rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/dist/assets/css/app.min.css" rel="stylesheet"
	type="text/css" id="main-style-container" />

</head>
<style>
td, th {
	text-align: center;
}

body[data-layout=detached] .wrapper {
	overflow: hidden !important;
}
</style>
<body class="loading">
	<div id="detached-topbar-placeholder"></div>
	<!-- Begin page -->
	<div class="wrapper">

		<div id="detached-sidebar-placeholder"></div>

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="/user/main">HMIS</a></li>
										<li class="breadcrumb-item"><a href="/user/carrier/list">진로분야 목록</a></li>
										<li class="breadcrumb-item active">진로분야 등록</li>
									</ol>
								</div>
								<h4 class="page-title">진로분야 등록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">

							<form name="frm" method="post" role="form">
                              <input type="hidden" name="carNo" id="carNo"> 
                              <input type="hidden" name="userNo" id="userNo"  value="${login.userNo}">

                              <div class="form-row">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">진로분야</label><span
                                       class="text-danger">*</span>
                                    <div class="input-group">
                                       <input type="text" class="form-control" name="carName"
                                          id="carName" readonly="readonly"
                                          placeholder="진로분야를 선택해주세요.">
                                       <div class="input-group-append">
                                        <button class="btn btn-primary" type="button" onClick="window.open('/user/carrier/searchPopup?userNo=${login.userNo}', 'CLIENT_WINDOW',
                                          'toolbar=yes,menubar=yes,width=700.height=500')"  id="popupBtn">검색</button>
                                          
                                       </div>
                                    </div>
                                 </div>
                              </div>
										<div style="text-align: right;">
										<input type="submit" class="btn btn-primary" onclick="return validate()" value="등록">
										</div>
										
									</form>

								</div>
								<!-- end card-body -->
							</div>
							<!-- end card-->
						</div>
						<!-- end col-12 -->
					</div>
					<!-- end row -->

				</div>
				<!-- container -->

			</div>
			<!-- content -->

			<!-- Footer Start -->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">2018 - 2019 © Hyper - Coderthemes.com
						</div>
						<div class="col-md-6">
							<div class="text-md-right footer-links d-none d-md-block">
								<a href="javascript: void(0);">About</a> <a
									href="javascript: void(0);">Support</a> <a
									href="javascript: void(0);">Contact Us</a>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- end Footer -->

		</div>
		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->


	<!-- END wrapper -->

	<!-- App js -->
	<script src="/resources/dist/assets/js/app.js"></script>

	<!-- third party js -->
	<script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
	<script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
	<!-- third party js ends -->

	<!-- demo app -->
	<script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
	<!-- end demo js-->


</body>

<!-- 다중 파일 업로드 js
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
 -->
<script>
// searchSub 팝업창 띄우기
$("#subPopup").click(function(){
	var url = "searchPopup";
    var name = "항목 검색";
    var option = "width = 700, height = 500, top = 100, left = 200, location = no";
    window.open(url, name, option);
});

// 신청 등록 유효성 검사 
function validate(){
	var carNo = $("#carNo").val();
	var carName = $("#carName").val();
	
	if(carNo == ""){
		alert("진로분야를 선택해주세요.");
		document.getElementById("carName").focus();
		return false;
	}
	
	return true;
	
}

</script>

<!-- SD PROJECT JS -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

</html>