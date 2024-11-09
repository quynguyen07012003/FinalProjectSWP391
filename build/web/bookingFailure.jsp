<%-- 
    Document   : bookingFailure
    Created on : Oct 24, 2024, 12:22:47 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Đặt Chỗ Thất Bại</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Đặt Chỗ Thất Bại</h1>
        <div class="alert alert-danger" role="alert">
            Rất tiếc, đặt chỗ của bạn không thể được xử lý. Vui lòng thử lại sau.
        </div>
        <a href="artistList.jsp" class="btn btn-primary">Quay Lại Danh Sách Nghệ Sĩ</a>
        <a href="UserBookController?action=viewUserBookings" class="btn btn-secondary">Xem Đặt Chỗ Của Bạn</a>
    </div>
</body>
</html>
