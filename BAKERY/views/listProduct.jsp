<%@ page import="java.util.List" %>
<%@ page import="material.Product" %>
<%

    List<Product> products = (List<Product>) request.getAttribute("products");
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>List product</h1>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Conservation Time</th>
                <th>action</th>
            </tr>
        </thead>
        <tbody>
            <%
            for( Product product : products){
                out.print(product.line());
            }
            %>
        </tbody>
    </table>
</body>
</html>