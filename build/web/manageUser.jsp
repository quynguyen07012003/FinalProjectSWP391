<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="Model.*" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Quản Lý - Quản Lý Người Dùng</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <jsp:include page="sidebar.jsp" />

        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #1d2634;
                color: #9e9ea4;
                font-family: 'Montserrat', sans-serif;
            }

            .container {
                margin-top: 40px;
            }

            h1 {
                color: #fff;
                font-weight: 700;
                text-align: center;
                margin-bottom: 30px;
            }

            .table {
                background-color: #2a2f45;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                color: #fff;
            }

            .table thead th {
                background-color: #4c4c6d;
                color: #fff;
                text-align: center;
                border-bottom: 2px solid #3a3f57;
            }

            .table tbody td {
                text-align: center;
                vertical-align: middle;
                border-color: #3a3f57;
            }

            .table tbody tr:hover {
                background-color: #3a3f57;
            }

            .btn {
                border-radius: 20px;
                font-size: 0.9rem;
                padding: 5px 20px;
                transition: all 0.3s;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }

            .btn-success {
                background-color: #28a745;
                border-color: #28a745;
            }

            .btn-success:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }

            .header {
                background-color: #4c4c6d;
                color: white;
                padding: 15px;
                text-align: center;
                font-size: 24px;
                border-radius: 8px 8px 0 0;
                margin-bottom: 20px;
            }

            .content {
                margin-left: 260px;
                padding: 30px;
            }

            .search-container {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .search {
                display: flex;
                align-items: center;
                gap: 10px;
                width: 600px;
            }

            .search input[type="text"] {
                padding: 8px 12px;
                border-radius: 4px;
                border: 1px solid #ccc;
                width: 100%;
                font-size: 16px;
            }

            .btn.btn-secondary.btn-number {
                display: flex;
                align-items: center;
                padding: 8px 16px;
                font-size: 16px;
                border-radius: 4px;
                border: none;
                background-color: #6c757d;
                color: #fff;
                cursor: pointer;
            }

            .btn.btn-secondary.btn-number:hover {
                background-color: #5a6268;
            }

            .material-icons-outlined {
                font-size: 20px;
                margin-right: 5px;
            }
        </style>
    </head>
    <body>       

        <div class="content">
            <div class="container">
                <form action="SearchServlet" method="post">
                    <div class="search-container">
                        <div class="search">
                            <input type="text" name="txt" placeholder="Tìm kiếm..." value="${param.txt != null ? param.txt : ''}">
                            <button type="submit" class="btn btn-secondary btn-number">
                                <span class="material-icons-outlined"></span> Tìm kiếm
                            </button>   
                        </div>  
                    </div>                   
                </form>

                <h2>Sắp Xếp Theo:</h2>
                <form id="sort" action="sortServlet" method="get">
                    <select name="sortOption" onchange="this.form.submit()">
                        <option value="id" ${param.sortOption == 'id' ? 'selected' : ''}>ID</option>
                        <option value="role2" ${param.sortOption == 'role2' ? 'selected' : ''}>RoleID = 2</option>
                        <option value="role3" ${param.sortOption == 'role3' ? 'selected' : ''}>RoleID = 3</option>
                        <option value="role4" ${param.sortOption == 'role4' ? 'selected' : ''}>RoleID = 4</option>
                    </select>                           
                </form>

                <table class="table table-striped mt-3">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Người Dùng</th>
                            <th>Email</th>
                            <th>Họ Tên</th>
                            <th>Role ID</th>
                            <th>Trạng Thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${listaccount}">
                            <tr>
                                <td>${s.getId()}</td>
                                <td>${s.getUsername()}</td>
                                <td>${s.getEmail()}</td>
                                <td>${s.getFullname()}</td>
                                <td>${s.getRole()}</td>
                                <td>
                                    <a href="usermanage?id=${s.getUsername()}&sortOption=${param.sortOption}">
                                        <c:if test="${s.isVerified_email()}">Bật</c:if>
                                        <c:if test="${!s.isVerified_email()}">Tắt</c:if>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS và các thư viện liên quan -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
