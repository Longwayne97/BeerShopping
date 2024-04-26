<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
    .shopping-cart{
        padding-bottom: 50px;
        font-family: 'Montserrat', sans-serif;
    }

    .shopping-cart.dark{
        background-color: #f6f6f6;
    }

    .shopping-cart .content{
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
        background-color: white;
    }

    .shopping-cart .block-heading{
        padding-top: 50px;
        margin-bottom: 40px;
        text-align: center;
    }

    .shopping-cart .block-heading p{
        text-align: center;
        max-width: 420px;
        margin: auto;
        opacity:0.7;
    }

    .shopping-cart .dark .block-heading p{
        opacity:0.8;
    }

    .shopping-cart .block-heading h1,
    .shopping-cart .block-heading h2,
    .shopping-cart .block-heading h3 {
        margin-bottom:1.2rem;
        color: #3b99e0;
    }

    .shopping-cart .items{
        margin: auto;
    }

    .shopping-cart .items .product{
        margin-bottom: 20px;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .shopping-cart .items .product .info{
        padding-top: 0px;
        text-align: center;
    }

    .shopping-cart .items .product .info .product-name{
        font-weight: 600;
    }

    .shopping-cart .items .product .info .product-name .product-info{
        font-size: 14px;
        margin-top: 15px;
    }

    .shopping-cart .items .product .info .product-name .product-info .value{
        font-weight: 400;
    }

    .shopping-cart .items .product .info .quantity .quantity-input{
        margin: auto;
        width: 80px;
    }

    .shopping-cart .items .product .info .price{
        margin-top: 15px;
        font-weight: bold;
        font-size: 22px;
    }

    .shopping-cart .summary{
        border-top: 2px solid #5ea4f3;
        background-color: #f7fbff;
        height: 100%;
        padding: 30px;
    }

    .shopping-cart .summary h3{
        text-align: center;
        font-size: 1.3em;
        font-weight: 600;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .shopping-cart .summary .summary-item:not(:last-of-type){
        padding-bottom: 10px;
        padding-top: 10px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .shopping-cart .summary .text{
        font-size: 1em;
        font-weight: 600;
    }

    .shopping-cart .summary .price{
        font-size: 1em;
        float: right;
    }

    .shopping-cart .summary button{
        margin-top: 20px;
    }

    @media (min-width: 768px) {
        .shopping-cart .items .product .info {
            padding-top: 25px;
            text-align: left;
        }

        .shopping-cart .items .product .info .price {
            font-weight: bold;
            font-size: 22px;
            top: 17px;
        }

        .shopping-cart .items .product .info .quantity {
            text-align: center;
        }
        .shopping-cart .items .product .info .quantity .quantity-input {
            padding: 4px 10px;
            text-align: center;
        }
    }

</style>
<script type="text/javascript">
    function loadDataCart(id, index) {
        var value = $('.quantityProd').eq(index).val();
        $.ajax({
            type: 'POST',
            url: '/cart/update/'+id+'?quantity='+value,
            success: function(data){
                $('#listCart').html($(data).find('#listCart').children());
                $('#tag-cart').html($(data).find('#tag-cart').children());
            }
        })
    }
</script>
<head>
    <title>Giỏ hàng</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<article>
    <main class="page">
        <section class="shopping-cart dark">
            <div class="container">
                <div class="block-heading">
                    <c:if test="${not empty error}">
                        <h2 class="alert alert-danger">${error}</h2>
                    </c:if>
                    <h2>GIỎ HÀNG</h2>
                </div>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="items">
                                <c:forEach items="${cart}" var="cartItem">
                                    <form action="/cart/update" method="post">
                                    <div class="product">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="hidden" name="idsp" value="${cartItem.value.idSanPham}">
                                                <img class="img-fluid mx-auto d-block image" src="/imgProduct/${cartItem.value.hinhSanPham}">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="info">
                                                    <div class="row">
                                                        <div class="col-md-5 product-name">
                                                            <div class="product-name">
                                                                <p style="text-decoration: none">${cartItem.value.tenSanPham}</p>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 quantity">
                                                            <label>Số lượng:</label>
                                                            <input type="number" value="${cartItem.value.soLuongSanPham}" min="1" name="qty" onblur="this.form.submit()" style="width:50px;">
                                                        </div>
                                                        <div class="col-md-3 price">
                                                            <span><fmt:formatNumber value="${cartItem.value.giaSanPham*cartItem.value.soLuongSanPham}" type="number"/> đ</span>
                                                            <a href="/cart/remove/${cartItem.value.idSanPham}"><i class="fa-solid fa-trash"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="summary">
                                <h3>Hoá đơn</h3>
                                <div class="summary-item"><span class="text">Thành tiền</span><span class="price"><fmt:formatNumber value="${tongtien}" type="number"/></span></div>
                                <div class="summary-item"><span class="text">Discount</span><span class="price">0</span></div>
                                <div class="summary-item"><span class="text">Shipping</span><span class="price">0</span></div>
                                <div class="summary-item"><span class="text">Tổng tiền</span><span class="price"><fmt:formatNumber value="${tongtien}" type="number"/></span></div>
                                <br>
                                <c:choose>
                                    <c:when test="${empty sessionScope.logInTK}">
                                        <a href="/login" class="btn btn-primary btn-lg btn-block">Thanh toán</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/cart/${sessionScope.logInTK.tenTK}/checkout" class="btn btn-primary btn-lg btn-block">Thanh toán</a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="/cart/clear" class="btn btn-success btn-lg btn-block">Clear</a>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </main>
</article>
<br>
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/aa540ef16a.js" crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

</body>
</html>
