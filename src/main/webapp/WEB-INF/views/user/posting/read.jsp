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
										<li class="breadcrumb-item"><a href="/user/posting/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">취업공고 목록</a></li>
										<li class="breadcrumb-item active">취업공고 상세보기</li>
									</ol>
								</div>
								<h4 class="page-title">취업공고 상세내용</h4>
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
                                                    <span class="float-left m-2 mr-4"><img src="/resources/dist/assets/images/users/avatar-2.jpg" style="height: 100px;" alt="" class="rounded-circle img-thumbnail"></span>
                                                    <div class="media-body">
<form role="form" name="frm">

<input type="hidden" name="postingId" id="postingId" value="${postingVO.postingId}">
<input type='hidden' name='page' value="${cri.page}">
<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
<input type='hidden' name='searchType' value="${cri.searchType}">
<input type='hidden' name='keyword' value="${cri.keyword}">

                                                        <h4 class="mt-1 mb-1 text-white">${postingVO.companyName}</h4>
                                                        <p class="font-13 text-white-50"> ${postingVO.companySize}</p>

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
                                                    </div> <!-- end media-body-->
                                                </div>
                                            </div> <!-- end col-->


                                        </div> <!-- end row -->

                                    </div> <!-- end card-body/ profile-user-box-->
                                </div><!--end profile/ card -->
                            </div> <!-- end col-->
                        </div>
                        <!-- end row -->


                        <div class="row">
                            <div class="col-md-4">
                                <!-- Personal-Information -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mt-0 mb-3">기업소개</h4>
                                        <p class="text-muted font-13">
                                        	${postingVO.companyOverview}
                                        </p>

                                        <hr/>

                                        <div class="text-left">
                                            <p class="text-muted"><strong>기업명 :</strong> <span class="ml-2">${postingVO.companyName}</span></p>

                                            <p class="text-muted"><strong>기업형태 :</strong><span class="ml-2">${postingVO.companySize}</span></p>

                                            <p class="text-muted"><strong>위치 :</strong> <span class="ml-2">대한민국</span></p>

                                        </div>
                                    </div>
                                </div>
                                <!-- Personal-Information -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mt-0 mb-3">사이트 연결</h4>
                                        <p class="text-muted font-13">
                                        	<a href="https://${postingVO.linkAddress}" target="_blank">${postingVO.linkAddress}</a>
                                        </p>

                                        <hr/>
                                    </div>
                                </div>


                                <!-- Toll free number box-->
                                <div class="card text-white bg-info overflow-hidden">
                                    <div class="card-body">
                                        <div class="toll-free-box text-center">
                                            <h4> <i class="mdi mdi-deskphone"></i> 경영정보학과 연락처 : 042-629-1234</h4>
                                        </div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                                <!-- End Toll free number box-->



                            </div> <!-- end col-->

                            <div class="col-md-8">

                                <!-- Chart-->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mb-3">직무 소개</h4>
                                        <div class="chartjs-chart">
                                            ${postingVO.jobDesc}
                                        </div>        
                                    </div>
                                </div>
                                
                                <!-- Chart-->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mb-3">자격 요건</h4>
                                        <div class="chartjs-chart">
                                            ${postingVO.jobRequirement}
                                        </div>        
                                    </div>
                                </div>
                                <!-- Chart-->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mb-3">우대 사항</h4>
                                        <div class="chartjs-chart">
                                            ${postingVO.content}
                                        </div>        
                                    </div>
                                </div>
                                
                                <!-- End Chart-->

                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="card tilebox-one">
                                            <div class="card-body">
                                                <i class="dripicons-basket float-right text-muted"></i>
                                                <h6 class="text-muted text-uppercase mt-0">기업 형태</h6>
                                                <h5 class="m-b-20" style="color:green">${postingVO.companySize}</h5>
                                            </div> <!-- end card-body-->
                                        </div> <!--end card-->
                                    </div><!-- end col -->

                                    <div class="col-sm-4">
                                        <div class="card tilebox-one">
                                            <div class="card-body">
                                                <i class="dripicons-box float-right text-muted"></i>
                                                <h6 class="text-muted text-uppercase mt-0">기업명</h6>
                                                <h5 class="m-b-20" style="color:green"><span>${postingVO.companyName}</span></h5>
                                            </div> <!-- end card-body-->
                                        </div> <!--end card-->
                                    </div><!-- end col -->

                                    <div class="col-sm-4">
                                        <div class="card tilebox-one">
                                            <div class="card-body">
                                                <i class="dripicons-jewel float-right text-muted"></i>
                                                <h6 class="text-muted text-uppercase mt-0">임금</h6>
                                                <h5 class="m-b-20" style="color:green">${postingVO.salary}</h5>
                                            </div> <!-- end card-body-->
                                        </div> <!--end card-->
                                    </div><!-- end col -->

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
	                                                        <td><a href='/user/posting/read?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&postingId=${list.postingId}'> ${list.jobName}</a></td>
	                                                        <td>${list.companyName}</td>
	                                                        <td>${list.companySize}</td>
	                                                        <td>${postingVO.salary}</td>
	                                                    </tr>
                   									</c:forEach>
												</c:if>    
                                                </tbody>
                                            </table>
                                        </div> <!-- end table responsive-->
                                    </div> <!-- end col-->
                                </div> <!-- end row-->

				
				
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
				formObj.attr("action", "/user/posting/list");
				formObj.submit();
			});
		});

	</script>	


</html>