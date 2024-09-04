<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
    <title>게시물 내용 보기</title>
</head>
<style>
    body {font-family: "나눔고딕", "맑은고딕";}
    h1 {font-family: "HY견고딕";}
    a:link {color: black;}
    a:visited {color: red;}
    a:hover {color: red;}
    a:active {color: red;}
    a {
        text-decoration: none;
        cursor: hand;
    }

    .mainDiv {text-align: center;}

    #topBanner {
        margin-top: 10px;
        margin-bottom: 10px;
        max-width: 500px;
        height: auto;
        display: block;
        margin: 0 auto;
    }

    .boardView {
        width: 900px;
        height: auto;
        margin: auto;
        padding: 20px 20px;
        background-color: white;
        border: 4px solid gray;
        border-radius: 20px;
    }

    .items {
        width: 90%;
        height: 25px;
        outline: none;
        color: #636e72;
        font-size: 16px;
        background: none;
        border-bottom: 2px solid #adadad;
        margin: 30px;
        padding: 10px 10px;
        text-align: left;
    }

    .textArea {
        width: 90%;
        height: 350px;
        overflow: auto;
        margin: 22px;
        padding: 10px;
        box-sizing: border-box;
        border: solid #adadad;
        text-align: left;
        font-size: 16px;
        resize: both;
    }

    .bottom_menu {
        margin-top: 20px;
    }

    .bottom_menu > a:link, .bottom_menu > a:visited {
        background-color: #FFA500;
        color: maroon;
        padding: 15px 25px;
        text-align: center;
        display: inline-block;
        text-decoration: none;
    }

    .bottom_menu > a:hover, .bottom_menu > a:active {
        background-color: #1E90FF;
        text-decoration: none;
    }
</style>
<%
    int seqno = Integer.parseInt(request.getParameter("seqno"));
%>
<body>
<%
    // 요청, 응답에 대한 한글 처리
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // DBMS 접속 관련 정보
    String uri = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "webmaster";
    String pwd = "12345";
    
    String writer = "";
    String title = "";
    String regdate = "";
    String content = "";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    String query = "select title, writer, to_char(regdate, 'YYYY-MM-DD HH24:MI:SS') as regdate, content from tbl_board where seqno = " + seqno;
    System.out.println("[게시물 상세 보기 쿼리]: " + query);

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection(uri, uid, pwd);
        stmt = con.createStatement();
        rs = stmt.executeQuery(query);
        
        if(rs.next() == true) {
            writer = rs.getString("writer");
            title = rs.getString("title");
            regdate = rs.getString("regdate");
            content = rs.getString("content");
        }
    
    } catch(Exception e) {
        e.printStackTrace();
    }

    if(rs != null) rs.close();
    if(stmt != null) stmt.close();
    if(con != null) con.close();
%>

<div class="mainDiv">
    <img src="/images/logo.jpg" id="topBanner"><br>
    <h1>게시물 내용 보기</h1>
    <br>

    <div class="boardView">
        <div class="items">이름: <%= writer %></div>
        <div class="items">제목: <%= title %></div>
        <div class="items">날짜: <%= regdate %></div>
        <div class="textArea"><pre><%= content %></pre></div>
    </div>

    <div class="bottom_menu">
        <a href="/board/list.jsp">목록가기</a>
        <a href="/board/write.jsp">글 쓰기</a>
        <a href="/board/modify.jsp">글 수정</a>
        <a href="/board/delete.jsp">글 삭제</a>
    </div>
    <br><br>
</div>
</body>
</html>