<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title> HMIS :: 취업공고</title>
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
										<li class="breadcrumb-item"><a href="/user/announcement/list">취업공고 목록</a></li>
										<li class="breadcrumb-item active">취업공고 상세보기</li>
									</ol>
								</div>
								<h4 class="page-title">취업공고 상세보기</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					
						<div class="row">
					    <div class="col-12">
						<div class="card">
							<div class="card-body">
								<form name="frm" method="post" role="form">
									<input type='hidden' name='page' value="${cri.page}">
									<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
									<input type='hidden' name='searchType' value="${cri.searchType}">
									<input type='hidden' name='keyword' value="${cri.keyword}">


									<div class="form-group mb-3">
										<label for="inputEmail4" class="col-form-label">제목</label>
										
										<input type="text" name="title"
											id="title" class="form-control" value="${aVo.title}" disabled>
									</div>
									<div class="form-group mb-3">
										<label for="inputPassword4" class="col-form-label">회사명</label>
										<input type="text" name="compName"
											id="compName" class="form-control" value="${aVo.compName}" disabled>
									</div>

									<div class="form-group mb-3">
										<label for="inputEmail4" class="col-form-label">직무명</label>
										<input type="text" name="job"
											id="job" class="form-control" value="${aVo.job}" disabled>
									</div>


									<div class="form-group mb-3">
										<label for="inputCity" class="col-form-label">지역</label>
										<input type="text" name="compArea"
											id="compArea" class="form-control" value="${aVo.compArea}" disabled>
									</div>

									<div class="form-group mb-3">
										<label for="inputPassword4" class="col-form-label">취업공고상세</label>
										<textarea class="form-control" name="content" id="content"
											rows="10" disabled>${aVo.content}</textarea>
											
									</div>

									<div class="row">
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">작성자</label>
											<input type="text" name="regName"
											id="regName" class="form-control" value="${aVo.regName}" disabled>
										</div>
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">마감일</label>
											<input type="text" name="regDate"
											id="regDate" class="form-control" value="${aVo.regDate}" disabled>
										</div>
									</div>

									<div style="text-align: right;">
										<input type="submit" class="btn btn-primary" value="목록">
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
</div>
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
	<script src="/resources/dist/assets/js/app.js"></script>

	<!-- third party js -->
	<script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
	<script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
	<!-- third party js ends -->

	<!-- demo app -->
	<script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
	<!-- end demo js-->

</body>





<!-- SD PROJECT JS -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			//목록버튼
			$(".btn-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/user/announcement/list");
				formObj.submit();
			});
		});

	</script>	


</html>