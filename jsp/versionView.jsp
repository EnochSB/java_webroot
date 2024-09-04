<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>​
<HTML>​
<BODY>​
      서버 버전 : <%=application.getServerInfo() %><br>​
      서블릿 버전 : <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %><br>​
      JSP 버전 : <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>​
</BODY>​
</HTML>