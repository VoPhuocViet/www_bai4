<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>IUH BOOKSTORE - Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
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
            min-height: 500px;
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
        .product-detail-section {
            flex: 1;
            padding: 30px 30px;
        }
        .product-detail-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 18px;
        }
        .product-detail-box {
            display: flex;
            align-items: flex-start;
        }
        .product-detail-img {
            width: 180px;
            height: 240px;
            object-fit: cover;
            border: 1px solid #ccc;
            margin-right: 30px;
        }
        .product-detail-info {
            font-size: 16px;
        }
        .back-link {
            margin-top: 20px;
            display: inline-block;
            color: #2196F3;
            text-decoration: underline;
            font-size: 15px;
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
        <div class="sidebar-search">
            <label>SEARCH SITE</label>
            <input type="text" placeholder="Search..." />
        </div>
    </div>
    <!-- Product Detail -->
    <div class="product-detail-section">
        <div class="product-detail-title">
            Product details: ${product.title}
        </div>
        <div class="product-detail-box">
            <img src="${pageContext.request.contextPath}/images/${product.imgURL}"
                 class="product-detail-img" alt="${product.title}">
            <div class="product-detail-info">
                <div>Price (VND): ${product.price}</div>
                <div>Quantity: ${product.quantity}</div>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/products" class="back-link">Back to Product List</a>
    </div>
</div>
</body>
</html>