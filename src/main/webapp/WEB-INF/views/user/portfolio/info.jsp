<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title> HMIS :: e-포트폴리오</title>
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
	<form name="frm" method="get" role="form">
		<input type="hidden" name="userNo" id="userNo" value="${login.userNo}">
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
									<div style="float:right" class="mb-3">
										<button type="button" class="btn btn-primary" onclick="window.print()" value="PDF저장">PDF저장</button>
									</div>
									
										<ol class="breadcrumb m-0">
											<li class="breadcrumb-item active">e-Portfolio&nbsp;&nbsp;</li>
										</ol>
									</div>
									<h4 class="page-title">e-Portfolio</h4>
									
								</div>
							</div>
						</div>
						<!-- end page title -->

						<div class="row">
							<div class="col-12">
								<div class="card widget-inline">
									<div class="card-body p-0">
										<div class="row no-gutters">
											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0">
													<div class="card-body text-center">
														<i class="dripicons-user-group text-muted"
															style="font-size: 24px;"></i>
														<h3>
															<span><a href="#">${login.userName }</a></span>
														</h3>
														<p class="text-muted font-15 mb-0">학생</p>
													</div>
												</div>
											</div>

											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-earth" style="font-size: 24px;"></i>
														<h3>
															<span><a href="#">${pVo.jobArea}</a></span>
														</h3>
														<p class="text-muted font-15 mb-0">희망 근무지</p>
													</div>
												</div>
											</div>


											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-calendar-text-outline"
															style="font-size: 24px;"></i>
														<h3>
															<span><a href="#">${pVo.avgScore}
																	/ 4.5</a></span>
														</h3>
														<p class="text-muted font-15 mb-0">평균 학점</p>
													</div>
												</div>
											</div>

											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-phone-classic" style="font-size: 24px;"></i>
														<h3>
															<span><a href="#">${pVo.phone}
																	</a></span>
														</h3>
														<p class="text-muted font-15 mb-0">연락처</p>
													</div>
												</div>
											</div>


										</div>
										<!-- end row -->

									</div>
								</div>
								<!-- end card-box-->
							</div>
							<!-- end col-->
						</div>
						<!-- end row -->

						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<h4 class="header-title mb-3">취득 자격증 내역</h4>
										<div class="table-responsive">
											<table class="table table-centered mb-0">
												<thead class="thead-light">
													<tr>
														<th>NO</th>
                                                        <th>항목명</th>
                                                        <th>일련번호</th>
                                                        <th>취득일자</th>
                                                        <th>점수</th>
                                                        <th>발행처</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${!empty licenseList}">
														<c:forEach items="${licenseList}" var="lVo"
															varStatus="listStat">
															<tr>
																<td>${listStat.count}</td>
																<td>${lVo.subName}</td>
																<td>${lVo.serialNum}</td>
																<td>${lVo.acDate}</td>
	                                                    	<td>${lVo.score}</td>
	                                                    	<td>${lVo.publication}</td>	
																
															</tr>
														</c:forEach>
													</c:if>

													<c:if test="${empty licenseList}">
														<tr>
															<td colspan="6">내역이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<!-- end card-body-->
								</div>

								<div class="card">
									<div class="card-body">
										<h4 class="header-title mb-3">외국어 능력 내역</h4>
										<div class="table-responsive">
											<table class="table table-centered mb-0">
												<thead class="thead-light">
													<tr>
														<th>NO</th>
														<th>항목명</th>
                                                        <th>일련번호</th>
                                                        <th>취득일자</th>
                                                        <th>점수</th>
                                                        <th>발행처</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${!empty languageList}">
														<c:forEach items="${languageList}" var="lVo"
															varStatus="listStat">
															<tr>
																<td>${listStat.count}</td>
	                                       		             	<td>${lVo.subName}</td>
	                                       		             	<td>${lVo.serialNum}</td>
	                                         		           	<td>${lVo.acDate}</td>
	                                           		         	<td>${lVo.score}</td>
	                                                    		<td>${lVo.publication}</td>	
															</tr>
														</c:forEach>
													</c:if>

													<c:if test="${empty languageList}">
														<tr>
															<td colspan="6">내역이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<!-- end card-body-->
								</div>

								<div class="card">
									<div class="card-body">
										<h4 class="header-title mb-3">보유기술 내역</h4>
										<div class="button-list">
										<div class="table-responsive">
											<table class="table table-centered mb-0">
												<tbody>
													<c:if test="${!empty SkillList}">
														<tr>
															<c:forEach items="${SkillList}" var="sVo"
																varStatus="listStat">
																<button type="button" class="btn btn-light" disabled>${sVo.skillName}</button>  
															</c:forEach>
														</tr>
													</c:if>

													<c:if test="${empty SkillList}">
														<tr>
															<td colspan="6">내역이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
										</div>
									</div>
									<!-- end card-body-->
								</div>

								<div class="card">
									<div class="card-body">
										<h4 class="header-title mb-3">전공 수강 내역</h4>
										<div class="table-responsive">
											<table class="table table-centered mb-0">
												<thead class="thead-light">
													<tr>
														<th>NO</th>
														<th>학수번호</th>
														<th>전공수업명</th>
														<th>교수명</th>
														<th>학점</th>
														<th>트랙코드</th>
														
														
													</tr>
												</thead>
												<tbody>
													<c:if test="${!empty majorList}">
														<c:forEach items="${majorList}" var="mVo"
															varStatus="listStat">
															<tr>
																<td>${listStat.count}</td>
																<td>${mVo.courseNo}</td>
																<td>${mVo.majorName}</td>
																<td>${mVo.profName}</td>
																<td>${mVo.grade}</td>
																<td>${mVo.trackCode}</td>
															</tr>
														</c:forEach>
													</c:if>

													<c:if test="${empty majorList}">
														<tr>
															<td colspan="6">내역이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<!-- end card-body-->
								</div>
								
								<div class="card">
									<div class="card-body">
										<h4 class="header-title mb-3">학과 프로그램 참여 내역</h4>
										<div class="table-responsive">
											<table class="table table-centered mb-0">
												<thead class="thead-light">
                                    <tr>
                                       <th>NO</th>
                                       <th>프로그램명</th>
                                       <th>유형</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:if test="${!empty programList}">
                                       <c:forEach items="${programList}" var="vo"
                                          varStatus="status">
                                          <tr>
                                             <td>${status.count}</td>
                                             <td>${vo.proName}</td>
                                             <td>${vo.type}</td>
                                          </tr>
                                       </c:forEach>
                                    </c:if>
                                    <c:if test="${empty programList}">
                                       <tr>
                                          <td colspan="3">내역이 없습니다.</td>
                                       </tr>
                                    </c:if>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                        </div>
								

								<div class="card">
									<div class="card-body">
										<h4 class="header-title mb-3">비교과 프로그램 참여 내역</h4>
										<div class="table-responsive">
											<table class="table table-centered mb-0">
												<thead class="thead-light">
													<tr>
														<th>NO</th>
														<th>비교과명</th>
														<th>교육내용</th>
														<th>일시</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${!empty nonsubList}">
														<c:forEach items="${nonsubList}" var="nVo"
															varStatus="listStat">
															<tr>
																<td>${listStat.count}</td>
																<td>${nVo.nonsubName}</td>
																<td>${nVo.content}</td>
																<td><fmt:formatDate pattern="yyyy-MM-dd"
																		value="${nVo.finishDate}" /></td>
															</tr>
														</c:forEach>
													</c:if>

													<c:if test="${empty nonsubList}">
														<tr>
															<td colspan="4">내역이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<!-- end card-body-->
								</div>

								<div class="card">
									<div class="card-body">
										<h4 class="header-title mb-3">진로 분야 내역</h4>
										<div class="button-list">
										<div class="table-responsive">
											<table class="table table-centered mb-0">
												<tbody>
													<c:if test="${!empty carrierList}">
														<tr>
															<c:forEach items="${carrierList}" var="cVo"
																varStatus="listStat">
																<button type="button" class="btn btn-light" disabled>${cVo.carName}</button>
															</c:forEach>
														</tr>
													</c:if>

													<c:if test="${empty carrierList}">
														<tr>
															<td colspan="1">내역이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
										</div>
									</div>
									<!-- end card-body-->
								</div>


							</div>
							<!-- end col-12 -->
						</div>


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

	</form>
</body>
</html>