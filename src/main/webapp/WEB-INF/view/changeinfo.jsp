<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<head>
    <title>Thay đổi thông tin cá nhân</title>

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
                        <form:form action="/info/update" method="post" modelAttribute="tk">
                        <div class="row">
                            <form:hidden path="tenTK"/>
                            <div class="col-sm-3">
                                <p class="mb-0">Họ tên</p>
                            </div>
                            <div class="col-sm-9">
                                <form:input path="hotenTK" cssClass="form-control"/>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${sessionScope.logInTK.emailTK}</p>
                                <form:hidden path="emailTK"/>
                                <form:hidden path="passTK"/>
                                <form:hidden path="hinhTK"/>
                                <form:hidden path="ngaySinhTK"/>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Số điện thoại</p>
                            </div>
                            <div class="col-sm-9">
                                <form:input path="sdtTK" cssClass="form-control"/>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Giới tính</p>
                            </div>
                            <div class="col-sm-9">
                                <form:radiobuttons path="gioiTinhTK" items="${gioiTinhUpdate}" cssStyle=" margin-left: 10px" class="form-check-input"/>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Địa chỉ</p>
                            </div>
                            <div class="col-sm-9">
                                <form:input path="diachiTK" cssClass="form-control"/>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card text-center mb-4 mb-md-0">
                            <div class="card-body">
                                <button type="submit" class="btn btn-success">Cập nhật tài khoản</button>
                                <a href="/info" class="btn btn-secondary">Quay lại</a>
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
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>
</body>
</html>
