<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Sản Phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }

    .container {
        max-width: 90%;
        margin-top: 50px;
        background: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #343a40;
    }

    .form-group label {
        font-weight: bold;
        color: #495057;
    }

    .form-container {
        display: flex;
        gap: 20px;
    }

    .left-column,
    .right-column {
        flex: 1;
    }

    .form-control,
    .form-control-file,
    .btn-primary {
        border-radius: 4px;
    }

    .img-thumbnail {
        width: 200px;
        height: 200px;
        object-fit: cover;
        display: block;
        margin: 0 auto;
    }

    .right-column .form-group {
        text-align: left;
    }

    button[type="submit"] {
        width: 100%;
        margin-top: 20px;
        font-size: 16px;
    }
</style>

<body>
    <div class="container">
        <h1>Chỉnh Sửa Sản Phẩm</h1>

        <c:if test="${!empty errors}">
            <div class="alert alert-danger">
                <ul>
                    <c:forEach var="error" items="${errors}">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <form action="product" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="productID" value="${product.productID}">
            <input type="hidden" name="oldImage" value="${product.productImage}">

            <div class="form-container">
                <!-- Cột Trái -->
                <div class="left-column">
                    <div class="form-group">
                        <label for="productName">Tên Sản Phẩm:</label>
                        <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" required>
                    </div>

                    <div class="form-group">
                        <label for="price">Giá:</label>
                        <input type="number" step="0.01" class="form-control" id="price" name="price" value="${product.price}" required>
                    </div>

                    <div class="form-group">
                        <label for="stock">Số Lượng:</label>
                        <input type="number" class="form-control" id="stock" name="stock" value="${product.stock}" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Mô Tả:</label>
                        <textarea class="form-control" id="description" name="description" rows="3" required>${product.description}</textarea>
                    </div>
                </div>

                <!-- Cột Phải -->
                <div class="right-column">
                    <div class="form-group">
                        <label for="currentProductImage">Ảnh Hiện Tại:</label>
                        <img id="currentProductImage" src="${product.productImage}" alt="${product.productName}" class="img-thumbnail">
                    </div>

                    <div class="form-group text-center">
                        <input type="file" class="form-control-file d-none" id="productImage" name="productImage" onchange="previewImage(event)">
                        <button type="button" class="btn btn-secondary mx-auto d-block" onclick="document.getElementById('productImage').click();">
                            Chọn Ảnh
                        </button>
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 6px" for="eventID">Sự Kiện:</label>
                        <select class="form-control" id="eventID" name="eventID" required>
                            <c:forEach var="event" items="${events}">
                                <option value="${event.eventID}" <c:if test="${event.eventID == product.eventID}">selected</c:if>>${event.eventName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Cập Nhật</button>
        </form>
    </div>

    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            const preview = document.getElementById("currentProductImage");

            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    preview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>
