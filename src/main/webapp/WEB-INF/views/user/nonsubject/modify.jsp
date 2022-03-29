<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title> HMIS :: 비교과 내역 관리</title>
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
										<li class="breadcrumb-item"><a href="/user/nonsubject/list">비교과 관리 목록</a></li>
										<li class="breadcrumb-item active">비교과 내역 수정</li>
									</ol>
								</div>
								<h4 class="page-title">비교과 내역 수정</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
						<div class="card">
							<div class="card-body">

								<form name="frm" method="post" >
									<input type="hidden" name="nonsubjectNo" id="nonsubjectNo" value="${nVo.nonsubjectNo}"> 
									<input type="hidden" name="userNo" id="userNo" value="${login.userNo}">
									
									<div class="form-group mb-3">
										<label for="inputCity" class="col-form-label">비교과명</label><span
											class="text-danger">*</span> <input type="text"
											class="form-control" name="nonsubName" id="nonsubName"
											value="${nVo.nonsubName}" onKeyUp="fnChkByte(this,'60')">
									</div>
									<div class="form-group ">
										<label for="inputAddress2" class="col-form-label">교육내용</label>
										<span class="text-danger">*</span>
										<textarea class="form-control" name="content" id="content"
											rows="5" onKeyUp="fnChkByte(this,'900')">${nVo.content}</textarea>
										<div style="text-align: right;">
											<span id="byteInfo">0</span> / 900
										</div>
									</div>
									<div class="row">
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">수료일자</label><span
												class="text-danger">*</span> <input type="date"
												name="finishDate" id="finishDate" class="form-control"
												value="${nVo.finishDate}">
										</div>
									</div>

									<div style="text-align: right;">
										<input type="submit" class="btn btn-primary" value="수정"
											onclick="return validate()">
 										<button onclick="location.href='/user/nonsubject/list'" type="button" class="btn btn-light" style="font-size: 14px;">목록</button>											
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
					<div class="col-md-6">2018 - 2019 © Hyper - Coderthemes.com</div>
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

<script>
	// 신청 등록 유효성 검사 
	function validate() {
		var nonsubName = $("#nonsubName").val();
		var userNo = $("#userNo").val();
		var content = $("#content").val();
		var finishDate = $("#finishDate").val();

		if (nonsubName == "") {
			alert("비교과명을 입력해주세요.");
			document.getElementById("nonsubName").focus();
			return false;
		}

		if (userNo == "") {
			alert("로그인 해주세요.");
			document.getElementById("userNo").focus();

			return false;
		}
		if (content == "") {
			alert("교육내용를 입력해주세요.");
			document.getElementById("content").focus();

			return false;
		}
		if (finishDate == "") {
			alert("수료일을 입력해주세요.");
			document.getElementById("finishDate").focus();

			return false;
		}

		return true;

	}

	function fnChkByte(obj, maxByte) {
		var str = obj.value;
		var str_len = str.length;

		var rbyte = 0;
		var rlen = 0;
		var one_char = "";
		var str2 = "";

		for (var i = 0; i < str_len; i++) {
			one_char = str.charAt(i);
			if (escape(one_char).length > 4) {
				rbyte += 3; //한글3Byte
			} else {
				rbyte++; //영문 등 나머지 1Byte
			}

			if (rbyte <= maxByte) {
				rlen = i + 1; //return할 문자열 갯수
			}
		}

		if (rbyte > maxByte) {
			alert(maxByte + "byte를 초과할 수 없습니다.")
			str2 = str.substr(0, rlen); //문자열 자르기
			obj.value = str2;
			fnChkByte(obj, maxByte);
		} else {
			if (obj == document.getElementById('content')) {
				document.getElementById('byteInfo').innerText = rbyte;
			}
		}
	}
</script>

<!-- SD PROJECT JS -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</html>