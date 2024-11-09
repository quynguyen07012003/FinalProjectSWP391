<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <title>Cập Nhật Hồ Sơ</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }
            .main-body {
                padding: 15px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="main-body">
                <nav aria-label="breadcrumb" class="main-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Cập Nhật Hồ Sơ</li>
                    </ol>
                </nav>

                <div class="row gutters-sm">
                    <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 3}">
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <form action="updateAgent" method="post" enctype="multipart/form-data">
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger">
                                                <c:out value="${errorMessage}" escapeXml="false"/>
                                            </div>
                                        </c:if>
                                        <input type="hidden" name="userID" value="${profileAg.userID}"/>
                                        <input type="hidden" name="agentID" value="${profileAg.agentID}"/>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Tên Đại Lý</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="text" class="form-control" name="agentName" value="${profileAg.agentName}" required>
                                            </div>
                                        </div>
                                        <hr>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Địa Chỉ</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="text" class="form-control" name="address" value="${profileAg.address}" required>
                                            </div>
                                        </div>
                                        <hr>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Email</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="email" class="form-control" name="email" value="${profileAg.email}" required>
                                            </div>
                                        </div>
                                        <hr>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Số Điện Thoại</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="text" class="form-control" name="phoneNumber" value="${profileAg.phoneNumber}" required>
                                            </div>
                                        </div>
                                        <hr>

                                        <button type="submit" class="btn btn-primary">Cập Nhật Hồ Sơ</button>
                                        <a href="javascript:history.back()" class="btn btn-secondary">Quay Lại</a>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
