<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mạng Lưới Nghệ Sĩ Việt Nam - Đăng Ký</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .register-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                max-width: 600px;
                margin: 50px auto;
            }
            .form-section {
                border-top: 2px solid #007bff;
                margin-top: 20px;
                padding-top: 20px;
            }
            .form-check-inline {
                margin-right: 20px;
            }
            .btn-group {
                margin-top: 20px;
                text-align: center;
            }
            .role-section {
                display: none;
            }
            .input-group-text {
                background-color: #007bff;
                color: white;
                border: none;
            }
            .alert {
                margin-top: 20px;
            }
        </style>
        <script>
            function showRoleSection(role) {
                document.getElementById('clientSection').style.display = 'none';
                document.getElementById('artistSection').style.display = 'none';
                document.getElementById('agentSection').style.display = 'none';

                if (role === 'client') {
                    document.getElementById('clientSection').style.display = 'block';
                } else if (role === 'artist') {
                    document.getElementById('artistSection').style.display = 'block';
                } else if (role === 'agent') {
                    document.getElementById('agentSection').style.display = 'block';
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="register-container">
                <h2 class="text-center">Mạng Lưới Nghệ Sĩ Việt Nam</h2>
                <p class="text-center text-danger">Vui lòng điền đầy đủ và chính xác các thông tin</p>

                <!-- Thông báo thành công hoặc lỗi -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success" role="alert">
                        ${successMessage}
                    </div>
                </c:if>

                <form action="register" method="POST">
                    <!-- Chọn vai trò -->
                    <div class="form-group text-center">
                        <label class="font-weight-bold">Vai Trò:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" id="clientRole" value="client" onclick="showRoleSection('client')">
                            <label class="form-check-label" for="clientRole">Khách Hàng</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" id="artistRole" value="artist" onclick="showRoleSection('artist')">
                            <label class="form-check-label" for="artistRole">Nghệ Sĩ</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" id="agentRole" value="agent" onclick="showRoleSection('agent')">
                            <label class="form-check-label" for="agentRole">Đại Lý</label>
                        </div>
                    </div>

                    <!-- Thông Tin Đăng Nhập -->
                    <div class="form-section">
                        <h5>Thông Tin Đăng Nhập</h5>
                        <div class="form-group">
                            <label for="username">Tên Đăng Nhập <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="password">Mật Khẩu <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    </div>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="confirmPassword">Xác Nhận Mật Khẩu <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    </div>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Thông Tin Khách Hàng -->
                    <div id="clientSection" class="role-section form-section">
                        <h5>Thông Tin Khách Hàng</h5>
                        <div class="form-group">
                            <label for="clientName">Tên Khách Hàng <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" id="clientName" name="clientName" placeholder="Nhập tên khách hàng">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="clientPhone">Số Điện Thoại <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                </div>
                                <input type="text" class="form-control" id="clientPhone" name="clientPhone" placeholder="Nhập số điện thoại">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="clientEmail">Email <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input type="email" class="form-control" id="clientEmail" name="clientEmail" placeholder="Nhập email">
                            </div>
                        </div>
                    </div>

                    <!-- Thông Tin Nghệ Sĩ -->
                    <div id="artistSection" class="role-section form-section">
                        <h5>Thông Tin Nghệ Sĩ</h5>
                        <div class="form-group">
                            <label for="artistName">Tên Nghệ Sĩ <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-microphone"></i></span>
                                </div>
                                <input type="text" class="form-control" id="artistName" name="artistName" placeholder="Nhập tên nghệ sĩ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="stageName">Tên Nghệ Danh</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-microphone-alt"></i></span>
                                </div>
                                <input type="text" class="form-control" id="stageName" name="stageName" placeholder="Nhập tên nghệ danh (nếu có)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="artistPhone">Số Điện Thoại <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                </div>
                                <input type="text" class="form-control" id="artistPhone" name="artistPhone" placeholder="Nhập số điện thoại">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="artistEmail">Email <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input type="email" class="form-control" id="artistEmail" name="artistEmail" placeholder="Nhập email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="artistGenre">Thể Loại Âm Nhạc</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-music"></i></span>
                                </div>
                                <input type="text" class="form-control" id="artistGenre" name="artistGenre" placeholder="Nhập thể loại âm nhạc">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="artistBio">Tiểu Sử</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-book"></i></span>
                                </div>
                                <textarea class="form-control" id="artistBio" name="artistBio" placeholder="Nhập tiểu sử của nghệ sĩ"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Thông Tin Đại Lý -->
                    <div id="agentSection" class="role-section form-section">
                        <h5>Thông Tin Đại Lý</h5>
                        <div class="form-group">
                            <label for="agentName">Tên Đại Lý <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-building"></i></span>
                                </div>
                                <input type="text" class="form-control" id="agentName" name="agentName" placeholder="Nhập tên đại lý">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="company">Tên Công Ty</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-building"></i></span>
                                </div>
                                <input type="text" class="form-control" id="company" name="company" placeholder="Nhập tên công ty">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="agentPhone">Số Điện Thoại <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                </div>
                                <input type="text" class="form-control" id="agentPhone" name="agentPhone" placeholder="Nhập số điện thoại">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="agentEmail">Email <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input type="email" class="form-control" id="agentEmail" name="agentEmail" placeholder="Nhập email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="agentAddress">Địa Chỉ</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                </div>
                                <input type="text" class="form-control" id="agentAddress" name="agentAddress" placeholder="Nhập địa chỉ">
                            </div>
                        </div>
                    </div>

                    <!-- Khu vực nút gửi -->
                    <div class="btn-group text-center">
                        <button type="button" class="btn btn-warning" onclick="window.location.href='logingg.jsp'">Đăng Nhập</button>
                        <button type="submit" class="btn btn-primary">Đăng Ký</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
