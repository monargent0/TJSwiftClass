<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 

        <%
        //http://localhost:8080/ios/student_delete_ios.jsp?code=
            request.setCharacterEncoding("utf-8");

            // 데이터 가져옴
            String code = request.getParameter("code");

            // Database 연결
            String url_mysql = "jdbc:mysql://localhost:3306/education?serverTimezone=Asia/Seoul&CharacterEncoding=utf8&useSSL=false"; 
            // jdbc: 자바데이터베이스컨넥트, 워크벤치 위치 localhost:3306, 뒤에 스키마 이름, 서버시간,한글인코딩(DB와 맞춤), 보안서버 없음
            String id_mysql = "root";
            String pw_mysql = "qwer1234";

            // Table에 Data 넣기
            PreparedStatement ps = null; // java.sql로 import되는 Class , sql문장 번역

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
                // 위에서 선언한것들 입력하여 연결

                String query = "delete from student where scode = ?";
                
                // 실행
                ps = conn_mysql.prepareStatement(query);
                ps.setString(1, code);

                ps.executeUpdate(); 
                conn_mysql.close(); // DB연결 해제

            }catch(Exception e){
                e.printStackTrace();
            }

        %>
