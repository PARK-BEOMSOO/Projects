<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 인재추천</title>
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


</style>
<body class="loading">
	
	
	<!-- Begin page -->
	<div class="wrapper">

		<div id="vertical-sidebar-placeholder"></div>

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">
			<div id="vertical-topbar-placeholder"></div>
				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
										<li class="breadcrumb-item active">인재추천</li>
									</ol>
								</div>
								<h4 class="page-title">인재추천 목록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body" >
									<h4 class="header-title mb-3 ml-3" style="text-align:left;">취업 공고</h4><hr>

								<form name="frm" role="form">
								<input type='hidden' name='page' value="${cri.page}"> 
								<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
								<input type='hidden' name='searchType' value="${cri.searchType}">
								<input type='hidden' name='keyword' value="${cri.keyword}">							
									
									<div class="row" style="justify-content: center;">
										<div class="form-group mb-3 col-lg-5">
											<label for="inputPassword4" class="col-form-label">기업명</label>
											<input type="text"
												name="compName" id="compName" value=${aVo.compName }  class="form-control" disabled>
										</div>
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">직무명</label>
											<input type="text" name="job" id="job" value=${aVo.job } class="form-control" disabled>
										</div>
									</div>

									<div class="row" style="justify-content: center;">
										<div class="form-group mb-3 col-lg-5">
											<label for="inputPassword4" class="col-form-label">지역</label>
											<input type="text"
												name="compArea" id="compArea" value=${aVo.compArea } class="form-control" disabled>
										</div>
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">마감일</label>
											<input type="text" name="endDate" id="endDate" value=${aVo.endDate } class="form-control" disabled>
										</div>
									</div>
										
									<div class="card-footer" style="text-align: right;">
										<button type="button" class="btn btn-primary" >목록</button>
									</div>
							</form>
								</div>
							</div>
						</div>
					</div>
					
								<!-- Start card2-->
								<div class="row" style="justify-content: center;">
									<div class="col-10">

										<div class="card">

											<div class="card-body">
												<h4 class="header-title mb-3 ml-3" style="text-align:left;">인재추천 목록</h4>

												<div class="table-responsive">
													<table class="table table-centered mb-0">
														<thead class="thead-light">
															<tr>

																<th>순위</th>
																<th>학번</th>
																<th>이름</th>
																<th>추천점수</th>
																<th>진로분야</th>
																<th>연락처</th>
															</tr>

															<c:if test="${!empty list}">
																<tr>
																	<td>$</td>
																	<td>$</td>
																	<td>$</td>
																	<td>$</td>
																	<td>$</td>
																	<td>$</td>
																</tr>
															</c:if>

																<c:if test="${empty list}">
																	<!-- <tr>
																		<td colspan="6">내역이 없습니다.</td>
																	</tr> -->
																<tr>
																	<td>1</td>
																	<td>20152533</td>
																	<td>이태헌</td>
																	<td>90</td>
																	<td>IT 개발</td>
																	<td>-</td>
																</tr>
																<tr>
																	<td>2</td>
																	<td>20172199</td>
																	<td>신동주</td>
																	<td>88</td>
																	<td>IT 개발</td>
																	<td>-</td>
																</tr>
																<tr>
																	<td>3</td>
																	<td>20152500</td>
																	<td>황영상</td>
																	<td>80</td>
																	<td>경영</td>
																	<td>-</td>
																</tr>
																<tr>
																	<td>4</td>
																	<td>20152512</td>
																	<td>양유석</td>
																	<td>79</td>
																	<td>경영기획</td>
																	<td>-</td>
																</tr>
																<tr>
																	<td>5</td>
																	<td>20152527</td>
																	<td>김윤석</td>
																	<td>75</td>
																	<td>행정</td>
																	<td>-</td>
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
						</div>
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

		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->

	<!-- END wrapper -->

	<!-- App js -->
	<script src="/resources/dist/assets/js/app_admin.js"></script>

	<!-- third party js -->
	<script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
	<script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
	<!-- third party js ends -->

	<!-- demo app -->
	<script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
	<!-- end demo js-->

</body>
<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/admin/announcement/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}");
				formObj.submit();
			});

		});
	</script>
</html>