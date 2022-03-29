<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 채용공고</title>
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

				<!-- start page title -->
				<div class="row">
					<div class="col-12">
						<div class="page-title-box">
							<div class="page-title-right">
								<ol class="breadcrumb m-0">
									<li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
									<li class="breadcrumb-item"><a
										href="/admin/posting/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">채용공고
											목록</a></li>
									<li class="breadcrumb-item active">채용공고 상세보기</li>
								</ol>
							</div>
							<h4 class="page-title">채용공고 상세보기</h4>
						</div>
					</div>
				</div>
				<!-- end page title -->



				<div class="row">
					<div class="col-sm-12">
						<!-- Profile -->
						<div class="card bg-primary">
							<div class="card-body profile-user-box">

								<div class="row">
									<div class="col-sm-8">
										<div class="media">
											<span class="float-left m-2 mr-4"><img
												src="/resources/dist/assets/images/users/avatar-2.jpg"
												style="height: 100px;" alt=""
												class="rounded-circle img-thumbnail"></span>
											<div class="media-body">
												<form role="form" name="frm">

													<input type="hidden" name="postingId" id="postingId"
														value="${postingVO.postingId}"> <input
														type='hidden' name='page' value="${cri.page}"> <input
														type='hidden' name='perPageNum' value="${cri.perPageNum}">
													<input type='hidden' name='searchType'
														value="${cri.searchType}"> <input type='hidden'
														name='keyword' value="${cri.keyword}">

													<h4 class="mt-1 mb-1 text-white">${postingVO.companyName}</h4>
													<p class="font-13 text-white-50">
														${postingVO.companySize}</p>

													<ul class="mb-0 list-inline text-light">

														<li class="list-inline-item mr-3">
															<h5 class="mb-1">임금</h5>
															<p class="mb-0 font-13 text-white-50">${postingVO.salary}</p>
														</li>

														<li class="list-inline-item">
															<h5 class="mb-1">채용 직무</h5>
															<p class="mb-0 font-13 text-white-50">${postingVO.jobName}</p>
														</li>

													</ul>
											</div>
											<!-- end media-body-->
										</div>
									</div>
									<!-- end col-->

									<div class="col-sm-4">
										<div class="text-center mt-sm-0 mt-3 text-sm-right">
											<button type="button" class="btn btn-success">
												<i class="mdi mdi-account-edit mr-1"></i> 수정
											</button>
											<button type="button" class="btn btn-danger">
												<i class="mdi mdi-account-edit mr-1"></i> 삭제
											</button>
										</div>
									</div>
									<!-- end col-->

								</div>
								<!-- end row -->

							</div>
							<!-- end card-body/ profile-user-box-->
						</div>
						<!--end profile/ card -->
					</div>
					<!-- end col-->
				</div>
				<!-- end row -->


				<div class="row">
					<div class="col-md-4">
						<!-- Personal-Information -->
						<div class="card">
							<div class="card-body">
								<h4 class="header-title mt-0 mb-3">기업소개</h4>
								<p class="text-muted font-13">${postingVO.companyOverview}</p>

								<hr />

								<div class="text-left">
									<p class="text-muted">
										<strong>기업명 :</strong> <span class="ml-2">${postingVO.companyName}</span>
									</p>

									<p class="text-muted">
										<strong>기업형태 :</strong><span class="ml-2">${postingVO.companySize}</span>
									</p>

									<p class="text-muted">
										<strong>위치 :</strong> <span class="ml-2">대한민국</span>
									</p>

								</div>
							</div>
						</div>
						<!-- Personal-Information -->

						<!-- Personal-Information -->
						<div class="card">
							<div class="card-body">
								<h4 class="header-title mt-0 mb-3">사이트 연결</h4>
								<p class="text-muted font-13">
									<a href="https://${postingVO.linkAddress}" target="_blank">${postingVO.linkAddress}</a>
								</p>

								<hr />
							</div>
						</div>

						<!-- Toll free number box-->
						<div class="card text-white bg-info overflow-hidden">
							<div class="card-body">
								<div class="toll-free-box text-center">
									<h4>
										<i class="mdi mdi-deskphone"></i> 경영정보학과 연락처 : 042-629-1234
									</h4>
								</div>
							</div>
							<!-- end card-body-->
						</div>
						<!-- end card-->
						<!-- End Toll free number box-->

						<!-- Messages-->
						<div class="card">
							<div class="card-body">
								<h4 class="header-title mb-3">RECOMMAND STUDENTS</h4>
								<c:if test="${!empty recommandDTO}">
									<c:forEach items="${recommandDTO}" var="recommandDTO"
										varStatus="Status">

										<div class="inbox-widget">
											<div class="inbox-item">
												<div class="inbox-item-img">
													<img src="/resources/dist/assets/images/users/avatar-2.jpg"
														class="rounded-circle" alt="">
												</div>
												<p class="inbox-item-author">
													<a
														href='/admin/portfolio/read?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}read${pageMaker.makeSearch(pageMaker.cri.page)}&userNo=${recommandDTO.userNo}&userName=${recommandDTO.userName}'>
														${recommandDTO.userName} </a>
												</p>
												<p class="inbox-item-text">${recommandDTO.userNo}</p>
												<p class="inbox-item-date">
													<a href="#" class="btn btn-sm btn-link text-info font-13">
														${recommandDTO.recommandScore} </a>
												</p>
											</div>
										</div>
										<!-- end inbox-widget -->

									</c:forEach>
								</c:if>

							</div>
							<!-- end card-body-->
						</div>
						<!-- end card-->

						<div class="col-sm-0">
							<div class="text-center mt-sm-0 mt-3 text-sm-center">
								<button type="button" class="btn btn-light">
									<i class="mdi mdi-account-edit mr-1"></i> 인재 추천 받기
								</button>
							</div>
						</div>
						<!-- end col-->

					</div>
					<!-- end col-->

					<div class="col-md-8">

						<!-- Chart-->
						<div class="card">
							<div class="card-body">
								<h4 class="header-title mb-3">직무 소개</h4>
								<div class="chartjs-chart">${postingVO.jobDesc}</div>
							</div>
						</div>

						<!-- Chart-->
						<div class="card">
							<div class="card-body">
								<h4 class="header-title mb-3">자격 요건</h4>
								<div class="chartjs-chart">${postingVO.jobRequirement}</div>
							</div>
						</div>
						<!-- Chart-->
						<div class="card">
							<div class="card-body">
								<h4 class="header-title mb-3">우대 사항</h4>
								<div class="chartjs-chart">${postingVO.content}</div>
							</div>
						</div>

						<!-- End Chart-->

						<div class="row">
							<div class="col-sm-4">
								<div class="card tilebox-one">
									<div class="card-body">
										<i class="dripicons-basket float-right text-muted"></i>
										<h6 class="text-muted text-uppercase mt-0">기업 형태</h6>
										<h5 class="m-b-20" style="color: green">${postingVO.companySize}</h5>
									</div>
									<!-- end card-body-->
								</div>
								<!--end card-->
							</div>
							<!-- end col -->

							<div class="col-sm-4">
								<div class="card tilebox-one">
									<div class="card-body">
										<i class="dripicons-box float-right text-muted"></i>
										<h6 class="text-muted text-uppercase mt-0">기업명</h6>
										<h5 class="m-b-20" style="color: green">
											<span>${postingVO.companyName}</span>
										</h5>
									</div>
									<!-- end card-body-->
								</div>
								<!--end card-->
							</div>
							<!-- end col -->

							<div class="col-sm-4">
								<div class="card tilebox-one">
									<div class="card-body">
										<i class="dripicons-jewel float-right text-muted"></i>
										<h6 class="text-muted text-uppercase mt-0">임금</h6>
										<h5 class="m-b-20" style="color: green">${postingVO.salary}</h5>
									</div>
									<!-- end card-body-->
								</div>
								<!--end card-->
							</div>
							<!-- end col -->

						</div>
						<!-- end row -->


						<div class="card">
							<div class="card-body">
								<h4 class="header-title mb-3">다른 채용공고 보기</h4>

								<div class="table-responsive">
									<table class="table table-hover table-centered mb-0">
										<thead>
											<tr>
												<th>채용직무</th>
												<th>기업명</th>
												<th>기업형태</th>
												<th>임금</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${!empty list}">
												<c:forEach items="${list}" var="list" varStatus="listStat">
													<tr>
														<td><a
															href='/admin/posting/read?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&postingId=${list.postingId}'>
																${list.jobName}</a></td>
														<td>${list.companyName}</td>
														<td>${list.companySize}</td>
														<td>${postingVO.salary}</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
								<!-- end table responsive-->
							</div>
							<!-- end col-->
						</div>
						<!-- end row-->
						</form>
					</div>
					<!-- end col -->

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>



<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		/* 수정버튼 */
		$(".btn-success").on("click", function() {
			formObj.attr("action", "/admin/posting/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		//목록버튼
		$(".btn-light").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/admin/posting/list");
			formObj.submit();
		});
		/* 삭제버튼 */
		$(".btn-danger").on("click", function() {
			if (confirm('이 공고를 삭제하시겠습니까?')) {
				formObj.attr("method", "post");
				formObj.attr("action", "/admin/posting/remove");
				formObj.submit();
			}
		});

	});
</script>
</html>