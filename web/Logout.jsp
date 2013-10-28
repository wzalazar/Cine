
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("Logueado");
    session.invalidate();
    request.getRequestDispatcher("index.jsp").forward(request, response);
    //response.sendRedirect("index.jsp");
  
%>



