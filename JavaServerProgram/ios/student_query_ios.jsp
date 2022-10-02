<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="org.json.simple.JSONObject" %> 
<%@ page import="org.json.simple.JSONArray" %>

<%
    // http://localhost:8080/ios/student_query_ios.jsp
    request.setCharacterEncoding("utf-8");

    // 데이터 받음
    // String userid = request.getParameter("userid");

    // Database 연결
    String url_mysql = "jdbc:mysql://localhost:3306/education?serverTimezone=Asia/Seoul&CharacterEncoding=utf8&useSSL=false"; 
    // jdbc: 자바데이터베이스컨넥트, 워크벤치 위치 localhost:3306, 뒤에 스키마 이름, 서버시간,한글인코딩(DB와 맞춤), 보안서버 없음
    String id_mysql = "root";
    String pw_mysql = "qwer1234";

    // JSON 생성하기 
    JSONArray itemList = new JSONArray();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        // 위에서 선언한것들 입력하여 연결
        Statement stmt_mysql = conn_mysql.createStatement();

        String query = "select scode,sname,sdept,sphone from student";
        
        ResultSet rs = stmt_mysql.executeQuery(query);

        while(rs.next() ){
            // JSON 모양 생성
            JSONObject tempJson = new JSONObject(); // 반복문 돌때마다 생성
            tempJson.put("scode", rs.getString(1) ); // {}안에 key값이랑 데이터 넣음
            tempJson.put("sname", rs.getString(2) );
            tempJson.put("sdept", rs.getString(3) );
            tempJson.put("sphone", rs.getString(4) );
            itemList.add(tempJson); // 전체 데이터에 추가
        }

        conn_mysql.close(); // DB연결 해제
        out.println(itemList); // 화면에 json 출력 

    }catch(Exception e){
        e.printStackTrace();
    }

%>
