<%@ page import="material.*" %>
<%
    Product product = (Product) request.getAttribute("product");
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
</head>
<body>
    <form action="Product" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id_product" value="<% out.print(product.getIdProduct()); %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<% out.print(product.getName()); %>" required><br><br>

        <label for="stock">conservation time: </label>
        <input type="number" step="0.01" name="conservation_time_h" id="stock" value="<% out.print(product.getConservatonTimeH()); %>">

        
        <button type="submit">Update Product</button>
    </form>
</body>
</html>