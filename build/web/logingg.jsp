<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Đăng Nhập V4</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <style>
            /* Điều chỉnh nút Google thành toàn chiều rộng và phẳng */
            .login100-social-item.bg3 {
                width: 100%;
                height: 50px;
                line-height: 50px;
                background-color: #db4437;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 25px;
                font-size: 16px;
            }

            .login100-social-item.bg3 i {
                margin-right: 10px;
            }

            /* Điều chỉnh vị trí Đăng Ký */
            .flex-col-c {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <form class="login100-form validate-form" action="login">
                        <span class="login100-form-title p-b-49">
                            Đăng Nhập
                        </span>
                        <c:if test="${mess!=null}"> 
                            <p style="color: red; text-align: center">${mess}</p>
                        </c:if>
                        <div class="wrap-input100 validate-input m-b-23" data-validate = "Vui lòng nhập tên đăng nhập">
                            <span class="label-input100">Tên Đăng Nhập</span>
                            <input class="input100" type="text" name="username" placeholder="Nhập tên đăng nhập của bạn">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Vui lòng nhập mật khẩu">
                            <span class="label-input100">Mật Khẩu</span>
                            <input class="input100" type="password" name="pass" placeholder="Nhập mật khẩu của bạn">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>

                        <div class="text-right p-t-8 p-b-31">
                            <a href="enterEmail.jsp">
                                Quên mật khẩu?
                            </a>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">
                                    Đăng Nhập
                                </button>
                            </div>
                        </div>

                        <div class="txt1 text-center p-t-54 p-b-20">
                            <span>
                                Hoặc Đăng Nhập Bằng
                            </span>
                        </div>

                        <!-- Điều chỉnh nút Google thành toàn chiều rộng -->
                        <div class="flex-c-m">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:9999/SWP/logingg&response_type=code&client_id=1056101797693-p707emsfvgn58vlcvogoqkpe6h92egai.apps.googleusercontent.com&approval_prompt=force" class="login100-social-item bg3">
                                <i class="fa fa-google"></i> Google
                            </a>
                        </div>

                        <!-- Di chuyển Đăng Ký vào đây -->
                        <div class="flex-col-c p-t-20">
                            <a href="signup.jsp" class="txt2">
                                Đăng Ký
                            </a>
                            <a href="home.jsp" class="txt2">
                                Về Trang Chủ
                            </a>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
