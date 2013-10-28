<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("Logueado");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>


