<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Shop</title>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/config.css">
        <link type="text/css" rel="stylesheet" href="css/libs.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <link type="text/css" rel="stylesheet" href="css/responsive.css">

        <link rel="icon" href="img/favicon.png" sizes="32x32">

        <style>
            .product-card {
                background-color: #2a2a2a;
                color: #e0e0e0;
                border-radius: 12px;
                padding: 20px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                position: relative;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                margin: 15px;
                text-align: center;
                max-width: 250px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .bringer-grid-4cols {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 20px;
            }


            .product-card:hover {
                transform: scale(1.03);
                box-shadow: 0 8px 15px rgba(0, 0, 0, 0.4);
            }

            .product-image img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 8px;
                margin-bottom: 15px;
            }

            .bringer-portfolio-card-title .bringer-meta {
                font-size: 1.2rem;
                font-weight: 700;
                color: #ffffff;
                margin-bottom: 8px;
            }

            .bringer-portfolio-card-title p {
                font-size: 0.85rem;
                color: #a0a0a0;
                margin: 5px 0;
            }

            .product-info {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 15px;
            }

            .product-image img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 8px;
                margin: 10px;
            }

            .product-name {
                font-size: 1.1rem;
                font-weight: bold;
                color: #333;
                text-align: center;
            }

            .product-purchase {
                display: flex;
                justify-content: flex-start; /* căn trái */
                gap: 10px;
            }

            .price-tag {
                font-size: 1.1rem;
                font-weight: bold;
                color:#838383;
                margin: 0;
                line-height: 40px;
                justify-content: left;
            }

            .btn-success {
                padding: 8px;
                display: flex;
                align-items: center;
                justify-content: right;
                line-height: 40px;
            }

            .btn-success:hover {
                color: #0056b3;
            }

            .pagination {
                display: flex;
                justify-content: center;
                padding: 15px 0;
                margin: 0;
            }

            .pagination .page-item {
                margin: 0 5px;
            }

            .pagination .page-link {
                color: #ffffff;
                background-color: #333;
                border: 1px solid #444;
                padding: 8px 12px;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
            }

            .pagination .page-link:hover {
                background-color: #555;
                color: #00aaff;
            }

            .pagination .page-item.active .page-link {
                background-color: #00aaff;
                color: #ffffff;
                border-color: #00aaff;
            }

            .pagination .page-item.disabled .page-link {
                color: #888;
                background-color: #222;
                border-color: #444;
                pointer-events: none;
            }

            .search-form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .search-input {
                padding: 12px 15px;
                border: 1px solid transparent;
                outline: none;
                width: 300px;
                background-color: #444;
                color: #ddd;
                font-size: 1rem;
                transition: background-color 0.3s, border-color 0.3s, box-shadow 0.3s;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }

            .search-input::placeholder {
                color: #bbb;
            }

            .search-input:focus {
                background-color: #555;
                border-color: #00aaff;
                box-shadow: 0px 4px 12px rgba(0, 170, 255, 0.4);
            }

            .search-btn {
                margin-top: -24px;
                margin-left: 10px;
                background-color: #00aaff;
                color: white;
                border: none;
                padding: 12px 20px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.2s;
                font-size: 1rem;
                font-weight: bold;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }

            .search-btn:hover {
                background-color: #007bbf;
            }

            .search-btn:active {
                transform: scale(0.95);
            }
        </style>
    </head>
    <%
    Boolean isLoggedIn = (session.getAttribute("acc") != null);
    %>

    <body>
        <jsp:include page="header.jsp" />

        <div>
            <section>
                <div>
                    <form method="get" action="viewProducts" class="search-form">
                        <input type="hidden" name="action" value="search" />
                        <input type="text" name="search" value="${param.search}" class="search-input" placeholder="Search products...">
                        <button type="submit" class="search-btn">Search</button>
                    </form>
                </div>

                <div class="bringer-grid-4cols bringer-tp-grid-3cols bringer-tp-centered-last-item stg-normal-gap bringer-parallax-media" 
                     data-stagger-appear="fade-up" 
                     data-threshold="0.5" 
                     data-stagger-delay="150" 
                     data-stagger-unload="fade-up">

                    <c:forEach var="product" items="${products}">
                        <c:if test="${product.isActive}">
                            <div class="bringer-block bringer-portfolio-card product-card">
                                <div class="product-info">
                                    <div class="product-image">
                                        <img src="${product.productImage}" alt="${product.productName}" class="img-fluid" />
                                    </div>
                                    <div class="product-name">
                                        <span class="bringer-meta">${product.productName}</span>
                                    </div>
                                </div>

                                <div class="product-purchase">
                                    <p class="price-tag">
                                        <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/>&#8363;
                                    </p>
                                    <a href="javascript:void(0);" class="btn btn-success" onclick="addToCart(${product.productID})">
                                        <i class="fa fa-shopping-cart"></i>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
                <div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li style="list-style: none;" class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="viewProducts?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </section>
        </div>
        <jsp:include page="footer.jsp" />
        <div class="bringer-backlight"></div>



        <script>
            const isLoggedIn = <%= isLoggedIn %>;
            function addToCart(productId) {
                if (!isLoggedIn) {
                    window.location.href = '/SWP/logingg.jsp';
                    return;
                }
                $.ajax({
                    url: 'cart?action=add&id=' + productId,
                    method: 'GET',
                    success: function (response) {
                        console.log('Sản phẩm đã được thêm vào giỏ hàng.');
                    },
                    error: function (xhr, status, error) {
                        console.error('lỗi thêm sản phẩm vào giỏ hàng:', error);
                    }
                });
            }
        </script>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/lib/jquery.min.js"></script>
        <script src="js/lib/libs.js"></script>
        <script src="js/contact_form.js"></script>
        <script src="js/st-core.js"></script>
        <script src="js/classes.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
