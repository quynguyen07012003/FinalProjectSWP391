<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh Toán</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f0f2f5;
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
            }
            .container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 90%;
                max-width: 1100px;
                margin-top: 20px;
            }
            .order-details, .payment-details {
                padding: 20px;
            }
            .order-details h4, .payment-details h4 {
                font-weight: bold;
                color: #333;
                margin-bottom: 15px;
            }
            .product-item {
                display: flex;
                align-items: center;
                padding: 10px 0;
                border-bottom: 1px solid #ddd;
                justify-content: space-between;
            }
            .product-item:last-child {
                border-bottom: none;
            }
            .product-img {
                width: 60px;
                height: 60px;
                margin-right: 15px;
                border-radius: 8px;
                border: 1px solid #ddd;
            }
            .product-info {
                flex: 3;
                color: #495057;
                font-size: 0.9em;
            }
            .product-info .product-name {
                font-weight: bold;
                color: #333;
            }
            .product-info .product-description {
                color: #777;
                font-size: 0.85em;
            }
            .product-quantity {
                flex: 1;
                text-align: right;
                color: #333;
                font-weight: bold;
            }
            .product-price {
                flex: 1;
                text-align: right;
                color: black;
                font-weight: bold;
            }
            .summary-item {
                font-size: 1em;
                color: #495057;
                margin: 10px 0;
            }
            .total-value {
                font-size: 1.2em;
                font-weight: bold;
                color: #333;
            }
            .payment-box {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                background-color: #f9f9f9;
                margin-top: 15px;
            }
            .qr-code {
                width: 180px;
                height: 180px;
                margin-top: 20px;
            }
            .pay-btn {
                background-color: #28a745;
                color: #ffffff;
                width: 100%;
                padding: 12px;
                font-size: 1.1em;
                font-weight: bold;
                border-radius: 6px;
                border: none;
                margin-top: 20px;
                cursor: pointer;
            }
            .pay-btn:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <!-- Cột trái: Thông tin đơn hàng -->
                <div class="col-md-8 order-details">
                    <h4>Thông tin đơn hàng</h4>
                    <c:forEach var="item" items="${cartItems}">
                        <div class="product-item">
                            <img class="product-img" src="${item.product.productImage}" alt="${item.product.productName}">
                            <div class="product-info">
                                <div class="product-name">${item.product.productName}</div>
                                <div class="product-description">${item.product.description}</div>
                            </div>
                            <div class="product-quantity">
                                Số lượng: ${item.quantity}
                            </div>
                            <div class="product-price">
                                <fmt:formatNumber value="${item.product.price * item.quantity}" type="number" maxFractionDigits="0"/> &#8363;
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Cột phải: Thông tin thanh toán và QR Code -->
                <div  class="col-md-4">
                    <div  class="payment-details text-center payment-box">
                        <h4>Yêu cầu thanh toán</h4>
                        <p>Vui lòng thực hiện thanh toán để hoàn tất đơn hàng của bạn, <b>${sessionScope.fullName}</b>.</p>

                        <div class="summary-item">
                            <strong>Số điện thoại:</strong> ${sessionScope.phoneNumber}
                        </div>
                        <div class="summary-item">
                            <strong>Địa chỉ:</strong> ${sessionScope.address}
                        </div>
                        <div class="summary-item">
                            <strong>Tổng số lượng sản phẩm:</strong> ${sessionScope.totalItems}
                        </div>
                        <div class="summary-item">
                            <strong>Tổng giá trị:</strong>
                            <span class="total-value"><fmt:formatNumber value="${sessionScope.totalPrice}" type="number" maxFractionDigits="0"/> &#8363;</span>
                        </div>
                    </div>
                    <!-- Mã QR Code -->
                    <div style="text-align:center;">
                        <img  src="https://i.imgur.com/M05Lwqj.jpeg" alt="QR Code" class="qr-code">

                        <!-- Form để xác nhận thanh toán -->
                        <form action="confirmPayment" method="post">
                            <input type="hidden" name="status" value="paid">
                            <input type="hidden" name="totalPrice" value="${sessionScope.totalPrice}">
                            <button type="submit" class="pay-btn">Xác nhận thanh toán</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
