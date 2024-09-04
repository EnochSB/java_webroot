package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/servlet/hostInfo")    // URL 경로
public class Hostinfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<HTML><HEAD><TITLE>HelloServlet</TITLE></HEAD>");
        out.println("<BODY>");
        out.println("<h>안녕하세요? 서블릿 테스트 예제입니다.</h2>");
        out.println("<H2> Clinet IP: " + request.getRemoteAddr() + "</H2>");
        out.println("<H2> Client Host : " + request.getRemoteHost() + "</H2>");
        out.println("<H2> Request URI : " + request.getRequestURI() + "</H2>");
        out.println("</BODY></HTML>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){

    }
}

// IDE의 JAVA PROJECTS의 Referenced Libraries를 통해 C:\apache-tomcat-10.1.6\lib\servlet-api.jar 추가