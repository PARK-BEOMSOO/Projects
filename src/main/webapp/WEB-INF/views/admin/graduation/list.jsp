<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 학과 졸업심사 목록</title>
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

tr, td {
   text-align: center;
   font-family: "맑은고딕";
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

<!-- javaScript -->
<script type="text/javascript">
   function graduationRegister() {
      location.href = "/admin/graduation/register";
   }
</script>


<script type="text/javascript">
   function postRemove() {

      var formObject = document.contents;

      formObject.method = 'post';
   }
</script>
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

            <!-- Start Content-->
            <div class="container-fluid">

               <!-- start page title -->
               <div class="row">
                  <div class="col-12">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
                              <li class="breadcrumb-item active">학과 졸업심사</li>
                           </ol>
                        </div>
                        <h4 class="page-title">학과 졸업심사 목록</h4>
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
                                    <div class="form-group mx-sm-3 mb-2">
                                       <select class="custom-select" id="status-select"
                                          name="searchType">
                                         
                                          <option value="t"
                                             <c:out value="${cri.searchType eq 'title'?'selected':''}"/>>제목</option>
                                         
                                          <%-- <option value="nn" <c:out value="${cri.searchType eq 'nn'?'selected':''}"/>>학번 또는 이름</option> --%>
                                       </select>
                                    </div>
                                    <div class="form-group mb-2">
                                       <label for="inputPassword2" class="sr-only">Search</label>
                                       <input type="text" name="keyword" class="form-control"
                                          id="keywordInput" placeholder="키워드를 입력해주세요.">&nbsp;&nbsp;
                                       <input type="button" class="form-control btn-primary"
                                          id="searchBtn" value="검색">
                                    </div>
                                 </form>
                              </div>
                              <!-- end col-->
                           </div>

                           <form id="form" method="post">
                              <div class="table-responsive">
                                 <table class="table table-centered mb-0">
                                    <thead class="thead-light">
                                       <tr>
                                          <th>NO</th>
                                          <th>제목</th>
                                          <th>신청기간</th>
                                          <th>마감 상태</th>
                                          <th>신청자 목록</th>
                                          <th>관리</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:if test="${!empty listSearch}">
                                          <c:forEach items="${listSearch}" var="Vo"
                                             varStatus="graduaion">

											<c:if test="${Vo.underline == 1}">
                                             <tr style='background-color: rgba(248, 249, 252); font-weight:bold;'>
                                            </c:if>
                                            <c:if test="${Vo.underline == 0}">
                                             <tr>
                                            </c:if>
                                                <c:if test="${pageMaker.cri.page==1}">
                                                   <td>${graduaion.count}</td>
                                                </c:if>
                                                <c:if test="${pageMaker.cri.page!=1}">
                                                   <td>${graduaion.count + ((pageMaker.cri.page-1)*10)}</td>
                                                </c:if>

                                                <td>${Vo.title}</td>

                                                <td style="text-align: center;"><fmt:formatDate
                                                      pattern="yyyy-MM-dd" value="${Vo.appStart}" /> ~ <fmt:formatDate
                                                      pattern="yyyy-MM-dd" value="${Vo.appEnd}" /></td>


                                                <td>${Vo.graduState}</td>

                                                <td><a class="action-icon" 
                                                   href="/admin/graduation/testlist${pageMaker.makeSearch(pageMaker.cri.page)}&graduNo=${Vo.graduNo}">
                                                      <i class="mdi mdi-square-edit-outline" style="font-size: 13px;"></i>
                                                </a></td>

                                                <td><a class="action-icon"
                                                   href="/admin/graduation/modify${pageMaker.makeSearch(pageMaker.cri.page)}&graduNo=${Vo.graduNo}">
                                                      <i class="mdi mdi-square-edit-outline"></i>
                                                </a></td>
                                             </tr>
                                           
                                           
                                          </c:forEach>
                                       </c:if>

                                       <c:if test="${empty listSearch}">
                                          <tr>
                                             <td colspan="6">내역이 없습니다.</td>
                                          </tr>
                                       </c:if>
                                    </tbody>
                                 </table>
                              </div>

                              <!-- end card-body-->

                              <!-- start card footer -->
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
                              <div style="text-align: right;">
                                 <button type="button" class="btn btn-primary mb-2"
                                    onclick="graduationRegister()">졸업심사 글 등록</button>
                              </div>
                           </form>
                        </div>
                     </div>

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


      <script>
      $(document).ready(
            function() {

               $('#searchBtn').on(
                     "click",
                     function(event) {

                        self.location = "/admin/graduation/list"
                              + '${pageMaker.makeQuery(1)}'
                              + "&searchType="
                              + $("select option:selected").val()
                              + "&keyword="
                              + $('#keywordInput').val();

                     });

            });
   </script>
   <script>
      var result = '${msg}';

      if (result == 'SUCCESS') {
         alert("제목: ${vo.title}  \n등록되었습니다.");
      }

      if (result == 'MODIFY') {
         alert("제목: ${vo.title} \n수정되었습니다.");

      }
   </script>

</body>
</html>