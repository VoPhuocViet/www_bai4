<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>IUH BOOKSTORE - Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .header {
            background: url('${pageContext.request.contextPath}/images/header-bg.jpg') repeat-x;
            padding: 15px 0 15px 30px;
            color: #fff;
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 2px;
            margin-bottom: 0;
        }
        .navbar {
            background: #847560;
            padding: 0 10px;
            display: flex;
            align-items: center;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 12px 30px;
            font-weight: bold;
            font-size: 18px;
            border-right: 1px solid #b7a789;
        }
        .navbar a:last-child {
            border-right: none;
        }
        .main-container {
            display: flex;
            margin: 0 auto;
            max-width: 1100px;
            background: #fff;
            border: 1px solid #d1cfc3;
            box-shadow: 0 2px 8px #e8e8e8;
            min-height: 700px;
        }
        .sidebar {
            width: 260px;
            background: #f3f3f3;
            padding: 25px 20px;
            border-right: 1px solid #e5e5e5;
        }
        .sidebar-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .sidebar-about {
            font-size: 15px;
            margin-bottom: 20px;
        }
        .sidebar-search label {
            font-size: 15px;
            font-weight: bold;
        }
        .sidebar-search input[type="text"] {
            width: 95%;
            padding: 6px;
            margin-top: 5px;
            border: 1px solid #bbb;
            border-radius: 3px;
        }
        .products-section {
            flex: 1;
            padding: 28px 12px;
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px 18px;
            justify-items: center;
        }
        .product-card {
            background: #fff;
            border: 1px solid #bbb;
            padding: 12px 8px 14px 8px;
            width: 220px;
            box-shadow: 0 1px 4px #ececec;
            text-align: center;
            margin-bottom: 8px;
        }
        .product-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 3px;
        }
        .product-img {
            width: 120px;
            height: 160px;
            object-fit: cover;
            margin-bottom: 8px;
            border: 1px solid #eee;
        }
        .product-info {
            margin-bottom: 5px;
            font-size: 14px;
        }
        .product-details-link {
            display: block;
            color: #2196F3;
            margin-bottom: 5px;
            text-decoration: underline;
            font-size: 14px;
        }
        .add-to-cart-btn {
            background-color: #4CAF50;
            color: white;
            padding: 5px 14px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .add-to-cart-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="header">IUH BOOKSTORE</div>
<div class="navbar">
    <a href="${pageContext.request.contextPath}/products">HOME</a>
    <a href="#">EXAMPLES</a>
    <a href="#">SERVICES</a>
    <a href="${pageContext.request.contextPath}/products">PRODUCTS</a>
    <a href="#">CONTACT</a>
</div>
<div class="main-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-title">ABOUT US</div>
        <div class="sidebar-about">
            About us information will be here...
            <a href="#" style="font-size: 13px; color: #666;">Read More &raquo;</a>
        </div>
        <form action="${pageContext.request.contextPath}/search" method="get" style="margin-top:10px;">
            <input type="text" name="q" placeholder="Search..." style="width:95%;padding:6px;" />
            <input type="submit" value="Search" style="display:none;" />
        </form>
    </div>
    <!-- Products Grid -->
    <div class="products-section">
        <div class="products-grid">
            <c:forEach items="${products}" var="p">
                <div class="product-card">
                    <div class="product-title">${p.title}</div>
                    <img src="${pageContext.request.contextPath}/images/${p.imgURL}" class="product-img" alt="${p.title}">
                    <div class="product-info">Price: ${p.price} đ</div>
                    <div class="product-info">Quantity: ${p.quantity}</div>
                    <a href="${pageContext.request.contextPath}/product?id=${p.id}" class="product-details-link">
                        Product details
                    </a>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="id" value="${p.id}">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="quantity" value="1">
                        <input type="submit" name="addToCart" value="Add to cart" class="add-to-cart-btn">
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>