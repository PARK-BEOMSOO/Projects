<<<<<<< HEAD
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
										<li class="breadcrumb-item"><a
											href="/user/posting/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">채용공고
												목록</a></li>
										<li class="breadcrumb-item active">추천 채용공고 목록</li>
									</ol>
								</div>
								<h4 class="page-title">추천 채용공고</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">

							<div class="card">

								<div class="card-body">
									<div class="row mb-2">
										<div class="col-lg-8">

											<form class="form-inline">

												<div class="form-group mx-sm-3 mb-2"></div>
												<div class="form-group mb-2"></div>
											</form>
										</div>
										<!-- end col-->
									</div>



									<div class="table-responsive">
										<table class="table table-centered mb-0">
											<thead class="thead-light">
												<tr>
													<th>순위</th>
													<th>채용직무</th>
													<th>기업명</th>
													<th>기업형태</th>
													<th>연봉</th>
													<th>추천점수</th>
												</tr>
											</thead>

											<tbody>
												<c:if test="${!empty recommandDTO}">
													<c:forEach items="${recommandDTO}" var="recommandDTO"
														varStatus="Status">
														<tr>
															<td>${Status.count}</td>
															<td><a
																href='read${pageMaker.makeSearch(pageMaker.cri.page)}&postingId=${list.postingId}'>
																	${recommandDTO.jobName}</a></td>
															<td>${recommandDTO.companyName}</td>
															<td>${recommandDTO.companySize}</td>
															<c:if test="${!empty recommandDTO.salary}">
																<td>${recommandDTO.salary}</td>
															</c:if>
															<c:if test="${empty recommandDTO.salary}">
																<td>-</td>
															</c:if>
															<td>${recommandDTO.recommand}</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${empty recommandDTO}">
													<tr>
														<td colspan="6">내역이 없습니다.</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
								<!-- end card-body-->

								<div class="card-footer">
								</div>
							</div>
							<!-- end card footer -->
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

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->


	</div>
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
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}

	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

			});
</script>
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/user/posting/recommandlist");
			formObj.submit();
		});
	});
</script>
=======
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
										<li class="breadcrumb-item">HMIS</li>
									</ol>
								</div>
								<h4 class="page-title">추천 기업 목록</h4>
							</div>
						</div>
					</div>


					<!-- Start card2-->
					<div class="row" style="justify-content: center;">
						<div class="col-12">

							<div class="card">

								<div class="card-body">

									<div class="table-responsive">
										<table class="table table-centered mb-0">
											<thead class="thead-light">
												<tr>
													<th>NO</th>
													<th>채용직무</th>
													<th>기업명</th>
													<th>기업형태</th>
													<th>연봉</th>
													<th>추천점수</th>
												</tr>

												<c:if test="${!empty recommandDTO}">
													<c:forEach items="${recommandDTO}" var="recommandDTO"
														varStatus="Status">
														<tr>
															<td>${Status.count}</td>
															<td><a
																href='read${pageMaker.makeSearch(pageMaker.cri.page)}&postingId=${list.postingId}'>
																	${list.jobName}</a></td>
															<td>${recommandDTO.companyName}</td>
															<td>${recommandDTO.companySize}</td>
															<td>${recommandDTO.salary}</td>
															<td>${recommandDTO.recommand}</td>
														</tr>
													</c:forEach>
												</c:if>

												<c:if test="${empty recommandDTO}">
													<tr>
														<td colspan="6">내역이 없습니다.</td>
													</tr>
												</c:if>
											</thead>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- end card-body-->

					<!-- end col-12 -->
				</div>
				<!-- end row -->

			</div>
			<!-- container -->


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
			<!-- ============================================================== -->
			<!-- End Page content -->
			<!-- ============================================================== -->
		</div>
	</div>
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
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}

	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

			});
</script>
>>>>>>> branch 'master' of https://github.com/Ohsojin/HR_Matching.git
</html>