<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <title>Đăng Kí</title>

</head>
<body>
<jsp:include page="header.jsp" />
<br>
<article>
    <div class="card center" style="width: 30rem;">
        <h5 class="card-header" style="background-color: #157347; text-align: center;color: white;font-weight: bold">
            Đăng kí
        </h5>
        <div class="card-body">
            <p class="form-text text-danger">${error1}</p>
            <form:form action="/signup/add" modelAttribute="taikhoan" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Tài khoản
                    </label>
                    <form:input path="tenTK" cssClass="form-control"/>
                    <form:errors path="tenTK" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Mật khẩu
                    </label>
                    <form:password path="passTK" cssClass="form-control"/>
                    <form:errors path="passTK" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                       Xác nhận mật khẩu
                    </label>
                    <input class="form-control" type="password" name="xacNhanMK"/>
                    <p class="form-text text-danger">${error2}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Họ tên
                    </label>
                    <form:input path="hotenTK" cssClass="form-control"/>
                    <form:errors path="hotenTK" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Ngày sinh
                    </label>
                    <form:input type="date" cssClass="form-control" path="ngaySinhTK"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Avarta
                    </label>
                    <input name="upload-photo" type="file" class="form-control">
                    <p class="form-text text-danger">${error}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Giới tính
                    </label>
                    <form:radiobuttons path="gioiTinhTK" items="${gioiTinh}" cssStyle=" margin-left: 10px" class="form-check-input"/>
                    <form:errors path="gioiTinhTK" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Số điện thoại
                    </label>
                    <form:input path="sdtTK" cssClass="form-control"/>
                    <form:errors path="sdtTK" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Địa chỉ
                    </label>
                    <form:input path="diachiTK" cssClass="form-control"/>
                    <form:errors path="diachiTK" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Email
                    </label>
                    <form:input path="emailTK" cssClass="form-control"/>
                    <form:errors path="emailTK" cssClass="form-text text-danger"/>
                </div>
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="submit" class="btn btn-success">Đăng kí</button>
                </div>
                <center>
                    <a href="/index" style="color: #157347;text-decoration: none;">Về trang chủ</a>
                </center>
            </form:form>
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
