<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
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
        
        .tableDiv {
            text-align: center;
        }

        .InfoTable th {
            border-collapse: collapse;
            border-top: 3px solid #168;
            width: 800px;
            margin: auto;
        }

        .InfoTable tr {
            color: #168;
            background: rgb(219, 236, 230);
            text-align: center;
        }

        .InfoTable tr, .InfoTable td {
            padding: 10px;
            border: 1px, solid, #979597;
        }

        .InfoTable th:first-child, .InfoTable td:first-child {
            border-right: 0;
        }

        .InfoTable tr td:first-child {
            text-align: center;
        }

        .InfoTable caption {
            caption-side: top;
        }

        #topBanner {
            margin-top: 10px;
            margin-bottom: 10px;
            max-width: 500px;
            height: auto;
            display: block;
            margin: 0 auto;
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
</head>
<body>
    <div class="tableDiv">
        <img src="/images/logo.jpg" id="topBanner" alt="logo"><br>
        <h1>게시물 목록보기</h1>
        <table class="InfoTable">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            <tbody>
            <%
                // 요청, 응답에 대한 한글 처리
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");

                // DBMS 접속 관련 정보
                String uri = "jdbc:oracle:thin:@localhost:1521:xe";
                String uid = "webmaster";
                String pwd = "12345";
                
                String query = "select seqno, title, writer, to_char(regdate, 'YYYY-MM-DD HH24:MI:SS') as regdate from tbl_board order by seqno desc";
                System.out.println("[게시물 목록 보기 쿼리]: " + query);

                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                
                // throw를 못하기 때문에 try이용
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    con = DriverManager.getConnection(uri, uid, pwd);
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(query);

                    while(rs.next()){
            %>
                <tr onmouseover="this.style.background='#46D2D2'" onmouseout="this.style.background='white'">
                    <td><%= rs.getInt("seqno") %></td>
                    <td>
                        <a href='/board/view.jsp?seqno=<%=rs.getInt("seqno")%>' onmouseover="this.style.textDecoration='underline'"
                        onmouseout="this.style.textDecoration='none'"><%= rs.getString("title") %></a>
                    </td>
                    <td><%= rs.getString("writer") %></td>
                    <td><%= rs.getString("regdate") %></td>
                </tr>
            <%
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                }
                
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(con != null) con.close();

            %>
            </tbody>
        </table>
        <div class="bottom_menu">
            <a href="">글 쓰기</a>
        </div>
    </div>
</body>
</html>