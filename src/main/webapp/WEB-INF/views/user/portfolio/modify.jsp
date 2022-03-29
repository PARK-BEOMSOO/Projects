<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title> HMIS :: 포트폴리오 기초정보 관리</title>
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
										<li class="breadcrumb-item"><a href="/user/portfolio/list">포트폴리오 기초정보 목록</a></li>
										<li class="breadcrumb-item active">포트폴리오 기초정보 수정</li>
									</ol>
								</div>
								<h4 class="page-title">포트폴리오 기초정보 정보 수정</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<form name="frm" method="post">
										<input type="hidden" name="userNo" id="userNo" value="${pVo.userNo}">

										<div class="form-group mb-3">
											<label for="jobArea" class="col-form-label">희망 근무지</label>
											<input type="text"
												class="form-control" name="jobArea" id="jobArea"
												value="${pVo.jobArea}" onKeyUp="fnChkByte(this,'30')" required>
										</div>
										<div class="form-group mb-3">
											<label for="avgScore" class="col-form-label">평균학점</label>
											<input type="text"
												name="avgScore" id="avgScore" class="form-control"
												value="${pVo.avgScore}" onKeyUp="fnChkByte(this,'5')" required>
										</div>
										<div class="form-group mb-3">
											<label for="phone" class="col-form-label">연락처</label>
											 <input type="text"
												name="phone" id="phone" class="form-control"
												value="${pVo.phone}" onKeyUp="fnChkByte(this,'13')" required>
										</div>

										<div style="text-align: right;">
											<input type="submit" class="btn btn-primary" value="수정" onclick="return searchCheck()">
											<button onclick="location.href='/user/portfolio/list'" type="button" class="btn btn-light" style="font-size: 14px;">목록</button>												
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
 function sendData() {
    var params = $("#frm").serialize();
    
    $.ajax({
       data : params,
       success : function(xh) {
          window.close();
          window.opener.location.reload();
       }
    });
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
	      rbyte += 2; //한글2Byte
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
	  }
	}

	//항목 명 유효성 검사
	function searchCheck() {
		var jobArea = $("#jobArea").val();
		var avgScore = $("#avgScore").val();
		var phone = $("#phone").val();
		
		
		if (jobArea == "") {
			alert("희망근무지역을 입력해주세요");
			document.getElementById("jobArea").focus();
			return false;
		}
		if (avgScore == "") {
			alert("평균학점을 입력해주세요");
			document.getElementById("avgScore").focus();
			return false;
		}
		if (phone == "") {
			alert("연락처를 입력해주세요");
			document.getElementById("phone").focus();
			return false;
		} 
	return true;
	}
</script>
</html>