<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<head>
    <title>Thay đổi mật khẩu</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<article>
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert" style="text-align: center">
                ${error}
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
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="/info/updatepassword/success" method="post" >
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Mật khẩu cũ</p>
                                </div>
                                <div class="col-sm-9">
                                    <input type="password" name="oldPass" class="form-control">
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Mật khẩu mới</p>
                                </div>
                                <div class="col-sm-9">
                                    <input type="password" name="newPass" class="form-control">
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Xác nhận mật khẩu mới</p>
                                </div>
                                <div class="col-sm-9">
                                    <input type="password" name="checkPass" class="form-control">
                                </div>
                            </div>
                            <hr>
                            <button type="submit" class="btn btn-success">Đổi mật khẩu</button>
                            <a href="/info" class="btn btn-secondary">Quay lại</a>
                        </form>
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
