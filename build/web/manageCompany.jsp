<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="Model.*" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Quản Lý - Công Ty</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <jsp:include page="sidebar.jsp" />
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #1d2634;
                color: #9e9ea4;
                font-family: 'Montserrat', sans-serif;
            }

            .container {
                margin-top: 40px;
            }

            h1 {
                color: #fff;
                font-weight: 700;
                text-align: center;
                margin-bottom: 30px;
            }

            .table {
                background-color: #2a2f45;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                color: #fff;
            }

            .table thead th {
                background-color: #4c4c6d;
                color: #fff;
                text-align: center;
                border-bottom: 2px solid #3a3f57;
            }

            .table tbody td {
                text-align: center;
                vertical-align: middle;
                border-color: #3a3f57;
            }

            .table tbody tr:hover {
                background-color: #3a3f57;
            }

            .btn {
                border-radius: 20px;
                font-size: 0.9rem;
                padding: 5px 20px;
                transition: all 0.3s;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }

            .header {
                background-color: #4c4c6d;
                color: white;
                padding: 15px;
                text-align: center;
                font-size: 24px;
                border-radius: 8px 8px 0 0;
                margin-bottom: 20px;
            }

            .content {
                margin-left: 260px;
                padding: 30px;
            }
            .button {
                background-color: #1E90FF;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 20px;
                font-size: 16px;
                cursor: pointer;
                width: auto;
                display: inline-block;
            }

            .button:hover {
                background-color: #1C86EE;
            }
        </style>
    </head>
    <body>

        <div class="content">
            <div class="container">
                <div class="header">
                    Quản Lý Công Ty
                </div>
                <form action="addCompany.jsp">
                    <button type="submit" class="button">Thêm Công Ty</button>
                </form>
                <table class="table table-striped mt-3">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Công Ty</th>
                            <th>Địa Chỉ</th>
                            <th>Số Điện Thoại</th>
                            <th>Email</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${listcompany}">
                            <tr>
                                <td>${c.getCompanyID()}</td>
                                <td>${c.getCompanyName()}</td>
                                <td>${c.getAddress()}</td>
                                <td>${c.getPhoneNumber()}</td>
                                <td>${c.getEmail()}</td>
                                <td>
                                    <a href="editCompany?id=${c.getCompanyID()}" class="btn btn-primary btn-edit">
                                        <i class="fas fa-edit"></i> Chỉnh Sửa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
