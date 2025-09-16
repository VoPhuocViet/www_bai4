<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Registration Success</title>
</head>
<body>
    <h2>Registration Successful!</h2>
    <p>Welcome, ${account.firstname} ${account.lastname}!</p>
    <p>Email: ${account.email}</p>
    <p>Date of Birth: ${account.dateofbirth}</p>
    <p>Gender: ${account.gender}</p>
    
    <a href="register.jsp">Register Another Account</a>
</body>
</html>