<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="beans.CartBean" %>
<%@ page import="beans.CartItemBean" %>
<html>
<head>
    <title>IUH BOOKSTORE - Shopping Cart</title>
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
            min-height: 440px;
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
        .sidebar-cart {
            margin-top: 18px;
            font-size: 14px;
        }
        .cart-section {
            flex: 1;
            padding: 28px 30px;
        }
        .cart-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 18px;
            text-align: center;
        }
        table.cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 14px;
        }
        table.cart-table th, table.cart-table td {
            border: 1px solid #bbb;
            padding: 8px 6px;
            text-align: center;
        }
        table.cart-table th {
            background: #eee;
            font-size: 15px;
        }
        table.cart-table td {
            font-size: 14px;
        }
        .remove-link {
            color: #2196F3;
            text-decoration: underline;
            cursor: pointer;
        }
        .cart-total-row td {
            font-weight: bold;
            font-size: 15px;
            background: #fafafa;
        }
        .cart-actions {
            margin-top: 16px;
            text-align: left;
        }
        .cart-actions input[type="submit"], .cart-actions a {
            background: #eee;
            border: 1px solid #bbb;
            padding: 6px 18px;
            margin-right: 8px;
            border-radius: 3px;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
            color: #333;
        }
        .cart-actions input[type="submit"]:hover,
        .cart-actions a:hover {
            background: #e2e2e2;
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
        <div class="sidebar-cart">
            <a href="${pageContext.request.contextPath}/cart">Shopping cart (<c:out value="${(cart != null) ? cart.items.size() : 0}"/>)</a>
        </div>
    </div>
    <!-- Cart Section -->
    <div class="cart-section">
        <div class="cart-title">YOUR SHOPPING CART</div>
        <c:choose>
            <c:when test="${cart != null && !cart.items.isEmpty()}">
                <form action="${pageContext.request.contextPath}/cart" method="post">
                    <table class="cart-table">
                        <tr>
                            <th>Product ID</th>
                            <th>Product name</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                        <c:forEach var="item" items="${cart.items}">
                            <tr>
                                <td>${item.product.id}</td>
                                <td>${item.product.title}</td>
                                <td>${item.product.price}</td>
                                <td>
                                    <input type="number" name="quantity" min="1" value="${item.quantity}"
                                           style="width:40px;"
                                           onchange="this.form.action.value='update'; this.form.productId.value='${item.product.id}'; this.form.submit();"/>
                                </td>
                                <td>${item.subtotal}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="remove"/>
                                        <input type="hidden" name="productId" value="${item.product.id}"/>
                                        <input type="submit" value="Remove" class="remove-link"/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr class="cart-total-row">
                            <td colspan="4" style="text-align:right;">Total price</td>
                            <td colspan="2">(VND) ${cart.total}</td>
                        </tr>
                    </table>
                </form>
                <div class="cart-actions">
                    <!-- Nút Checkout: sang trang thanh toán -->
                    <a href="${pageContext.request.contextPath}/thanhtoan.jsp" class="checkout-btn">Checkout</a>
                    <!-- Nút Clear: xóa giỏ hàng -->
                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="clear"/>
                        <input type="submit" value="Clear cart"/>
                    </form>
                    <a href="${pageContext.request.contextPath}/products">Continue shopping</a>
                </div>
            </c:when>
            <c:otherwise>
                <div style="font-size:16px; color:#666;">Your cart is empty.</div>
                <br>
                <a href="${pageContext.request.contextPath}/products">Go to products</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>