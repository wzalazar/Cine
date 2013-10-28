<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="oAdmin" class="Entidades.Espectador" scope="session"/>

<%  
    HttpSession sesion = request.getSession();

    if (oAdmin == null) 
    {
        response.sendRedirect("index.jsp");
    }
    
    if (sesion.isNew())
    {
        response.sendRedirect("index.jsp");
        return;
    }
    
    if (sesion == null)
    {
        response.sendRedirect("index.jsp");
    }
    else
    {
        if (sesion.getAttribute("Logueado") == null)
        {
            response.sendRedirect("index.jsp");
        }
    }
%>

