<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Cập nhật Hồ sơ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            color: #2d3436;
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
            padding-top: 20px;
        }
        .main-container {
            max-width: 900px;
            margin: auto;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .breadcrumb {
            background-color: transparent;
            font-size: 0.9rem;
            padding: 8px 0;
        }
        .card-body {
            padding: 1.5rem;
        }
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #007bff;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: 600;
            color: #4b4b4b;
        }
        .btn-primary, .btn-secondary {
            padding: 8px 20px;
            font-weight: 500;
        }
        .btn-secondary {
            margin-left: 10px;
        }
        .btn-group .btn {
            font-size: 0.9rem;
        }
        .btn-group a + a {
            margin-left: 8px;
        }
    </style>
</head>
<body>

<div class="container main-container">
    <nav aria-label="breadcrumb" class="main-breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="home.jsp">Trang chủ</a></li>
            <li class="breadcrumb-item active">Cập nhật Hồ sơ</li>
        </ol>
    </nav>

    <div class="row">
        <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 4}">
            <div class="col-md-4 text-center">
                <div class="card">
                    <div class="card-body">
                        <img id="artistImage" src="${profileA.image}" alt="Nghệ sĩ" class="profile-pic">
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <!-- Hiển thị thông báo lỗi nếu có -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>

                        <!-- Form cập nhật hồ sơ -->
                        <form action="updateArtist" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="userID" value="${profileA.userId}">
                            <input type="hidden" name="artistID" value="${profileA.artistID}">
                            <input type="hidden" name="oldImage" value="${profileA.image}">

                            <div class="form-group">
                                <label>Họ và Tên</label>
                                <input type="text" class="form-control" name="artistName" value="${profileA.artistName}" required>
                            </div>

                            <div class="form-group">
                                <label>Nghệ danh</label>
                                <input type="text" class="form-control" name="stageName" value="${profileA.stageName}" required>
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" value="${profileA.email}" required>
                            </div>

                            <div class="form-group">
                                <label>Giới thiệu</label>
                                <textarea class="form-control" name="bio" rows="3">${profileA.bio}</textarea>
                            </div>

                            <div class="form-group">
                                <label>Ngày sinh</label>
                                <input type="date" class="form-control" name="dob" value="${profileA.dateOfBirth}" required>
                            </div>

                            <div class="form-group">
                                <label>Ảnh đại diện</label>
                                <input type="file" class="form-control-file" name="image" id="imageInput" onchange="previewImage(event)">
                            </div>

                            <button type="submit" class="btn btn-primary">Cập nhật Hồ sơ</button>
                            <a href="home.jsp" class="btn btn-secondary">Quay lại</a>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body text-center">
                        <div class="btn-group">
                            <a href="song?artistID=${profileA.artistID}" class="btn btn-primary btn-sm">Chỉnh sửa Bài hát</a>
                            <a href="album?artistID=${profileA.artistID}" class="btn btn-info btn-sm">Chỉnh sửa Album</a>
                            <a href="ArtistMangeController?action=editSocial&artistID=${profileA.artistID}" class="btn btn-warning btn-sm">Chỉnh sửa Mạng xã hội</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<script>
    function previewImage(event) {
        const reader = new FileReader();
        reader.onload = function () {
            const imgElement = document.getElementById('artistImage');
            imgElement.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
