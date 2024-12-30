<%@ page import="java.util.List" %>
<%@ page import="material.Ingredient" %>
<%

    List<Ingredient> ingredients = (List<Ingredient>) request.getAttribute("ingredients");
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste Ingredient</title>
</head>
<body>
    <%
    if (null!=error && !error.isEmpty()){
    out.print(error);
    }
    %>
    <h1>Liste Ingredient</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Stock</th>
            <th>Unit</th>
            <th>Last update</th>
            <th>action</th>
        </tr>
        <%
            for (Ingredient ingredient : ingredients){
                out.print(ingredient.line());
            }
        %>
    </table>
    <a href="Ingre"></a>
</body>
</html>