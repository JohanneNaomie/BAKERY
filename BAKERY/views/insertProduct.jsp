
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
    <h1>Insert a New product</h1>
    <form action="Product" method="post">
        <input type="hidden" name="action" value="insert">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="stock">Conservation Time H: </label>
        <input type="number" step="0.01" name="conservation_time_h" id="conservation_time_h">

        
        <button type="submit">Insert Product</button>
    </form>

</body>
</html>
