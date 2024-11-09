<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Thêm Sản Phẩm</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <style>
        /* CSS giữ nguyên như bạn đã cung cấp */
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
            max-width: 150px;
            height: auto;
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
            <h1>Thêm Sản Phẩm</h1>

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
                <input type="hidden" name="action" value="add" >

                <div class="form-container">
                    <!-- Cột Trái -->
                    <div class="left-column">
                        <div class="form-group">
                            <label for="productName">Tên Sản Phẩm:</label>
                            <input type="text" class="form-control" id="productName" name="productName" required>
                        </div>

                        <div class="form-group">
                            <label for="price">Giá:</label>
                            <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                        </div>

                        <div class="form-group">
                            <label for="stock">Số Lượng:</label>
                            <input type="number" class="form-control" id="stock" name="stock" required>
                        </div>

                        <div class="form-group">
                            <label for="description">Mô Tả:</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                        </div>
                    </div>

                    <!-- Cột Phải -->
                    <div style="margin-top:8px;" class="right-column">
                        <div class="form-group">
                            <label for="productImage">Hình Ảnh Sản Phẩm:</label>
                            <img id="currentProductImage" src="#" alt="Hình Ảnh Sản Phẩm" class="img-thumbnail" style="display:none;">
                            <input type="file" class="form-control-file" id="productImage" name="productImage" onchange="previewImage(event)" required>
                        </div>

                        <div class="form-group">
                            <label for="eventID">Sự Kiện:</label>
                            <select class="form-control" id="eventID" name="eventID" required>
                                <c:forEach var="event" items="${events}">
                                    <option value="${event.eventID}">${event.eventName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
            </form>
        </div>

        <script>
            function previewImage(event) {
                const file = event.target.files[0];
                const preview = document.getElementById("currentProductImage");

                if (file) {
                    preview.style.display = "block";
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
