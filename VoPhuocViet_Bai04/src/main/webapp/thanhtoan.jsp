<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Giả sử cart đã lưu ở session
    beans.CartBean cart = (beans.CartBean) session.getAttribute("cart");
    if (cart == null) {
        cart = new beans.CartBean();
    }
    request.setAttribute("cart", cart);
%>
<html>
<head>
    <title>IUH BOOKSTORE - Checkout</title>
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
            min-height: 400px;
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
        .checkout-section {
            flex: 1;
            padding: 32px 36px;
        }
        .checkout-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 18px;
            text-align: center;
        }
        .checkout-form-container {
            width: 90%;
            margin: 0 auto;
            background: #f8f8f8;
            border: 1px solid #ccc;
            padding: 24px 18px 18px 18px;
            border-radius: 3px;
        }
        .checkout-form-row {
            display: flex;
            align-items: center;
            margin-bottom: 16px;
        }
        .checkout-form-label {
            width: 160px;
            font-size: 15px;
            font-weight: bold;
        }
        .checkout-form-input {
            flex: 1;
        }
        .checkout-form-input input[type="text"],
        .checkout-form-input input[type="number"] {
            width: 380px;
            padding: 6px;
            font-size: 15px;
            border: 1px solid #aaa;
            border-radius: 3px;
        }
        .checkout-form-input input[readonly] {
            background: #eee;
        }
        .checkout-form-methods {
            display: flex;
            gap: 18px;
        }
        .checkout-form-actions {
            margin-top: 18px;
            text-align: left;
        }
        .checkout-form-actions input[type="submit"], .checkout-form-actions input[type="button"] {
            background: #eee;
            border: 1px solid #bbb;
            padding: 6px 18px;
            margin-right: 8px;
            border-radius: 3px;
            font-size: 15px;
            cursor: pointer;
        }
        .checkout-form-actions input[type="submit"]:hover,
        .checkout-form-actions input[type="button"]:hover {
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
            <a href="${pageContext.request.contextPath}/cart">Shopping cart (<c:out value="${cart.items.size()}"/>)</a>
        </div>
    </div>
    <!-- Checkout Section -->
    <div class="checkout-section">
        <div class="checkout-title">Checkout - Already registered?</div>
        <div class="checkout-form-container">
            <form action="${pageContext.request.contextPath}/thanhtoan" method="post">
                <div class="checkout-form-row">
                    <div class="checkout-form-label">Fullname:</div>
                    <div class="checkout-form-input">
                        <input type="text" name="fullname" required/>
                    </div>
                </div>
                <div class="checkout-form-row">
                    <div class="checkout-form-label">Shipping address:</div>
                    <div class="checkout-form-input">
                        <input type="text" name="address" required/>
                    </div>
                </div>
                <div class="checkout-form-row">
                    <div class="checkout-form-label">Total price:</div>
                    <div class="checkout-form-input">
                        <input type="number" name="total" value="${cart.total}" readonly/>
                    </div>
                </div>
                <div class="checkout-form-row">
                    <div class="checkout-form-label">Payment method</div>
                    <div class="checkout-form-input checkout-form-methods">
                        <label><input type="radio" name="method" value="Paypal" required/>Paypal</label>
                        <label><input type="radio" name="method" value="ATM Debit"/>ATM Debit</label>
                        <label><input type="radio" name="method" value="Visa/Master card"/>Visa/Master card</label>
                    </div>
                </div>
                <div class="checkout-form-actions">
                    <input type="submit" value="Save"/>
                    <input type="button" value="Cancel" onclick="window.location='${pageContext.request.contextPath}/cart'"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>