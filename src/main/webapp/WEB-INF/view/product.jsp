<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>



<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script type="text/javascript">
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    })
</script>
<head>
    <title>Sản Phẩm</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<article>
    <div class="container">
        <div class="card text-white bg-success mb-3">
            <img src="/imgBanner/banner4.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h3 class="card-title" style="text-align: center;font-weight: bold">Giới thiệu</h3>
                <p class="card-text">
                    Bia là một thức uống giải khát đích thực có thể được thưởng thức bất cứ lúc nào trong năm. Dù bạn đang muốn thư giãn sau một ngày dài làm việc hay muốn nâng ly chúc mừng những người thân yêu của mình, thì một ly bia có thể thực sự khiến một ngày của bạn trở nên vui vẻ hơn bao giờ hết.

                    Bây giờ bạn đang tự hỏi ở Việt Nam thì đi đâu để mua những loại bia nổi tiếng nhất? Không tìm đâu xa, hãy đến BiaNgon. Bạn sẽ tìm được các thương hiệu bia tốt nhất ở đây. Danh mục sản phẩm đa dạng của chúng tôi đáp ứng được mọi khẩu vị và nhu cầu sử dụng như chai, lon, lốc, két hay thùng. Dù bạn đang tìm về một hương vị cổ điển hay tìm kiếm một hương vị độc đáo, chúng tôi vẫn luôn có sẵn thứ bạn cần.

                    Trước khi tập trung vào tất cả các thương hiệu bia tuyệt vời có sẵn trên BiaNgon, chúng ta hãy dành một chút thời gian để tìm hiểu thêm về bia nói chung nhé!
                </p>
            </div>
        </div>
    </div>
    <center>
        <h3 style="color: #1C1E39; font-weight: bold">Tất cả sản phẩm</h3>
    </center>
    <br>
    <div class="row">
        <div class="col-3">
            <div class="card" style="width: 20rem;">
                <div class="card-header text-white" style="background-color: #157347">
                    Tìm kiếm sản phẩm
                </div>
                <form action="/product/search" modelAttribute="sanpham" method="post">
                    <div class="card-body">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm" aria-describedby="button-addon2"
                                   value="${ten}" name="ten">
                            <button class="btn btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card" style="width: 20rem;">
                <div class="card-header text-white" style="background-color: #157347">
                    Xuất xứ
                </div>
                <form action="/product/searchCountry" modelAttribute="sanpham" method="post">
                <div class="card-body">
                    <c:forEach var="quocgia" items="${listnuocSX}">
                        <div class="form-check">
                            <input type="radio" name="country" value="${quocgia.idNSX}" class="form-check-input">
                            <label class="form-check-label">
                               ${quocgia.tenNSX}
                            </label>
                        </div>
                    </c:forEach>
                    <button class="btn btn btn-outline-success" type="submit" id="button-addon2">Tìm kiếm</button>
                </div>
                </form>
            </div>
            <div class="card" style="width: 20rem;">
                <div class="card-header text-white" style="background-color: #157347">
                    Khoảng giá
                </div>
                <br>
                <form class="row g-3" action="/product/searchPrice" method="post" modelAttribute="sanpham">
                    <div class="col-auto">
                        <input type="number"  class="form-control"  style="width: 100px" min="0" value="${pricemin}" name="min">
                    </div>
                    <div class="col-auto">
                        <input type="number" class="form-control"  style="width: 100px" value="${pricemax}" name="max">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-success mb-3">Tìm</button>
                    </div>
                </form>
            </div>

        </div>
        <div class="col-9">
            <c:forEach var="sp" items="${page.content}">
                <div class="card shadow p-4">
                    <div class="row align-items-center">
                        <aside class="col-md-3">
                            <a href="#">
                                <input type="hidden" id="maSP" value="${sp.idSanPham}">
                                <img src="/imgProduct/${sp.hinhSanPham}" style="width: 200px">
                            </a>
                        </aside> <!-- col.// -->
                        <div class="col-md-6">
                            <div class="info-main">
                                <a href="#" class="h5 title" style="text-decoration: none">${sp.tenSanPham} </a>
                                <div class="d-flex my-3">
                                    <span class="small text-success ms-3">Xuất xứ: ${sp.nuocSX.tenNSX}</span>
                                    <c:choose>
                                        <c:when test="${sp.soLuongSanPham == 0}">
                                            <span class="small text-danger ms-3">Tình trạng: Hết hàng</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="small text-primary ms-3">Tình trạng: Còn hàng</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <p>${sp.mieuTaSanPham}</p>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="d-flex align-items-center">
                <span class="h5 mb-0 text-gray text-through me-2">
                    <fmt:formatNumber value="${sp.giaSanPham}" type="number"/> đ
                </span>
                            </div>
                            <span class="text-success small"><span class="fas fa-shipping-fast me-1"></span>Miễn phí ship toàn nước</span>
                            <div class="d-grid gap-2 mt-4">
                                <a class="btn btn btn-success" href="/product/product-detail/${sp.idSanPham}">
                                    Chi tiết sản phẩm
                                </a>
                                <c:choose>
                                    <c:when test="${sp.soLuongSanPham == 0}">
                                        <a href="/cart/add/${sp.idSanPham}" class="btn btn btn-success disabled"
                                           data-bs-container="body" data-bs-toggle="popover" data-bs-placement="left" data-bs-content="${message}">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                            Thêm vào giỏ hàng
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/cart/add/${sp.idSanPham}" class="btn btn btn-success"
                                           data-bs-container="body" data-bs-toggle="popover" data-bs-placement="left" data-bs-content="${message}">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                            Thêm vào giỏ hàng
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <br>
            <div class="row justify-content-md-center">
                <div class="col-md-auto">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${not empty ten}">
                                    <li class="page-item"><a class="page-link" href="/product/search?p=0" style="color: #157347">Đầu</a></li>
                                    <c:forEach var="index" items="${index}">
                                        <li class="page-item"><a class="page-link" href="/product/search?p=${index}" style="color: #157347">${index+1}</a></li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="/product/search?p=${page.totalPages - 1}" style="color: #157347">Cuối</a></li>
                                </c:when>

                                <c:when test="${not empty country}">
                                    <li class="page-item"><a class="page-link" href="/product/searchCountry?p=0" style="color: #157347">Đầu</a></li>
                                    <c:forEach var="index" items="${index}">
                                        <li class="page-item"><a class="page-link" href="/product/searchCountry?p=${index}" style="color: #157347">${index+1}</a></li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="/product/searchCountry?p=${page.totalPages - 1}" style="color: #157347">Cuối</a></li>
                                </c:when>

                                <c:when test="${not empty pricemin && not empty pricemax }">
                                    <li class="page-item"><a class="page-link" href="/product/searchPrice?p=0" style="color: #157347">Đầu</a></li>
                                    <c:forEach var="index" items="${index}">
                                        <li class="page-item"><a class="page-link" href="/product/searchPrice?p=${index}" style="color: #157347">${index+1}</a></li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="/product/searchPrice?p=${page.totalPages- 1}" style="color: #157347">Cuối</a></li>
                                </c:when>

                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="/product?p=0" style="color: #157347">Đầu</a></li>
                                    <c:forEach var="index" items="${index}">
                                        <li class="page-item"><a class="page-link" href="/product?p=${index}" style="color: #157347">${index+1}</a></li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="/product?p=${page.totalPages - 1}" style="color: #157347">Cuối</a></li>
                                </c:otherwise>
                            </c:choose>

                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>


</article>
<br>
<!-- Footer -->
<jsp:include page="footer.jsp"/>
<!-- Footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>

</body>
</html>
