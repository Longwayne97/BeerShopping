<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<head>
    <title>Gửi mail</title>
    <style>
        .center {

            /*  top: 0;
              bottom: 0; */
            left: 0;
            right: 0;
            margin: auto;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<article>
    <div class="card center" style="width: 30rem;">
        <h5 class="card-header" style="background-color: #157347; text-align: center;color: white;font-weight: bold">
            Mail
        </h5>
        <div class="card-body">
            <p class="form-text text-danger">${error}</p>
            <p class="form-text text-success">${success}</p>
            <form:form action="/mail/send" method="post" enctype="multipart/form-data" modelAttribute="mailInfo">
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        From
                    </label>
                    <form:input path="from" type="email" class="form-control"/>
                    <form:errors path="from" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        To
                    </label>
                    <form:input path="to" type="email" class="form-control"/>
                    <form:errors path="to" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        CC
                    </label>
                    <form:input path="cc" type="text"  class="form-control"/>
                    <form:errors path="cc" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        BCC
                    </label>
                    <form:input path="bcc" type="text" class="form-control"/>
                    <form:errors path="bcc" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                        Subject
                    </label>
                    <form:input path="subject" type="text" class="form-control"/>
                    <form:errors path="subject" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                       Body
                    </label>
                    <form:textarea path="body" type="text" class="form-control"/>
                    <form:errors path="body" cssClass="form-text text-danger"/>
                </div>
                <div class="mb-3">
                    <label class="form-label" style="color: #157347">
                      Tệp đính kèm
                    </label>
                    <input type="file" name="files" multiple="multiple" class="form-control">
                </div>
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="submit" class="btn btn-success">Gửi</button>
                </div>
                <center>
                    <a href="/index" style="color: #157347;text-decoration: none;">Về trang chủ</a>
                </center>
            </form:form>
        </div>
    </div>
</article>
<br>
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>
</body>
</html>
