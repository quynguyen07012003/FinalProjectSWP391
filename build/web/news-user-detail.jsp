<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${news != null ? news.title : 'Chi Tiết Tin Tức'}</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom Stylesheet -->
    <style>
        .news-container {
            margin-top: 40px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            color: #212529;
        }
        .news-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            color: #212529;
        }
        .news-meta {
            color: #212529;
            font-size: 1rem;
            margin-bottom: 20px;
        }
        .news-image {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .news-content {
            line-height: 1.8;
            font-size: 1.2rem;
            color: #212529;
        }
        .back-btn {
            margin-top: 20px;
        }

    </style>
</head>
<body>
    <!-- Header -->
    <jsp:include page="header.jsp" />

    <div class="container my-5">
        <!-- Section header -->
        <section class="text-center mb-5">
            <h1 class="display-4 text-dark">Tin Tức Mới Nhất</h1>
            <p class="lead text-muted">Luôn cập nhật với các tin tức mới nhất</p>
        </section>

        <!-- News content -->
        <div class="news-container">
            <h1 class="news-title">${news.title}</h1>
            <p class="news-meta">
                <strong style="color:black;">Ngày đăng:</strong> ${news.createdAt} | 
                <strong style="color:black;">Mã Tác Giả:</strong> ${news.authorID}
            </p>
            
            <!-- Display the news image if it exists -->
            <c:if test="${news.imagePath != null && !news.imagePath.isEmpty()}">
                <img src="${news.imagePath}" alt="Hình Ảnh Tin Tức" class="news-image">
            </c:if>
            
            <div class="news-content">
                <p>${news.content}</p>
            </div>
            
            <a href="newsUser" class="btn btn-secondary back-btn">Quay Lại Danh Sách Tin Tức</a>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
