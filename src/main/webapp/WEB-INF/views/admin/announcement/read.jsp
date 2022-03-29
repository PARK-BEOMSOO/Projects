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
									<li class="breadcrumb-item active">취업공고 상세내용</li>
								</ol>
							</div>
							<h4 class="page-title">취업공고 상세내용</h4>
						</div>
					</div>
				</div>
				<!-- end page title -->

						<div class="row">
						<div class="col-12">
						<div class="card">
							<div class="card-body">

								<form role="form" name="frm">
									<input type="hidden" name="annNo" id="annNo" value="${aVo.annNo}">
									<input type='hidden' name='page' value="${cri.page}">
									<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
									<input type='hidden' name='searchType' value="${cri.searchType}">
									<input type='hidden' name='keyword' value="${cri.keyword}">
									

									<div class="form-group mb-3">
										<label for="inputEmail4" class="col-form-label">제목</label> <input
											type="text" name="title" id="title" class="form-control"
											value="${aVo.title}" disabled>
									</div>
									<div class="form-group mb-3">
										<label for="inputPassword4" class="col-form-label">회사명</label>
										<input type="text" name="compName" id="compName"
											class="form-control" value="${aVo.compName}" disabled>
									</div>

									<div class="form-group mb-3">
										<label for="inputEmail4" class="col-form-label">직무명</label> <input
											type="text" name="job" id="job" class="form-control"
											value="${aVo.job}" disabled>
									</div>


									<div class="form-group mb-3">
										<label for="inputCity" class="col-form-label">지역</label> <input
											type="text" name="compArea" id="compArea"
											class="form-control" value="${aVo.compArea}" disabled>
									</div>

									<div class="form-group mb-3">
										<label for="inputPassword4" class="col-form-label">취업공고상세</label>
										<textarea class="form-control" name="content" id="content"
											rows="10" disabled>${aVo.content}</textarea>
									</div>

									<div class="row">
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">마감일</label> <input
												type="date" name="endDate" id="endDate" class="form-control"
												value="${aVo.endDate}" disabled>
										</div>
									</div>

									<div class="row">
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">작성자</label> <input
												type="text" name="regName" id="regName" class="form-control"
												value="${aVo.regName}" disabled>
										</div>
										<div class="form-group mb-3 col-lg-5">
											<label for="inputCity" class="col-form-label">작성일자</label> <input
												type="text" name="regDate" id="regDate" class="form-control"
												value="${aVo.regDate}" disabled>
										</div>
									</div>

										<div style="text-align: right;">

											<button type="button" class="btn btn-success" style="font-size: 14px;">수정</button>
											<button type="button" class="btn btn-light" style="font-size: 14px;">목록</button>
											<button class="btn btn-danger" type="submit">삭제</button>
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
				formObj.attr("action", "/admin/announcement/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});
			//목록버튼
			$(".btn-light").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/admin/announcement/list");
				formObj.submit();
			});
		      /* 삭제버튼 */
		      $(".btn-danger").on("click", function() {
		    	  if(confirm('이 공고를 삭제하시겠습니까?')){
		    		 formObj.attr("method", "post");
			         formObj.attr("action", "/admin/announcement/remove");
			         formObj.submit();
		    	  }
		      });
			
			
		});

	</script>	
</html>