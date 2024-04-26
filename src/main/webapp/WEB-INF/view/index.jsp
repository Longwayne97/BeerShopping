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
    <jsp:include page="header.jsp"/>
    <br>
    <article>
        <div class="container">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <a href="/product" class="btn btn-outline-success border-0" style="width: 400px;height: 100px;">
                            <i class="fa-solid fa-star"></i><br><br>
                            <h5><s:message code="lo.mn.star"/></h5>
                        </a>
                    </div>
                    <div class="col">
                        <a href="/product" class="btn btn-outline-success border-0" style="width: 400px;height: 100px;">
                            <i class="fa-solid fa-clock"></i><br><br>
                            <h5><s:message code="lo.mn.ship"/></h5>
                        </a >
                    </div>
                    <div class="col">
                        <a href="/product" class="btn btn-outline-success border-0" style="width: 400px;height: 100px;">
                            <i class="fa-solid fa-credit-card"></i><br><br>
                            <h5><s:message code="lo.mn.payment"/></h5>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <br>
            <h3 style="color: #1C1E39; font-weight: bold;text-align: center" ><s:message code="lo.mn.buybeer"/></h3>
        <br>
            <div class="container">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <c:forEach var="sp" items="${page.content}">
                    <div class="col">
                        <div class="card h-100 border-success">
                            <center>
                                <img src="/imgProduct/${sp.hinhSanPham}" class="card-img-top" alt="..." style="width: 300px;height: 200px"/>
                            </center>
                            <div class="card-body">
                                <p class="card-text" style="font-weight: bold">${sp.tenSanPham}</p>
                                <p class="card-text" style="font-weight: bold">Xuất xứ: ${sp.nuocSX.tenNSX}</p>
                                <c:choose>
                                    <c:when test="${sp.soLuongSanPham == 0}">
                                        <span class="small text-danger ms-3">Tình trạng: Hết hàng</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="small text-primary ms-3">Tình trạng: Còn hàng</span>
                                    </c:otherwise>
                                </c:choose>
                                <p class="card-text" style="text-align: right;color: #157347;font-weight: bold;font-size: large">
                                    <fmt:formatNumber value="${sp.giaSanPham}" type="number"/> đ
                                </p>
                                <center>
                                    <a href="/product/product-detail/${sp.idSanPham}" class="btn btn-success"><s:message code="lo.mn.detail"/></a>
                                    <c:choose>
                                        <c:when test="${sp.soLuongSanPham == 0}">
                                            <a href="/cart/add/${sp.idSanPham}" class="btn btn-success disabled"><s:message code="lo.mn.addCart"/></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/cart/add/${sp.idSanPham}" class="btn btn-success"><s:message code="lo.mn.addCart"/></a>
                                        </c:otherwise>
                                    </c:choose>
                                </center>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <br>
                <br>
                <div class="row justify-content-end">
                    <div class="col-4" >
                        <nav aria-label="Page navigation example" style="margin-left: 200px;">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${page.number == 0}">
                                        <li class="page-item">
                                            <a class="page-link disabled" href="/index?p=${page.number-1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="/index?p=${page.number-1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="index" items="${index}">
                                    <li class="page-item"><a class="page-link" href="/index?p=${index}">${index+1}</a></li>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${page.number == page.totalPages - 1}">
                                        <li class="page-item">
                                            <a class="page-link disabled" href="/index?p=${page.number+1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="/index?p=${page.number+1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <br>
            <div class="container">
                    <div class="row">
                        <div class="col">
                            <img src="/imgBanner/hb_img1.png" style="width: 415px;height: 400px;"/>
                        </div>
                        <div class="col">
                            <img src="/imgBanner/hb_img2.webp" style="width: 415px;height: 400px;"/>
                        </div>
                        <div class="col">
                            <img src="/imgBanner/hb_img3.webp" style="width: 415px;height: 400px;"/>
                        </div>
                    </div>
            </div>
            <br>
    </article>
    <br>
    <jsp:include page="footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>
</body>
</html>
