<%@ page import="java.util.List" %>
<%@ page import="material.Unit" %>
<%

    List<Unit> units = (List<Unit>) request.getAttribute("units");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Block</title>
    <style>
        /* Style for typewriter effect */
        .typewriter {
            font-family: monospace;
            display: inline-block;
            border-right: 2px solid black;
            white-space: nowrap;
            overflow: hidden;
            width: 100%;
            animation: typing 3s steps(40, end), blink-caret 0.5s step-end infinite;
        }

        @keyframes typing {
            from { width: 0; }
            to { width: 100%; }
        }

        @keyframes blink-caret {
            from, to { border-color: transparent; }
            50% { border-color: black; }
        }
    </style>
</head>
<body>
    <h1>Insert a New Ingredient</h1>
    <form action="Ingredient" method="post">
        <input type="hidden" name="action" value="insert">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="unit">unit: </label>
        <select name="unit" id="unit">
            <%
                for (Unit unit : units) {
                    out.print(unit.option());
                } 
            %>
        </select><br><br>
        <label for="stock">stock: </label>
        <input type="number" name="stock" id="stock">

        
        <button type="submit">Insert Ingredient</button>
    </form>

</body>
</html>
