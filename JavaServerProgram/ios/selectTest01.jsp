<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> <!-- SQL 기능 import -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>title</title>
    </head>
    <body>
        <!-- http://localhost:8080/ios/selectTest01.jsp -->
        <%
            request.setCharacterEncoding("utf-8");

            // 데이터 받음
            // String userid = request.getParameter("userid");

            // Database 연결
            String url_mysql = "jdbc:mysql://localhost:3306/ios?serverTimezone=Asia/Seoul&CharacterEncoding=utf8&useSSL=false"; 
            // jdbc: 자바데이터베이스컨넥트, 워크벤치 위치 localhost:3306, 뒤에 스키마 이름, 서버시간,한글인코딩(DB와 맞춤), 보안서버 없음
            String id_mysql = "root";
            String pw_mysql = "qwer1234";

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
                // 위에서 선언한것들 입력하여 연결
                Statement stmt_mysql = conn_mysql.createStatement();

                String query = "select id, password from wtest";
                
                ResultSet rs = stmt_mysql.executeQuery(query);

                while(rs.next() ){
                    out.println(rs.getString(1));
                    out.println("\t");
                    out.println(rs.getString(2) + "<br>");
                }

                conn_mysql.close(); // DB연결 해제

            }catch(Exception e){
                e.printStackTrace();
            }

            out.println("출력 되었습니다.");
        %>
    </body>
</html>