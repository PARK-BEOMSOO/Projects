<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 취업공고</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="/resources/dist/assets/images/favicon.ico">
<style>
ul {
	list-style: none;
	padding-left: 0px;
}
</style>
<!-- END File Upload Style -->

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
#acDate {
	background-color: #fff;
}
</style>
<body class="loading">
	<div id="vertical-topbar-placeholder"></div>
	<!-- Begin page -->
	<div class="wrapper">

		<div id="vertical-sidebar-placeholder"></div>

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="row" style="justify-content: center;">
					<div class="col-7">
						<div class="page-title-box">
							<div class="page-title-right">
								<ol class="breadcrumb m-0">
									<li class="breadcrumb-item"><a
										href="/admin/main">HMIS</a></li>
									<li class="breadcrumb-item"><a
										href="/announcement/list">취업공고 목록</a></li>
									<li class="breadcrumb-item active">취업공고 등록</li>
								</ol>
							</div>
							<h4 class="page-title">취업공고 등록</h4>
						</div>
					</div>
				</div>
				<!-- end page title -->

				<div class="row" style="justify-content: center;">
					<div class="col-lg-7">
						<div class="card">
							<div class="card-body">

								<form name="frm" method="post" >

									<div class="form-group mb-3">
										<label for="inputEmail4" class="col-form-label">제목</label><span
											class="text-danger">*</span> <input type="text" name="title"
											id="title" class="form-control"
											onKeyUp="fnChkByte(this,'80')">
									</div>
									<div class="form-group mb-3">
										<label for="inputPassword4" class="col-form-label">회사명</label><span
											class="text-danger">*</span> <input type="text"
											name="compName" id="compName" class="form-control"
											onKeyUp="fnChkByte(this,'50')">
									</div>

									<div class="form-group mb-3">
										<label for="inputEmail4" class="col-form-label">직무명</label><span
											class="text-danger">*</span>
										<div class="input-group">
											<input type="text" class="form-control" name="job" id="job"
												onKeyUp="fnChkByte(this,'30')">
										</div>
									</div>

									<div class="form-group mb-3">
										<label for="inputCity" class="col-form-label">지역</label> <span
											class="text-danger">*</span> <input type="text"
											class="form-control" name="compArea" id="compArea"
											onKeyUp="fnChkByte(this,'50')">
									</div>


									<div class="form-group mb-3">
										<label for="inputPassword4" class="col-form-label">취업공고상세</label>
										<span class="text-danger">*</span>
										<textarea class="form-control" name="content" id="content"
											rows="15" onKeyUp="fnChkByte(this,'4000')"></textarea>
										<div style="text-align: right;">
											<span id="byteInfo">0</span> / 4000
										</div>

									</div>



									<div class="row">
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">마감일</label><span
												class="text-danger">*</span> <input type="date"
												name="endDate" id="endDate" class="form-control">
										</div>
										 
										 <div class="form-group mb-3 col-lg-5">
											<label for="inputEmail4" class="col-form-label">작성자</label> <input
											type="text" name="regName" id="regName" value="${login.userName}" class="form-control" readonly>
							  		 </div>
									</div>

									<div style="text-align: right;">
										<input type="submit" class="btn btn-primary" value="등록"
											onclick="return validate()">
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

	<!-- ============================================================== -->
	<!-- End Page content -->
	<!-- ============================================================== -->



	<!-- END wrapper -->



	<!-- App js -->
	<script src="/resources/dist/assets/js/app_admin.js"></script>

</body>

<!-- 다중 파일 업로드 js
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
 -->
<script>
	// 취업공고 등록 유효성 검사 
	function validate() {
		var title = $("#title").val();
		var compName = $("#compName").val();
		var endDate = $("#endDate").val();
		var job = $("#job").val();
		var compArea = $("#compArea").val();
		var content = $("#content").val();

		if (title == "") {
			alert("제목을 입력해주세요.");
			document.getElementById("title").focus();
			return false;
		}
		if (compName == "") {
			alert("회사명를 입력해주세요.");
			document.getElementById("compName").focus();

			return false;
		}
		if (job == "") {
			alert("직무명을 입력해주세요.");
			document.getElementById("job").focus();

			return false;
		}
		if (compArea == "") {
			alert("지역을 입력해주세요.");
			document.getElementById("compArea").focus();

			return false;
		}
		if (content == "") {
			alert("상세내역을 입력해주세요.");
			document.getElementById("content").focus();

			return false;
		}
		if (endDate == "") {
			alert("마감일을 입력해주세요.");
			document.getElementById("endDate").focus();

			return false;
		}
		
		alert("등록되었습니다.");
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
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>



</html>