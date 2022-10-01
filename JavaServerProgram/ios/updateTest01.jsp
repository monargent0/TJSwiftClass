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
        <!-- http://localhost:8080/ios/updateTest01.jsp?userid=james&password=1234 -->
        <%
            request.setCharacterEncoding("utf-8");

            // 데이터 가져옴
            String userid = request.getParameter("userid");
            String password = request.getParameter("password");

            // Database 연결
            String url_mysql = "jdbc:mysql://localhost:3306/ios?serverTimezone=Asia/Seoul&CharacterEncoding=utf8&useSSL=false"; 
            // jdbc: 자바데이터베이스컨넥트, 워크벤치 위치 localhost:3306, 뒤에 스키마 이름, 서버시간,한글인코딩(DB와 맞춤), 보안서버 없음
            String id_mysql = "root";
            String pw_mysql = "qwer1234";

            // Table에 Data 넣기
            PreparedStatement ps = null; // java.sql로 import되는 Class , sql문장 번역

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
                // 위에서 선언한것들 입력하여 연결

                String query = "update wtest set password = ? where id = ?";
                
                // 실행
                ps = conn_mysql.prepareStatement(query);
                ps.setString(1, password);
                ps.setString(2, userid);

                ps.executeUpdate(); 
                conn_mysql.close(); // DB연결 해제

            }catch(Exception e){
                e.printStackTrace();
            }

            out.println("수정이 되었습니다.");
        %>
    </body>
</html>