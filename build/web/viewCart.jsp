<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Bootstrap JS Bundle -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

        <title>Trang Giỏ Hàng</title>
    </head>

    <style>
        body{
            background: #ddd;
            min-height: 100vh;
            vertical-align: middle;
            display: flex;
            font-family: sans-serif;
            font-size: 0.8rem;
            font-weight: bold;
        }
        .title{
            margin-bottom: 5vh;
        }
        .card{
            margin:120px auto 20px;
            max-width: 950px;
            width: 90%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 1rem;
            border: transparent;
        }
        @media(max-width:767px){
            .card{
                margin: 3vh auto;
            }
        }
        .cart{
            background-color: #fff;
            padding: 4vh 5vh;
            border-bottom-left-radius: 1rem;
            border-top-left-radius: 1rem;
        }
        @media(max-width:767px){
            .cart{
                padding: 4vh;
                border-bottom-left-radius: unset;
                border-top-right-radius: 1rem;
            }
        }
        .summary{
            background-color: #ddd;
            border-top-right-radius: 1rem;
            border-bottom-right-radius: 1rem;
            padding: 4vh;
            color: rgb(65, 65, 65);
        }
        @media(max-width:767px){
            .summary{
                border-top-right-radius: unset;
                border-bottom-left-radius: 1rem;
            }
        }
        .summary .col-2{
            padding: 0;
        }
        .summary .col-10
        {
            padding: 0;
        }
        .row{
            margin: 0;
        }
        .title b{
            font-size: 1.5rem;
        }
        .main{
            margin: 0;
            padding: 2vh 0;
            width: 100%;
        }
        .col-2, .col{
            padding: 0 1vh;
        }
        a{
            padding: 0 1vh;
        }
        .close{
            margin-left: auto;
            font-size: 0.7rem;
        }
        img{
            width: 3.5rem;
        }
        .back-to-shop {
            position: absolute;
            bottom: 30px;
            left: 5vh;
        }
        h5{
            margin-top: 4vh;
        }
        hr{
            margin-top: 1.25rem;
        }
        form{
            padding: 2vh 0;
        }
        select{
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1.5vh 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }
        input{
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }
        input:focus::-webkit-input-placeholder
        {
            color:transparent;
        }
        .btn {
            background-color: #000;
            color: #fff;
            width: 100%;
            padding: 10px;
            font-size: 0.9rem;
            text-align: center;
            border-radius: 4px;
            transition: 0.3s;
            border: none;
        }
        .btn:focus{
            box-shadow: none;
            outline: none;
            box-shadow: none;
            color: white;
            -webkit-box-shadow: none;
            -webkit-user-select: none;
            transition: none;
        }
        .btn:hover{
            color: white;
        }
        a{
            color: black;
        }
        a:hover{
            color: black;
            text-decoration: none;
        }
    </style>
    <body>
        <jsp:include page="header.jsp" />

        <div class="card">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col"><h4><b style="color: black;">Giỏ Hàng</b></h4></div>
                        </div>
                    </div>    

                    <div class="row border-top border-bottom">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="row main align-items-center">
                                <div class="col-2"><img class="img-fluid" src="${item.product.productImage}"></div>
                                <div class="col">
                                    <div class="row text-muted">${item.product.productName}</div>
                                    <div class="row">${item.product.description}</div>
                                </div>
                                <div class="col" style="color: black;">
                                    <a href="javascript:void(0)" class="decrease-quantity" data-cartid="${item.cartID}" data-price="${item.product.price}" style="color: black;">-</a>

                                    <span id="quantity_${item.cartID}" style="color: black;" class="">${item.quantity}</span>

                                    <a href="javascript:void(0)" class="increase-quantity" data-cartid="${item.cartID}" data-price="${item.product.price}" style="color: black;">+</a>
                                </div>

                                <div class="col" style="color: black;">
                                    <span id="price_${item.cartID}">
                                        <c:set var="totalPriceForItem" value="${item.product.price * item.quantity}" />
                                        <fmt:formatNumber value="${totalPriceForItem}" type="number" maxFractionDigits="0"/> &#8363;
                                    </span>
                                </div>
                                <a href="cart?action=remove&cartID=${item.cartID}" class="close">&#10005;</a>
                            </div>
                        </c:forEach>
                    </div>

                    <a href="viewProducts" class="btn" style="color:white;">Quay lại cửa hàng</a>
                </div>

                <div class="col-md-4 summary">
                    <div><h5><b style="color: black;">Thanh Toán</b></h5></div>
                    <hr>

                    <form action="checkout" method="post">
                        <div class="form-group">
                            <label style="color:black;" for="fullName">Họ và tên</label>
                            <input type="text" name="fullName" id="fullName" class="form-control" placeholder="Nhập họ và tên của bạn" required>
                        </div>
                        <div class="form-group">
                            <label style="color:black;" for="phoneNumber">Số điện thoại</label>
                            <input type="tel" name="phoneNumber" id="phoneNumber" class="form-control" placeholder="Nhập số điện thoại của bạn" pattern="[0-9]{10}" required>
                        </div>
                        <div class="form-group">
                            <label style="color:black;" for="address">Địa chỉ</label>
                            <input type="text" name="address" id="address" class="form-control" placeholder="Nhập địa chỉ của bạn" required>
                        </div>

                        <input type="hidden" id="hidden_totalItems" name="totalItems" value="${totalItems}">
                        <input type="hidden" id="hidden_totalPrice" name="totalPrice" value="${totalPrice}">

                        <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 10px 0;">
                            <div class="col">TỔNG SỐ LƯỢNG</div>
                            <div class="col text-right" id="total_items_count">${totalItems}</div> 
                        </div>
                        <div class="row">
                            <div class="col">TỔNG GIÁ</div>
                            <div class="col text-right" style="color: black;">
                                <span id="total_price">
                                    <fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="0"/> &#8363;
                                </span>
                            </div>
                        </div>

                        <button style="margin-top: 20px;" type="submit" class="btn">THANH TOÁN</button>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function updateQuantity(cartID, newQuantity, pricePerItem) {
                $.ajax({
                    url: 'cart',
                    type: 'POST',
                    data: {
                        action: 'update',
                        cartID: cartID,
                        quantity: newQuantity
                    },
                    dataType: 'json',
                    success: function (response) {
                        console.log("Sta", response.status)
                        if (response.status === "success") {
                            $("#quantity_" + cartID).text(newQuantity);
                            var totalPriceForItem = newQuantity * pricePerItem;
                            $("#price_" + cartID).text(totalPriceForItem.toLocaleString() + " ₫");

                            updateTotalItems();
                            updateTotalPrice();
                        } else {
                            alert("Cập nhật số lượng thất bại.");
                        }
                    },
                    error: function () {
                        alert("Lỗi trong yêu cầu AJAX.");
                    }
                });
            }

            function updateTotalPrice() {
                var totalPrice = 0;

                $(".main").each(function () {
                    var cartID = $(this).find(".increase-quantity").data("cartid");
                    var quantity = parseInt($("#quantity_" + cartID).text());
                    var pricePerItem = parseFloat($(this).find(".increase-quantity").data("price"));

                    totalPrice += quantity * pricePerItem;
                });

                $("#hidden_totalPrice").val(totalPrice);
                $("#total_price").text(totalPrice.toLocaleString() + " ₫");
            }

            function updateTotalItems() {
                var totalItems = 0;

                $(".main").each(function () {
                    var cartID = $(this).find(".increase-quantity").data("cartid");
                    var quantity = parseInt($("#quantity_" + cartID).text());
                    totalItems += quantity;
                });

                $("#hidden_totalItems").val(totalItems);
                $("#total_items_count").text(totalItems);
            }

            $(document).on("click", ".increase-quantity", function () {
                var cartID = $(this).data("cartid");
                var quantity = parseInt($("#quantity_" + cartID).text());
                var pricePerItem = parseFloat($(this).data("price"));

                updateQuantity(cartID, quantity + 1, pricePerItem);
            });

            $(document).on("click", ".decrease-quantity", function () {
                var cartID = $(this).data("cartid");
                var quantity = parseInt($("#quantity_" + cartID).text());
                var pricePerItem = parseFloat($(this).data("price"));

                if (quantity > 1) {
                    updateQuantity(cartID, quantity - 1, pricePerItem);
                }
            });
        </script>
    </body>
</html>
