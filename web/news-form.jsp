<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>${news != null ? "Chỉnh sửa tin tức" : "Thêm tin tức"}</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f4f7f9;
                font-family: 'Montserrat', sans-serif;
                color: #343a40;
            }
            .navbar {
                background-color: #343a40;
                padding: 10px 20px;
            }
            .navbar a {
                color: white;
                margin-right: 15px;
                font-weight: 600;
                text-decoration: none;
            }
            .navbar a:hover {
                text-decoration: underline;
            }
            .container {
                margin-top: 60px;
                max-width: 700px;
            }
            .form-header {
                background-color: #007bff;
                color: white;
                padding: 15px;
                border-radius: 8px;
                text-align: center;
                font-size: 24px;
                font-weight: 600;
                margin-bottom: 30px;
            }
            .form-group label {
                font-weight: 600;
            }
            .form-control {
                border-radius: 25px;
                padding: 10px;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                border-radius: 25px;
                padding: 10px 20px;
            }
            .btn-secondary {
                border-radius: 25px;
                padding: 10px 20px;
            }
            .btn {
                font-size: 1rem;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <nav class="navbar">
            <a href="home.jsp">Trang chủ</a>
            <a href="BookController">Đặt lịch</a>
            <a href="manage-new">Tin tức</a>
        </nav>

        <div class="container">
            <div class="form-header">
                ${news != null ? "Chỉnh sửa tin tức" : "Thêm tin tức"}
            </div>

            <form action="manage-new" method="post">
                <input type="hidden" name="action" value="${news != null ? 'update' : 'insert'}">

                <c:if test="${news != null}">
                    <input type="hidden" name="id" value="${news.newsID}">
                </c:if>

                <input type="hidden" name="authorID" value="${news.authorID}">

                <div class="form-group">
                    <label for="title">Tiêu đề:</label>
                    <input type="text" class="form-control" id="title" name="title" value="${news != null ? news.title : ''}" required>
                </div>

                <div class="form-group">
                    <label for="content">Nội dung:</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required>${news != null ? news.content : ''}</textarea>
                </div>

                <div class="form-group">
                    <label for="status">Trạng thái:</label>
                    <select class="form-control" id="status" name="status">
                        <option value="Nháp" ${news != null && news.status == 'Nháp' ? 'selected' : ''}>Bản nháp</option>
                        <option value="Đã lên" ${news != null && news.status == 'Đã lên' ? 'selected' : ''}>Đã xuất bản</option>

                    </select>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-primary">${news != null ? "Cập nhật" : "Thêm mới"}</button>
                    <a href="manage-new" class="btn btn-secondary">Hủy bỏ</a>
                </div>
            </form>


            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
