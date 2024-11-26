<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Variables to hold input, results, and messages
    String num1Param = request.getParameter("num1");
    String num2Param = request.getParameter("num2");
    String operation = request.getParameter("operation");

    double result = 0;
    String message = null;

    if (num1Param != null && num2Param != null && operation != null) {
        try {
            double num1 = Double.parseDouble(num1Param);
            double num2 = Double.parseDouble(num2Param);

            switch (operation) {
                case "add":
                    result = num1 + num2;
                    message = "Addition";
                    break;
                case "subtract":
                    result = num1 - num2;
                    message = "Subtraction";
                    break;
                case "multiply":
                    result = num1 * num2;
                    message = "Multiplication";
                    break;
                case "divide":
                    if (num2 != 0) {
                        result = num1 / num2;
                        message = "Division";
                    } else {
                        message = "Error: Division by zero!";
                    }
                    break;
                default:
                    message = "Invalid Operation!";
            }
        } catch (NumberFormatException e) {
            message = "Error: Invalid number input!";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
    <h1>Simple Calculator</h1>
    <form method="post">
        Number 1: <input type="text" name="num1" value="<%= num1Param != null ? num1Param : "" %>"><br>
        Number 2: <input type="text" name="num2" value="<%= num2Param != null ? num2Param : "" %>"><br>
        Operation:
        <select name="operation">
            <option value="add" <%= "add".equals(operation) ? "selected" : "" %>>Add</option>
            <option value="subtract" <%= "subtract".equals(operation) ? "selected" : "" %>>Subtract</option>
            <option value="multiply" <%= "multiply".equals(operation) ? "selected" : "" %>>Multiply</option>
            <option value="divide" <%= "divide".equals(operation) ? "selected" : "" %>>Divide</option>
        </select><br>
        <input type="submit" value="Calculate">
    </form>

    <% if (num1Param != null && num2Param != null && operation != null) { %>
        <h2>Result:</h2>
        <% if (message != null && message.startsWith("Error")) { %>
            <p style="color: red;"><%= message %></p>
        <% } else { %>
            <p><%= message %>: <%= result %></p>
        <% } %>
    <% } %>
</body>
</html>
