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
    <title>Quên mật khẩu</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<article>
    <div class="card center" style="width: 30rem;">
        <h5 class="card-header" style="background-color: #157347; text-align: center;color: white;font-weight: bold">
            Lấy mật khẩu
        </h5>
        <div class="card-body">
            <form:form action="/forgot-password/change" method="post">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="alert alert-success" role="alert" style="text-align: center">
                        ${success}
                    </div>
                </c:if>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Email đã đăng kí
                    </label>
                    <input type="email" class="form-control" name="email">
                </div>
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="submit" class="btn btn-success">Lấy OTP</button>
                </div>
            </form:form>
            <center>
                <a href="/login"><button class="btn btn-success" type="button" style="width: 200px">Quay lại đăng nhập</button></a>
            </center>
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
