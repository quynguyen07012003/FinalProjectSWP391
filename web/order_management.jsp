<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản Lý Đơn Hàng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <jsp:include page="sidebar.jsp" />
    </head>
    <style>
        .container {
            margin-left: 260px;
            max-width: calc(100% - 260px);
            background: #1d2634;
            padding-bottom: 1px;
            color: black;
        }
    </style>

    <body>
        <div class="container">
            <h2 style="color: white;">Quản Lý Đơn Hàng</h2>

            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <!-- Logic Phân Trang -->
            <c:set var="itemsPerPage" value="2" />
            <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
            <c:set var="totalOrders" value="${orders.size()}" />
            <c:set var="totalPages" value="${(totalOrders + itemsPerPage - 1) / itemsPerPage}" />
            <c:set var="startIndex" value="${(currentPage - 1) * itemsPerPage}" />
            <c:set var="endIndex" value="${startIndex + itemsPerPage}" />


            <c:forEach var="order" items="${orders}" varStatus="status">
                <c:if test="${status.index >= startIndex && status.index < endIndex}">
                    <div class="card mb-2">
                        <div class="card-header">
                            <strong>Mã Đơn Hàng:</strong> ${order.orderID} |
                            <strong>Ngày Đặt:</strong> ${order.orderDate} |
                            <strong>Tổng Cộng:</strong> <span style="color: red;"><fmt:formatNumber value="${order.totalAmount}" type="number" maxFractionDigits="0"/>đ </span> 
                        </div>
                        <div class="card-body">
                            <form action="orderManagement" method="post">
                                <input type="hidden" name="orderID" value="${order.orderID}">
                                <div class="form-group">
                                    <label for="status">Trạng Thái:</label>
                                    <select name="status" class="form-control" style="width: 200px; display: inline-block;">
                                        <option value="Chờ Xử Lý" ${order.status == 'Chờ Xử Lý' ? 'selected' : ''}>Chờ Xử Lý</option>
                                        <option value="Đang Vận Chuyển" ${order.status == 'Đang Vận Chuyển' ? 'selected' : ''}>Đang Vận Chuyển</option>
                                        <option value="Đã Giao Hàng" ${order.status == 'Đã Giao Hàng' ? 'selected' : ''}>Đã Giao Hàng</option>
                                        <option value="Đã Hủy" ${order.status == 'Đã Hủy' ? 'selected' : ''}>Đã Hủy</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary ml-2">Cập Nhật Trạng Thái</button>
                                </div>
                            </form>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Hình Ảnh Sản Phẩm</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Số Lượng</th>
                                        <th>Giá</th>
                                        <th>Thành Tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${order.orderItems}">
                                        <tr>
                                            <td><img src="${item.product.productImage}" alt="Hình Ảnh Sản Phẩm" style="width: 50px; height: auto;"></td>
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
                </c:if>
            </c:forEach>

            <!-- Điều Khiển Phân Trang -->
            <nav aria-label="Điều Hướng Trang">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="orderManagement?page=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo; Trang Trước</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="orderManagement?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages - 1}">
                        <li class="page-item">
                            <a class="page-link" href="orderManagement?page=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">Trang Tiếp &raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>

        </div>
    </body>
</html>
