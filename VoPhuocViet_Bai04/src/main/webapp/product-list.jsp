<%-- Created by IntelliJ IDEA. User: nguye Date: 9/15/2025 Time: 12:37 AM --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Product List</title>
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .product-class {
            border: 1px solid #ccc;
            margin: 10px;
            padding: 10px;
            width: 220px;
            text-align: center;
            vertical-align: top;
        }
        .hinh {
            width: 150px;
            height: 200px;
            object-fit: cover;
            display: block;
            margin: 0 auto;
        }
        .product-name {
            font-weight: bold;
            margin: 10px 0;
            min-height: 40px; /* giữ đều chiều cao */
        }
        .price {
            font-weight: bold;
            color: red;
            margin: 5px 0;
        }
        .quantity {
            margin: 5px 0;
        }
        .product-detail-link, .add-to-cart-btn {
            display: block;
            margin: 5px 0;
            text-decoration: none;
        }
        .product-detail-link {
            color: #2196F3;
        }
        .product-detail-link:hover {
            text-decoration: underline;
        }
        .add-to-cart-btn {
            background-color: #4CAF50;
            color: white;
            padding: 6px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }
        .add-to-cart-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<p style="text-align: right; margin: 10px;">
    <a href="cart">View Cart</a>
</p>

<div class="container">
    <c:forEach items="${products}" var="p">
        <div class="product-class">
            <!-- Tên sách -->
            <div class="product-name">${p.title}</div>

            <!-- Ảnh sách -->
            <img src="${pageContext.request.contextPath}/images/${p.imgURL}" class="hinh" alt="${p.title}">

            <!-- Giá -->
            <div class="price">Price: ${p.price} đ</div>

            <!-- Số lượng -->
            <div class="quantity">Quantity: ${p.quantity}</div>

            <!-- Link chi tiết sản phẩm -->
            <a href="${pageContext.request.contextPath}/product?id=${p.id}" class="product-detail-link">
                Product details
            </a>

            <!-- Nút Add to cart -->
            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="id" value="${p.id}">
                <input type="hidden" name="price" value="${p.price}">
                <input type="hidden" name="title" value="${p.title}">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="quantity" value="1">
                <input type="submit" name="addToCart" value="Add to cart" class="add-to-cart-btn">
            </form>
        </div>
    </c:forEach>
</div>
</body>
</html>
