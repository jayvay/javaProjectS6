<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
  <div class="sb-sidenav-menu">
    <div class="nav">
      <div class="sb-sidenav-menu-heading">Core</div>
      <a class="nav-link" href="${ctp}/admin/admin">
        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>관리자 메뉴
      </a>
      <div class="sb-sidenav-menu-heading">Interface</div>
      <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
        상품관리
        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
      </a>
      <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
        <nav class="sb-sidenav-menu-nested nav">
          <a class="nav-link" href="${ctp}/adminStore/storeCategory">카테고리관리</a>
          <a class="nav-link" href="${ctp}/adminStore/storeProductInput">상품등록관리</a>
          <a class="nav-link" href="${ctp}/adminStore/storeProductOptionInput">옵션등록관리</a>
          <a class="nav-link" href="${ctp}/adminStore/storeProductList">상품조회</a>
        </nav>
      </div>
      <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
        Pages
        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
      </a>
      <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
            Authentication
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="${ctp}/admin/login2">Login</a>
              <a class="nav-link" href="${ctp}/admin/register2">Register</a>
              <a class="nav-link" href="${ctp}/admin/password2">Forgot Password</a>
            </nav>
          </div>
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
            Error
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="${ctp}/admin/401">401 Page</a>
              <a class="nav-link" href="${ctp}/admin/404">404 Page</a>
              <a class="nav-link" href="${ctp}/admin/500">500 Page</a>
            </nav>
          </div>
        </nav>
      </div>
      <div class="sb-sidenav-menu-heading">Addons</div>
      <a class="nav-link" href="${ctp}/admin/charts">
        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
        Charts
      </a>
      <a class="nav-link" href="${ctp}/admin/tables">
        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
        Tables
      </a>
    </div>
  </div>
  <div class="sb-sidenav-footer">
    <div class="small">Logged in as:</div>
    Start Bootstrap
  </div>
</nav>
	    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${ctp}/js/scripts.js"></script>
<script src="${ctp}/js/datatables-simple-demo.js"></script>

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  