package board;

import java.sql.Statement;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/write")
public class write extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException{
        doPost(request, response);  // POST만 처리하기 때문에 안적어도 상관 없다.
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException{
        request.setCharacterEncoding("UTF-8");

        String uri = "jdbc:oracle:thin:@localhost:1521:xe";
        String uid = "webmaster";
        String pwd = "12345";

        Connection con = null;
        Statement stmt = null;

        String writer = request.getParameter("writer");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        String query = "insert into tbl_board (seqno,writer,title,content,regdate)"
                        + " values (tbl_board_seq.nextval, '" + writer +"','" + title
                        + "','" + content + "',sysdate)";
        System.out.println("[게시물 등록 쿼리]: " + query);

        
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(uri, uid, pwd);
            stmt = con.createStatement();
            stmt.executeUpdate(query);
            
            if(stmt != null) stmt.close();
            if(con != null) con.close();
            
            response.sendRedirect("/board/list.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }

    }
}
