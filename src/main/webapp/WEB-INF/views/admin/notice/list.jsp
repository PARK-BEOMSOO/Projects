<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>HMIS :: 공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="../../../../resources/dist/assets/images/favicon.ico">




<!-- inline style to handle loading of various element-->
<style>
body.loading {
	visibility: hidden;
}
</style>
<!-- App css -->
<link href="../../../../resources/dist/assets/css/icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="../../../../resources/dist/assets/css/app.min.css"
	rel="stylesheet" type="text/css" id="main-style-container" />

</head>
<%-- style="border-top: solid 1px rgba(200,200,200,1); " --%>
<%-- style="border-bottom: solid 1px rgba(200,200,200,1);" --%>

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
										<li class="breadcrumb-item active">공지사항 목록</li>
									</ol>
								</div>
								<h4 class="page-title">공지사항</h4>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body" style="padding-bottom: 0">
									<div class="row mb-2">
										<div class="col-lg-8">
											<form class="form-inline">

												<div class="form-group mx-sm-3 mb-2">
													<select class="custom-select" id="status-select"
														name="searchType">
														<option value="nn"
															<c:out value="${cri.searchType == 'nn'?'selected':''}"/>>
															전체</option>
														<option value="t"
															<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
															제목</option>
														<option value="c"
															<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
															내용</option>
														<%-- <option value="a"
                                             <c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
                                             연도</option> --%>
													</select>
												</div>

												<div class="form-group mb-2">
													<label for="inputPassword2" class="sr-only">Search</label>
													<input type="text" name="keyword" class="form-control" value="${cri.keyword}"
														id="keywordInput" placeholder="키워드를 입력해주세요.">&nbsp;&nbsp;
													<input type="button" class="form-control btn-primary"
														id="searchBtn" value="검색">
												</div>
											</form>
										</div>
										<!-- end col-->
									</div>
									<div class="table-responsive">

										<table class="table table-centered mb-0"
											style="text-align: center;">
											<thead class="thead-light">
												<tr>
													<th>NO</th>
													<th colspan="3">제목</th>
													<th>작성일자</th>
													<th>작성자</th>
												</tr>
											</thead>
											<tbody>

												<c:if test="${!empty list}">
													<c:forEach items="${list}" var="nVo"
														varStatus="status">
														<tr>
															<c:if test="${pageMaker.cri.page==1}">
																<td>${status.count}</td>
															</c:if>
															<c:if test="${pageMaker.cri.page!=1}">
																<td>${status.count + ((pageMaker.cri.page-1)*10)}</td>
															</c:if>

															<td colspan="3"><a
																href='read${pageMaker.makeSearch(pageMaker.cri.page)}&noticeNo=${nVo.noticeNo}'>
																	${nVo.title}</a></td>
															


															<td><fmt:formatDate pattern="yyyy-MM-dd"
																	value="${nVo.regDate}" /></td>
															<td>${nVo.register}</td>

														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${empty list}">
													<tr>
														<td colspan="6">내역이 없습니다.</td>
													</tr>
												</c:if>

											</tbody>
										</table>
									</div>
								</div>


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
									<div style="text-align: right;">
										<button type="button" onclick="location.href='register'"
											class="btn btn-primary">등록</button>
									</div>

								</div>
								<!-- end card footer -->
							</div>
						</div>

						<!-- end col-12 -->
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


			<!-- ============================================================== -->
			<!-- End Page content -->
			<!-- ============================================================== -->


		</div>
	</div>
	<!-- END wrapper -->


	<!-- App js -->
	<script src="../../../../resources/dist/assets/js/app_admin.js"></script>

	<!-- third party js -->
	<script
		src="../../../../resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
	<script
		src="../../../../resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
	<!-- third party js ends -->

	<!-- demo app -->
	<script
		src="../../../../resources/dist/assets/js/pages/demo.calendar.js"></script>
	<!-- end demo js-->



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
			$("#detached-check input:radio").click(function() {

				alert("clicked");
			});

			$("input:radio:first").prop("checked", true).trigger("click");

		});
	</script>

	<script>
		$(document).ready(function() {
			$("#detached-check input:radio").click(function() {

				alert("clicked");
			});

			$("input:radio:first").prop("checked", true).trigger("click");

		});
	</script>

	<script>
		var result = '${msg}';

		if (result == 'register') {
			alert(" 등록되었습니다.");
		}

		if (result == 'MODIFY') {
			alert("수정되었습니다.");

		}
	</script>

</body>
</html>