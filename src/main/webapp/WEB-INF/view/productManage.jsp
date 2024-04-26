<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


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
    <title>Thêm sản phẩm bia</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<article>
    <div class="card center" style="width: 30rem;">
        <h5 class="card-header" style="background-color: #157347; text-align: center;color: white;font-weight: bold">
            Quản lý sản phẩm
        </h5>
        <div class="card-body">
            <form:form action="/product/admin/productManage" modelAttribute="sanpham" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <form:hidden  path="idSanPham" cssClass="form-control" value=""/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Tên sản phẩm bia
                    </label>
                    <form:input  path="tenSanPham" cssClass="form-control"/>
                    <form:errors path="tenSanPham" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Giá sản phẩm bia
                    </label>
                    <form:input type="number" path="giaSanPham" cssClass="form-control"/>
                    <form:errors path="giaSanPham" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Số lượng sản phẩm bia
                    </label>
                    <form:input type="number" path="soLuongSanPham" cssClass="form-control"/>
                    <form:errors path="soLuongSanPham" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Nồng độ cồn
                    </label>
                        <div class="form-check form-check-inline">
                            <form:radiobuttons path="nongDoSanPham" cssStyle="margin-left: 10px" items="${nongDoCon}" delimiter=""/>
                        </div>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Nơi sản xuất
                    </label>
                    <form:select path="nuocSX.idNSX" cssClass="form-control">

                        <form:options items="${listnuocSX}" itemValue="idNSX" itemLabel="tenNSX"/>

                    </form:select>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Hình sản phẩm bia
                    </label>
                    <c:if test="${not empty sanpham.hinhSanPham}">
                    <label>
                        <img src="/imgProduct/${sanpham.hinhSanPham}" style="width: 80px"/>
                    </label>
                    </c:if>
                    <input name="upload-photo" type="file" class="form-control">
                    <p class="form-text text-danger">${error}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Mô tả
                    </label>
                    <form:textarea path="mieuTaSanPham" cssClass="form-control"/>
                </div>
                <div class="d-grid gap-2 d-md-block">
                    <button type="submit" style="width: 100px" class="btn btn-success" formaction="/product/admin/productManage/add">Thêm</button>
                    <button type="submit" style="width: 100px" class="btn btn-info" formaction="/product/admin/productManage/update">Cập nhật</button>
                    <button type="submit" style="width: 100px" class="btn btn-danger" formaction="/product/admin/productManage/delete/${sanpham.idSanPham}">Xoá</button>
                    <a href="/product/productManage">
                        <button type="button"  style="width: 100px" class="btn btn-secondary">Reset</button>
                    </a>
                </div>
                <center>
                    <a href="/index" style="color: #157347;text-decoration: none;">Về trang chủ</a>
                </center>
            </form:form>
        </div>
    </div>
    <br>
    <div class="container">
        <div class="row">
            <div class="col">
                <form action="/product/admin/productManage/search" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Tìm kiếm tên bia" name="ten" aria-describedby="button-addon2" style="border-color: #157347"
                        value="${ten}">
                        <button class="btn btn-outline-success" type="submit" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                </form>
            </div>
            <div class="col-md-auto">
                <div class="hint-text">Hiển thị <b>${page.numberOfElements}</b> trong <b>${page.totalElements}</b> Sản phẩm</div>
            </div>
        </div>
    </div>
    <br>
    <table class="table table-success table-bordered center">
        <thead>
        <tr class="table-success">
            <th scope="col">ID</th>
            <th scope="col">Tên sản phẩm</th>
            <th scope="col">Giá sản phẩm</th>
            <th scope="col">Số lượng sản phẩm</th>
            <th scope="col">Nồng độ</th>
            <th scope="col">Nơi sản xuất</th>
            <th scope="col">Hình</th>
            <th scope="col">Miêu tả sản phẩm</th>
            <th scope="col">Tình trạng</th>
            <th scope="col">Điều khiển</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="spHienThi" items="${page.content}">
                <tr class="table-success">
                    <td class="table-success">${spHienThi.idSanPham}</td>
                    <td class="table-success">${spHienThi.tenSanPham}</td>
                    <td class="table-success"><fmt:formatNumber value="${spHienThi.giaSanPham}" type="number"/> đ</td>
                    <td class="table-success">${spHienThi.soLuongSanPham}</td>
                    <td class="table-success">${spHienThi.nongDoSanPham}</td>
                    <td class="table-success">${spHienThi.nuocSX.tenNSX}</td>
                    <td class="table-success"><img src="/imgProduct/${spHienThi.hinhSanPham}" style="width: 100px"/></td>
                    <td class="table-success">${spHienThi.mieuTaSanPham}</td>
                    <td class="table-success">${spHienThi.tinhTrang}</td>
                    <td class="table-success">
                        <a href="/product/admin/productManage/update/${spHienThi.idSanPham}" role="button">
                            <button type="submit" class="btn btn-info">Cập nhật</button>
                        </a>
                    </td>
                </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-md-auto">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${not empty ten}">
                                <li class="page-item"><a class="page-link" href="/product/admin/productManage/search?p=0" style="color: #157347">Đầu</a></li>
                                <c:forEach var="index" items="${index}">
                                    <li class="page-item"><a class="page-link" href="/product/admin/productManage/search?p=${index}" style="color: #157347">${index+1}</a></li>
                                </c:forEach>
                                <li class="page-item"><a class="page-link" href="/product/admin/productManage/search?p=${page.totalPages - 1}" style="color: #157347">Cuối</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="/product/admin/productManage?p=0" style="color: #157347">Đầu</a></li>
                                <c:forEach var="index" items="${index}">
                                    <li class="page-item"><a class="page-link" href="/product/admin/productManage?p=${index}" style="color: #157347">${index+1}</a></li>
                                </c:forEach>
                                <li class="page-item"><a class="page-link" href="/product/admin/productManage?p=${page.totalPages - 1}" style="color: #157347">Cuối</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</article>
<br>
<!-- Footer -->
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>
</body>
</html>
