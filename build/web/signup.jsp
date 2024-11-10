<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vietnam Artist Network - Registration</title>
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
            // Function to show/hide role-specific sections
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
                <p class="text-center text-danger">Vui lòng điền thông tin chính xác và đầy đủ</p>

                <!-- Hiển thị thông báo thành công hoặc lỗi -->
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
                    <!-- Lựa chọn vai trò -->
                    <div class="form-group text-center">
                        <label class="font-weight-bold">Vai trò:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" id="clientRole" value="client" onclick="showRoleSection('client')">
                            <label class="form-check-label" for="clientRole">Khách hàng</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" id="artistRole" value="artist" onclick="showRoleSection('artist')">
                            <label class="form-check-label" for="artistRole">Nghệ sĩ</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" id="agentRole" value="agent" onclick="showRoleSection('agent')">
                            <label class="form-check-label" for="agentRole">Đại diện</label>
                        </div>
                    </div>

                    <!-- Thông tin đăng nhập -->
                    <div class="form-section">
                        <h5>Thông tin đăng nhập</h5>
                        <div class="form-group">
                            <label for="username">Tên người dùng <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên người dùng" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="password">Mật khẩu <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    </div>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="confirmPassword">Xác nhận mật khẩu <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    </div>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Phần Khách hàng -->
                    <div id="clientSection" class="role-section form-section">
                        <h5>Thông tin Khách hàng</h5>
                        <div class="form-group">
                            <label for="clientName">Tên khách hàng <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" id="clientName" name="clientName" placeholder="Nhập tên khách hàng">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="clientPhone">Số điện thoại <span class="text-danger">*</span></label>
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
                                <input type="email" class="form-control" id="clientEmail" name="clientEmail" placeholder="Nhập địa chỉ email">
                            </div>
                        </div>
                    </div>

                    <!-- Phần Nghệ sĩ -->
                    <div id="artistSection" class="role-section form-section">
                        <h5>Thông tin Nghệ sĩ</h5>
                        <div class="form-group">
                            <label for="artistName">Tên nghệ sĩ <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-microphone"></i></span>
                                </div>
                                <input type="text" class="form-control" id="artistName" name="artistName" placeholder="Nhập tên nghệ sĩ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="stageName">Tên sân khấu</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-microphone-alt"></i></span>
                                </div>
                                <input type="text" class="form-control" id="stageName" name="stageName" placeholder="Nhập tên sân khấu (nếu có)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="artistPhone">Số điện thoại <span class="text-danger">*</span></label>
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
                                <input type="email" class="form-control" id="artistEmail" name="artistEmail" placeholder="Nhập địa chỉ email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="agentSelect">Chọn Đại diện</label>
                            <select class="form-control" id="agentSelect" name="agentID">
                                <option value="">Chọn Đại diện</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="genreSelect">Chọn thể loại</label>
                            <select class="form-control" id="genreSelect" name="genreID">
                                <option value="">Chọn thể loại</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="artistBio">Tiểu sử</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-book"></i></span>
                                </div>
                                <textarea class="form-control" id="artistBio" name="artistBio" placeholder="Nhập tiểu sử nghệ sĩ"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Phần Đại diện -->
                    <div id="agentSection" class="role-section form-section">
                        <h5>Thông tin Đại diện</h5>
                        <div class="form-group">
                            <label for="agentName">Tên công ty <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-building"></i></span>
                                </div>
                                <input type="text" class="form-control" id="agentName" name="agentName" placeholder="Nhập tên công ty">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="agentPhone">Số điện thoại <span class="text-danger">*</span></label>
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
                                <input type="email" class="form-control" id="agentEmail" name="agentEmail" placeholder="Nhập địa chỉ email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="companySelect">Chọn công ty</label>
                            <select class="form-control" id="companySelect" name="companyID">
                                <option value="">Chọn công ty</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="agentAddress">Địa chỉ</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                </div>
                                <input type="text" class="form-control" id="agentAddress" name="agentAddress" placeholder="Enter address">
                            </div>
                        </div>
                    </div>

                    <!-- Nút đăng ký -->
                    <div class="text-center mt-4">
                        <button type="button" class="btn btn-warning" onclick="window.location.href = 'logingg.jsp'">Đăng nhập</button>
                        <button type="submit" class="btn btn-primary">Đăng ký</button>
                    </div>
                </form>
            </div>
        </div>



        <script>
            fetch('getAgents')
                    .then(response => response.json())
                    .then(data => {
                        const agentSelect = document.getElementById('agentSelect');
                        data.forEach(agent => {
                            const option = document.createElement('option');
                            option.value = agent.agentID;
                            option.textContent = agent.agentName + " - " + agent.phoneNumber;
                            agentSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error fetching agents:', error));
        </script>

        <script>
            fetch('getCompanies')
                    .then(response => response.json())
                    .then(data => {
                        const companySelect = document.getElementById('companySelect');
                        data.forEach(company => {
                            const option = document.createElement('option');
                            option.value = company.companyID;
                            option.textContent = company.companyName + " - " + company.phoneNumber;
                            companySelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error fetching companies:', error));
        </script>

        <script>
            fetch('getGenre')
                    .then(response => response.json())
                    .then(data => {
                        const genreSelect = document.getElementById('genreSelect');
                        data.forEach(genre => {
                            const option = document.createElement('option');
                            option.value = genre.genreID;
                            option.textContent = genre.genreName;
                            genreSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error fetching genre:', error));
        </script>

    </body>
</html>
