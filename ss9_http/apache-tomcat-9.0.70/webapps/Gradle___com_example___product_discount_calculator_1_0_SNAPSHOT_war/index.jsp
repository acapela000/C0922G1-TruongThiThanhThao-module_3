<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1> <%= "Product Discount Calculator" %> </h1>
<br/>

<p>Đây là ứng dụng Product Discount Calculator
    giúp người dùng tính chiết khấu cho sản phẩm khi mua hàng online.
</p>

<form action="/display-discount" method="post">

<input type="text" name="product_description" placeholder="Product description">
<input type="number" name="list_price" placeholder="List price">
<input type="number" name="discount_percent" placeholder="Discount Percent">
<button type="submit">Calculate discount</button>

</form>

</body>
</html>