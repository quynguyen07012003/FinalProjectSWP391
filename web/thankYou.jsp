<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cảm ơn Quý Khách</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
        }
        .thank-you-container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            max-width: 600px;
            width: 100%;
        }
        .thank-you-container h1 {
            font-size: 2em;
            color: #28a745;
            margin-bottom: 20px;
        }
        .thank-you-container p {
            font-size: 1.2em;
            color: #333;
            margin-bottom: 30px;
        }
        .home-btn {
            background-color: #007bff;
            color: #ffffff;
            padding: 12px 25px;
            font-size: 1em;
            border-radius: 6px;
            text-decoration: none;
            display: inline-block;
        }
        .home-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="thank-you-container">
        <h1>Cảm ơn Quý Khách!</h1>
        <p>Đơn hàng của bạn đã được xác nhận thành công. Chúng tôi sẽ sớm liên hệ để giao hàng cho bạn.</p>
        <a href="home.jsp" class="home-btn">Trở về trang chủ</a>
    </div>
</body>
</html>
