<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <title>Products Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <jsp:include page="sidebar.jsp" />
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            margin-left: 260px;
            max-width: calc(100% - 260px);
            background: #ffffff;
            padding-bottom: 1px;
            position: fixed;
            height: 100%;

        }

        h1 {

            text-align: center;
            font-size: 28px;
            color: #343a40;
            padding-top: 10px;
        }

        .pagination .page-link {
            color: #28a745;
        }

        .pagination .page-item.active .page-link {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
        }

        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            border-collapse: collapse;
        }

        .table thead th {
            background-color: #e9ecef;
            color: #495057;
            font-weight: bold;
            border-bottom: 2px solid #dee2e6;
            text-align: center;
        }

        .table tbody td {
            text-align: center;
            vertical-align: middle;
            border-top: 1px solid #dee2e6;
            padding: 8px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .table tbody tr {
            transition: background-color 0.2s;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table tbody td img {
            width: 60px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #dee2e6;
        }

        .table thead th:nth-child(1),
        .table tbody td:nth-child(1) {
            width: 60px; 
        }

        .table thead th:nth-child(2),
        .table tbody td:nth-child(2) {
            width: 170px; 
        }

        .table thead th:nth-child(3),
        .table tbody td:nth-child(3) {
            width: 100px; 
        }

        .table thead th:nth-child(4),
        .table tbody td:nth-child(4) {
            width: 80px; 
        }

        .table thead th:nth-child(5),
        .table tbody td:nth-child(5) {
            width: 120px; 
        }

        .table thead th:nth-child(6),
        .table tbody td:nth-child(6) {
            width: 150px; 
        }

        .table thead th, .table tbody td {
            border-right: 1px solid #dee2e6;
        }

        .table thead th:last-child, .table tbody td:last-child {
            border-right: none; 
        }

        .btn-success {
            color: white;
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-primary, .btn-danger, .btn-success {
            margin: 2px;
        }

    </style>


    <body>
        <div class="container">


            <div class="d-flex justify-content-between align-items-center mt-4 mb-4">
                <h1>Product Management</h1>
                <a href="product?action=add" class="btn btn-success">Add New Product</a>
            </div>

            <form method="get" action="product" class="form-inline mb-3">
                <input type="hidden" name="action" value="search" />
                <input type="text" name="search" value="${param.search}" class="form-control mr-sm-2" placeholder="Search products...">
                <button type="submit" class="btn btn-outline-success">Search</button>
            </form>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Event</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td><img src="${product.productImage}" alt="Product Image"></td>
                            <td>${product.productName}</td>
                            <td><fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/>&#8363;</td>
                            <td>${product.stock}</td>
                            <td>${product.event.eventName}</td>
                            <td>
                                <a href="product?action=edit&id=${product.productID}" class="btn btn-primary btn-sm">Edit</a>
                                <c:choose>
                                    <c:when test="${product.isActive}">
                                        <a href="product?action=deactivate&id=${product.productID}" class="btn btn-danger btn-sm">Deactivate</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="product?action=activate&id=${product.productID}" class="btn btn-success btn-sm">Activate</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="product?action=search&page=${i}&search=${search}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>

        </div>
    </body>
</html>
