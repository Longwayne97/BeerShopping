<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<head>
    <title>Thông tin cá nhân</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<article>
    <c:if test="${not empty success}">
        <div class="alert alert-success" role="alert" style="text-align: center">
                ${success}
        </div>
    </c:if>
    <section style="background-color: #eee;">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="/imgAvarta/${sessionScope.logInTK.hinhTK}" alt="avatar"
                                 class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3">${sessionScope.logInTK.tenTK}</h5>
                            <p class="text-muted mb-1">Ngày sinh <fmt:formatDate value="${sessionScope.logInTK.ngaySinhTK}" pattern="dd/MM/yyyy"/> </p>
                                <a href="/info/update/${sessionScope.logInTK.tenTK}" class="btn btn-success ms-1">Cập nhật</a>
                                <a href="/info/updatepassword"  class="btn btn-outline-success ms-1">Đổi mật khẩu</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Họ tên</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${sessionScope.logInTK.hotenTK}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${sessionScope.logInTK.emailTK}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Số điện thoại</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${sessionScope.logInTK.sdtTK}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Giới tính</p>
                                </div>
                                <div class="col-sm-9">
                                    <c:choose>
                                        <c:when test="${sessionScope.logInTK.gioiTinhTK==true}">
                                            <p class="text-muted mb-0">Nam</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="text-muted mb-0">Nữ</p>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Địa chỉ</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${sessionScope.logInTK.diachiTK}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card text-center mb-4 mb-md-0">
                                <div class="card-body">
                                    <c:if test="${sessionScope.logInTK.roleKhachHang == true}">
                                    <h5 class="card-title" style="text-align: center;color: #157347">QUẢN TRỊ</h5>
                                    <a href="/product/admin/productManage" class="btn btn-success">Sản phẩm</a>
                                    <a href="/admin/listCustomer/page" class="btn btn-success">Khách hàng</a>
                                    <a href="/admin/hoadon" class="btn btn-success">Hoá đơn</a>
                                    </c:if>
                                    <c:if test="${sessionScope.logInTK.roleKhachHang == false}">
                                        <h5 class="card-title" style="color: #157347">HOÁ ĐƠN</h5>
                                        <c:forEach var="donhang" items="${listDH}">
                                    <ol class="list-group">
                                        <li class="list-group-item d-flex justify-content-between align-items-start" onclick="window.location.href ='/info/hoadon/detail/${donhang.idDonHang}'">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">Mã: ${donhang.idDonHang}</div>
                                                Ngày đặt hàng : <fmt:formatDate value="${donhang.ngayDatHang}" pattern="dd/MM/yyyy hh:mm:ss"/>
                                            </div>
                                            <span class="badge text-bg-primary rounded-pill"> <fmt:formatNumber value="${donhang.tongTienDonHang}" type="number"/> Đ </span>
                                        </li>
                                    </ol>
                                        </c:forEach>

                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card text-center mb-4 mb-md-0">
                                <div class="card-body">
                                    <form:form action="" method="post" modelAttribute="tk">
                                    <h5 class="card-title" style="color: #157347">ĐIỀU KHIỂN</h5>
                                    <a href="/login" class="btn btn-outline-success">Đăng xuất</a>
                                    <button type="submit" formaction="/info/delete/${sessionScope.logInTK.tenTK}" class="btn btn-danger">Xoá tài khoản</button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</article>
<br>
<!-- Footer -->
<jsp:include page="footer.jsp"/>
<!-- Footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>
</body>
</html>
