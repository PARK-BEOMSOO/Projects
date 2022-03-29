<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>HMIS :: Q&A 등록</title>
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

				<form role="form" class="form-horizontal" method="post">
					<input type="hidden" id="arrayUser" name="arrayUser" />
            <!-- Start Content-->
            <div class="container-fluid">
               <!-- start page title -->
               <div class="row" style="justify-content: center;">
                  <div class="col-12">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a href="/user/main">HMIS</a></li>
                              <li class="breadcrumb-item"><a href="/user/QnA/list">Q&A</a></li>
                              <li class="breadcrumb-item active">Q&A 등록</li>
                           </ol>
                        </div>
                        <h4 class="page-title">Q&A 등록</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row" style="justify-content: center;">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-body">

                           <!-- <form role="form"  action="register" method="post"
                              onsubmit="return validate();"> -->
                               <form role="form" name="frm" class="form-horizontal" method="post">
                            
                               <input type="hidden" name="userNo" id="userNo" value="${login.userNo}">


                              <div class="form-group mb-3">
                                 <label for="qnaTitle">제목 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" name="qnaTitle"
                                    id="qnaTitle" placeholder="제목을 입력하세요." />

                              </div>
                              <div class="form-group mb-3">
                                 <label for="userName">작성자 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" name="userName"
                                    id="userName" value="${login.userName}" readonly="readonly" />
                              </div>
                              
                              
                               <div class="form-group mb-3">
                                    <label for="inputPassword4" class="col-form-label">작성일</label>
                                    <input type="text" name="regDate" id="regDate"
                                       class="form-control" data-toggle="date-picker"
                                       data-single-date-picker="true" disabled="disabled">
                                 </div>
                              
                              
                              <div class="form-group mb-3">
                                 <label for="inputAddress2" class="col-form-label">내용</label>
                                 <textarea class="form-control"
                                    name="qnaContents" id="qnaContents" rows="15"></textarea>
                              </div>


                              



                              <div style="text-align: right;">
                                 <button type="submit" class="btn btn-primary" id="btn_submit">등록</button>
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
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#btn_submit").on("click", function() {

				var fcomName = $("#fcomName").val();
				var comType = $("#comType").val();
				var ceo = $("#ceo").val();

				if (fcomName == "") {
					alert("기업명을 입력해주세요.");
					document.getElementById("fcomName").focus();
					return false;
				}
				if (comType == "") {
					alert("회사 분야를 입력해주세요.");
					document.getElementById("comType").focus();
					return false;
				}
				if (ceo == "") {
					alert("대표자명을 입력해주세요.");
					document.getElementById("ceo").focus();
					return false;
				}

				formObj.submit();
			});
		});
	</script>



	<script
		src="../../../../resources/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>
</body>




</html>