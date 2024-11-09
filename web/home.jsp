<%-- 
    Tài liệu   : home.jsp
    Tạo ngày  : 20 Tháng 9, 2024, 5:36:24 chiều
    Tác giả    : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Phông chữ Google -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet">
        <!-- Cấu hình -->
        <link type="text/css" rel="stylesheet" href="css/config.css">
        <!-- Thư viện -->
        <link type="text/css" rel="stylesheet" href="css/libs.css">
        <!-- Phong cách mẫu -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <!-- Đáp ứng -->
        <link type="text/css" rel="stylesheet" href="css/responsive.css">

        <!-- Favicon -->
        <link rel="icon" href="img/favicon.png" sizes="32x32">
    </head>
    <body>

        <jsp:include page="header.jsp" />

        <!-- Trang chính -->
        <main id="bringer-main">
            <div class="stg-container">
                <!-- Phần Hero -->
                <section data-padding="top">
                    <div class="bringer-hero-block bringer-hero-type04" data-unload="fade-up">
                        <!-- Bộ trượt media -->
                        <div class="bringer-hero-media-wrap bringer-masked-block stg-bottom-gap stg-m-bottom-gap-s" data-appear="zoom-out">
                            <div class="swiper bringer-slider bringer-masked-media" data-autoplay="3000" data-duration="1000" data-effect="coverflow">
                                <div class="swiper-wrapper">
                                    <!-- Mục Bộ trượt -->
                                    <div class="swiper-slide">
                                        <img src="https://sukienachau.com/wp-content/uploads/2021/09/concert-la-gi.jpg" alt="Chúng tôi là Bringer" width="1200" height="600">
                                    </div>

                                    <!-- Mục Bộ trượt -->
                                    <div class="swiper-slide">
                                        <img src="https://goldensmileevent.com.vn/wp-content/uploads/2023/08/7-Tips-On-How-To-Have-The-Best-Time-At-A-Concert-Hero-Searches-Grapevine-1280x720-1-1024x576.jpg" alt="Chúng tôi là Bringer" width="1200" height="600">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="https://proem.org/wp-content/uploads/2022/05/Concerts_Festivals_event.jpg" alt="Chúng tôi là Bringer" width="1200" height="600">
                                    </div>
                                </div>
                            </div>
                            <div class="bringer-slider-nav bringer-masked-content at-bottom-right">
                                <a href="#" class="bringer-slider-prev">
                                    <span class="bringer-icon bringer-icon-chevron-left"></span>
                                </a>
                                <a href="#" class="bringer-slider-next">
                                    <span class="bringer-icon bringer-icon-chevron-right"></span>
                                </a>
                            </div>
                        </div><!-- .bringer-hero-media-wrap -->

                    </div>
                </section>

                <!-- Phần: Giới thiệu -->
                <section class="backlight-bottom">
                    <div class="align-center">
                        <div class="stg-bottom-gap">
                            <h1 class="bringer-page-title is-large" data-appear="fade-up" data-delay="100" data-threshold="0">NỔI BẬT NGHỆ SĨ</h1>
                        </div>
                    </div>
                    <div class="stg-row stg-large-gap stg-valign-middle stg-bottom-gap-l stg-tp-bottom-gap-xl stg-tp-column-reverse stg-m-bottom-gap-l stg-m-normal-gap">
                        <div class="stg-col-6" data-appear="fade-right" data-unload="fade-left">
                            <h2>Nguyễn Thanh Tùng</h2>
                            <p class="bringer-large-text">NGÀY SINH: 05/07/1994</p>
                            <p class="bringer-large-text">QUÊ QUÁN: Thái Bình</p>
                            <p class="bringer-large-text">THỂ LOẠI NHẠC: R&B, POP, BALLAD, NHẠC THẾ GIỚI</p>
                            <p class="bringer-large-text">SỐ BÀI HÁT ĐÃ SÁNG TÁC: 20 Bài</p>
                        </div>
                        <div class="stg-col-6 stg-tp-bottom-gap-l stg-m-bottom-gap" data-appear="fade-left" data-unload="fade-right">
                            <div class="bringer-parallax-media">
                                <img class="bringer-lazy" data-src="https://yt3.googleusercontent.com/oN0p3-PD3HUzn2KbMm4fVhvRrKtJhodGlwocI184BBSpybcQIphSeh3Z0i7WBgTq7e12yKxb=s900-c-k-c0x00ffffff-no-rj" alt="Về Chúng Tôi" width="960" height="960">
                            </div>
                        </div>
                    </div><!-- .stg-row -->
                </section>

                <!-- Phần: Tin tức -->
                <section>
                    <!-- Tiêu đề Phần -->
                    <div class="stg-row bringer-section-title">
                        <div class="stg-col-8 stg-offset-2 stg-tp-col-10 stg-tp-offset-1">
                            <div class="align-center" data-stagger-appear="fade-up" data-stagger-unload="fade-up" data-stagger-delay="100">
                                <h2>Tin tức</h2>
                                <p>Tại đây, bạn sẽ luôn được cập nhật với những tiêu đề mới nhất, các sự kiện lớn và những câu chuyện thú vị từ khắp nơi trên thế giới. Tham gia cùng chúng tôi khi khám phá các tin tức thịnh hành và đảm bảo rằng bạn sẽ không bỏ lỡ bất kỳ thông tin quan trọng nào!</p>
                            </div>
                        </div>
                    </div>
                    <!-- Carousel Đội nhóm -->
                    <div class="swiper bringer-carousel" data-appear="fade-up" data-delay="200" data-tp-centered="0" data-unload="fade-up">
                        <div class="swiper-wrapper">
                            <!-- Mục Carousel -->
                            <div class="bringer-block bringer-carousel-card swiper-slide">
                                <div class="bringer-carousel-card-image">
                                    <img class="bringer-lazy" src="img/null.png" data-src="img/team/team05-thmb.jpg" alt="Candy Tittensor" width="900" height="600">
                                </div>
                                <div class="bringer-carousel-card-footer">
                                    <div class="bringer-carousel-card-title">
                                        <h6>Candy Tittensor</h6>
                                        <p>Tại đây, bạn sẽ luôn được cập nhật với những tiêu đề mới nhất, các sự kiện lớn và những câu chuyện thú vị từ khắp nơi trên thế giới. Tham gia cùng chúng tôi khi khám phá các tin tức thịnh hành và đảm bảo rằng bạn sẽ không bỏ lỡ bất kỳ thông tin quan trọng nào!</p>
                                    </div>
                                    <span class="bringer-icon bringer-icon-explore"></span>
                                </div>
                                <a href="#"></a>
                            </div><!-- .bringer-carousel-card -->
                        </div>
                        <!-- Phân trang -->
                        <div class="swiper-pagination bringer-dots"></div>
                    </div><!-- .bringer-carousel -->
                </section>

        </main>

        <jsp:include page="footer.jsp" />
        <div class="bringer-backlight"></div>

        <!-- Tập lệnh JS -->
        <script src="js/lib/jquery.min.js"></script>
        <script src="js/lib/libs.js"></script>
        <script src="js/contact_form.js"></script>
        <script src="js/st-core.js"></script>
        <script src="js/classes.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
