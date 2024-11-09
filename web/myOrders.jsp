<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Đơn Hàng Của Tôi</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            .card-header strong {
                color: black;
            }
            .container {
                margin-top: 120px;
                color: black;
            }
            .nav {
                padding: 3px 0;
                background-color: white;
                margin-bottom: 10px;
            }
            .nav-tabs {
                border-bottom: 1px solid #ddd;
                background-color: #f9f9f9;
            }
            .nav-tabs .nav-link {
                color: #333;
                padding: 10px 20px;
                font-weight: 500;
                border: none;
                transition: color 0.3s, border-bottom 0.3s;
            }
            .nav-tabs .nav-link:hover {
                color: #ff4500;
            }
            .nav-tabs .nav-link.active {
                color: #ff4500;
                font-weight: bold;
                border-bottom: 2px solid #ff4500;
                background-color: transparent;
            }
            .nav-item {
                margin-right: 5px;
            }
            .nav-tabs .nav-item {
                list-style-type: none;
            }
            .pagination {
                list-style: none; /* Xóa các dấu chấm */
                padding: 0;
                margin: 0;
            }
            .pagination .page-item {
                display: inline-block; /* Đảm bảo mỗi mục phân trang là inline */
            }
            .search-form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .search-input {
                padding: 12px 15px;
                border: 1px solid transparent;
                outline: none;
                width: 300px;
                background-color: #444;
                color: #ddd;
                font-size: 1rem;
                transition: background-color 0.3s, border-color 0.3s, box-shadow 0.3s;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }

            .search-input::placeholder {
                color: #bbb;
            }

            .search-input:focus {
                background-color: #555;
                border-color: #00aaff;
                box-shadow: 0px 4px 12px rgba(0, 170, 255, 0.4);
            }

            .search-btn {
                margin-top: -24px;
                margin-left: 10px;
                background-color: #00aaff;
                color: white;
                border: none;
                padding: 12px 20px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.2s;
                font-size: 1rem;
                font-weight: bold;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }

            .search-btn:hover {
                background-color: #007bbf;
            }

            .search-btn:active {
                transform: scale(0.95);
            }
        </style>
    </head>
    <jsp:include page="header.jsp" />

    <body>

        <div class="container">


            <h2 style="text-align: center;">Đơn Hàng Của Tôi</h2>


            <div>
                <form method="get" action="#" class="search-form">
                    <input type="hidden" name="action" value="search" />
                    <input type="text" name="search" value="${param.search}" class="search-input" placeholder="Search products...">
                    <button type="submit" class="search-btn">Search</button>
                </form>
            </div>
            <ul class="nav nav-tabs justify-content-between">
                <li class="nav-item">
                    <a class="nav-link ${param.status == null ? 'active' : ''}" href="myOrders">Tất cả</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${'Chờ Xử Lý'.equals(param.status) ? 'active' : ''}" href="myOrders?status=Chờ Xử Lý">Chờ xử lý</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${'Đang Vận Chuyển'.equals(param.status) ? 'active' : ''}" href="myOrders?status=Đang Vận Chuyển">Đang vận chuyển</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${'Đã Giao Hàng'.equals(param.status) ? 'active' : ''}" href="myOrders?status=Đã Giao Hàng">Đã giao hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${'Đã Hủy'.equals(param.status) ? 'active' : ''}" href="myOrders?status=Đã Hủy">Đã hủy</a>
                </li>
            </ul>

            <c:forEach var="order" items="${orders}">
                <div class="card mb-3">
                    <div class="card-header" id="strong">
                        <strong>Mã Đơn Hàng:</strong> ${order.orderID} |
                        <strong>Ngày Đặt:</strong> ${order.orderDate} |
                        <strong>Trạng Thái:</strong> ${order.status} |
                        <strong>Tổng Tiền:</strong> <fmt:formatNumber value="${order.totalAmount}" type="number" maxFractionDigits="0"/> ₫
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Ảnh Sản Phẩm</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Số Lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng Tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${order.orderItems}">
                                    <tr>
                                        <td><img src="${item.product.productImage}" alt="Ảnh Sản Phẩm" style="width: 50px; height: auto;"></td>
                                        <td>${item.product.productName}</td>
                                        <td>${item.quantity}</td>
                                        <td><fmt:formatNumber value="${item.price}" type="number" maxFractionDigits="0"/> ₫</td>
                                        <td><fmt:formatNumber value="${item.quantity * item.price}" type="number" maxFractionDigits="0"/> ₫</td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- Phân trang -->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center mt-4">
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="myOrders?page=${i}&status=${status}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </body>

    <jsp:include page="footer.jsp" />
</html>
