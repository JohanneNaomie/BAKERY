<%@ page import="java.util.List" %>
<%@ page import="material.*" %>
<%
    Ingredient ingredient = (Ingredient) request.getAttribute("ingredient");
    List<Unit> units = (List<Unit>) request.getAttribute("units");
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Ingredient</title>
</head>
<body>
    <form action="Ingredient" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id_ingredient" value="<% out.print(ingredient.getIdIngredient()); %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<% out.print(ingredient.getName()); %>" required><br><br>

        <label for="unit">unit: (<% out.print(ingredient.getUnit().getName()); %>)</label>
        <select name="unit" id="unit">
            <%
                for (Unit unit : units) {
                    out.print(unit.option());
                } 
            %>
        </select><br><br>
        <label for="stock">stock: </label>
        <input type="number" step="0.01" name="stock" id="stock" value="<% out.print(ingredient.getStock()); %>">

        
        <button type="submit">Update Ingredient</button>
    </form>
</body>
</html>