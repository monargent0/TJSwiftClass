<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>title</title>
    </head>
    <body>
        <%
            int a = 30;
            int b = 20;

            int sum = a + b;
            int sub = a - b;
            int mul = a * b;
            int div = a / b;

            out.println(a + " 과 " + b + " 계산 <br>");
            out.println("덧셈 결과 : " + sum + "<br>");
            out.println("뺄셈 결과 : " + sub + "<br>");
            out.println("곱셈 결과 : " + mul + "<br>");
            out.println("나눗셈 결과 : " + div + "<br>");
            %>
    </body>
</html>