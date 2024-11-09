<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chỉnh Sửa Công Ty</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- Custom Styles -->
        <style>
            body {
                background-color: #1d2634;
                color: #9e9ea4;
                font-family: 'Montserrat', sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                margin-top: 40px;
                color: #fff;
                background-color: #2a2f45;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #fff;
                font-weight: 700;
                text-align: center;
                margin-bottom: 30px;
            }

            .form-group label {
                color: #fff;
            }

            .form-control {
                background-color: #3a3f57;
                color: #fff;
                border: 1px solid #4c4c6d;
            }

            .form-control:focus {
                background-color: #3a3f57;
                color: #fff;
                border-color: #007bff;
                box-shadow: none;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                border-radius: 20px;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }

            .alert {
                border-radius: 8px;
                background-color: #dc3545;
                color: #fff;
            }

            .alert ul {
                padding-left: 20px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1>Chỉnh Sửa Công Ty</h1>

            <!-- Hiển Thị Lỗi -->
            <c:if test="${!empty errors}">
                <div class="alert">
                    <ul>
                        <c:forEach var="error" items="${errors}">
                            <li>${error}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if> 

            <!-- Form Chỉnh Sửa Công Ty -->
            <form action="editCompany" method="post">
                <div class="form-group">
                    <input type="hidden" class="form-control" id="companyID" name="companyID" value="${c.getCompanyID()}" readonly>
                </div>
                <div class="form-group">
                    <label for="companyName">Tên Công Ty:</label>
                    <input type="text" class="form-control" id="companyName" name="companyName" value="${c.getCompanyName()}" required>
                </div>

                <div class="form-group">
                    <label for="address">Địa Chỉ:</label>
                    <input type="text" class="form-control" id="address" name="address" value="${c.getAddress()}" required>
                </div>

                <div class="form-group">
                    <label for="phonenumber">Số Điện Thoại:</label>
                    <input type="number" step="0.01" class="form-control" id="phonenumber" name="phonenumber" value="${c.getPhoneNumber()}" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" name="email" value="${c.getEmail()}" required>
                </div>
                <button type="submit" class="btn btn-primary">Cập Nhật</button>
            </form>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
