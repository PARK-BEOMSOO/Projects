<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 학생 e-포트폴리오</title>
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
										<li class="breadcrumb-item active">학생 e-포트폴리오</li>
									</ol>
								</div>
								<h4 class="page-title">학생 e-포트폴리오 목록</h4>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
										<div class="row mb-2">
										<div class="col-lg-8">
											<form class="form-inline">
												<div class="form-group mx-sm-3 mb-2">
													<select class="custom-select" id="status-select"
														name="searchType">
														<option value="all"
															<c:out value="${cri.searchType eq 'nn'?'selected':''}"/>>전체</option>
														<option value="no"
															<c:out value="${cri.searchType eq 'no'?'selected':''}"/>>학번</option>
														<option value="nn"
															<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>이름</option>
														<option value="g"
															<c:out value="${cri.searchType eq 'sub'?'selected':''}"/>>학년</option>
														<option value="s"
															<c:out value="${cri.searchType eq 'sub'?'selected':''}"/>>재학상태</option>																		
													</select>
												</div>
												<div class="form-group mb-2">
													<label for="inputPassword2" class="sr-only">Search</label>
													<input type="text" name="keyword" class="form-control" value="${cri.keyword}" id="keywordInput" placeholder="키워드를 입력해주세요.">&nbsp;&nbsp;
													<input type="button" class="form-control btn-primary" id="searchBtn" value="검색">
												</div>
											</form>
										</div>
										<!-- end col-->
									</div>
									
									<div class="table-responsive">
										<table class="table table-centered mb-0">
											<thead class="thead-light">
												<tr>
													<th>NO</th>
													<th>재학상태</th>
													<th>이름</th>
													<th>학번</th>
													<th>학년</th>
													<th>전화번호</th>

												</tr>
											</thead>
											<tbody>
												<c:if test="${!empty list}">
													<c:forEach items="${list}" var="list" varStatus="listStat">
														<tr>
														<c:if test="${pageMaker.cri.page == 1 }">
															<td>${listStat.count }</td>
														</c:if>
														<c:if test="${pageMaker.cri.page != 1 }">
															<td>${listStat.count + ((pageMaker.cri.page-1)*10) }</td>
														</c:if>															
															<td>${list.state}</td>
															<td><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&userNo=${list.userNo}&userName=${list.userName}">${list.userName}</a></td>
															<td>${list.userNo}</td>
															<td>${list.grade}</td>
															<td>${list.phone}</td>
														</tr>
													</c:forEach>
												</c:if>

												<c:if test="${empty list}">
													<tr>
														<td colspan="7">내역이 없습니다.</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
								<!-- end card-body-->
								<div class="card-footer">
									<nav>
										<ul class="pagination justify-content-center">
											<c:if test="${pageMaker.prev}">
												<li class="page-item"><a class="page-link"
													aria-label="Previous"
													href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }"><span
														aria-hidden="true">«</span> <span class="sr-only">Previous</span></a></li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }" var="idx">
												<li
													class="page-item <c:out value="${pageMaker.cri.page == idx? 'class= active':''}"/>">
													<a class="page-link"
													href="list${pageMaker.makeSearch(idx)}">${idx}</a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
												<li><a class="page-link"
													href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
														aria-hidden="true">»</span> <span class="sr-only">Next</span></a></li>
											</c:if>
										</ul>
									</nav>
								</div>
								<!-- end card footer -->								
							</div>
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
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
</html>