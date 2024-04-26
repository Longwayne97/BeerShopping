<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
    .center {

        /*  top: 0;
          bottom: 0; */
        left: 0;
        right: 0;
        margin: auto;
    }
</style>
<head>
    <title>Trang chủ</title>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg" style="background-color: #157347;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/index">
                <img src="/logo/logoBia.png" class="d-inline-block align-text-top" width="100px"/>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/product" style="color: white; font-weight: bold"><s:message code="lo.mn.product"/></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; font-weight: bold">
                            <s:message code="lo.mn.brand"/>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink" style="background-color: #157347;">
                            <li><a class="dropdown-item" href="#" style="color: white; font-weight: bold">SAIGON</a></li>
                            <hr>
                            <li><a class="dropdown-item" href="#" style="color: white; font-weight: bold">TIGER</a></li>
                            <hr>
                            <li><a class="dropdown-item" href="#" style="color: white; font-weight: bold">HEINEIKEN</a></li>
                            <hr>
                            <li><a class="dropdown-item" href="#" style="color: white; font-weight: bold">BUDWEISER</a></li>
                            <hr>
                            <li><a class="dropdown-item" href="#" style="color: white; font-weight: bold">CORONA</a></li>
                        </ul>
                    </li>
                    <c:choose>
                        <c:when test="${not empty sessionScope.logInTK && sessionScope.logInTK.roleKhachHang == true}">
                            <li class="nav-item">
                                <a class="nav-link" href="/info" style="color: white; font-weight: bold">${sessionScope.logInTK.hotenTK} (ADMIN)</a>
                            </li>
                        </c:when>
                        <c:when test="${not empty sessionScope.logInTK && sessionScope.logInTK.roleKhachHang == false}">
                            <li class="nav-item">
                                <a class="nav-link" href="/info" style="color: white; font-weight: bold">${sessionScope.logInTK.hotenTK}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="/login" style="color: white; font-weight: bold"><s:message code="lo.mn.account"/></a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty sessionScope.logInTK}">
                            <li class="nav-item">
                                <a class="nav-link" href="/login" style="color: white; font-weight: bold">ĐĂNG XUẤT</a>
                            </li>
                        </c:when>
                    </c:choose>
                </ul>
                <form class="d-flex">
                    <a  href="/cart" class="btn btn-primary position-relative" style="margin-right: 50px; width: 50px">
                        <i class="fa-solid fa-cart-shopping"></i>
                    </a>
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <s:message code="lo.mn.language"/>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="?lang=vi">Vietnamese</a></li>
                            <li><a class="dropdown-item" href="?lang=eng">English</a></li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </nav>
</header>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/carousel/banner1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/carousel/banner2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/carousel/banner3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>
</body>
</html>