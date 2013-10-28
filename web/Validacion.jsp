<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="oEspectador" class="Entidades.Espectador" scope="session"/>

<%  
    HttpSession sesion = request.getSession();

    if (oEspectador == null) 
    {
        request.getRequestDispatcher("login.jsp").forward(request, response);
        //response.sendRedirect("login.jsp");
    }
    
    if (sesion.isNew())
    {
        request.getRequestDispatcher("login.jsp").forward(request, response);
      //  response.sendRedirect("login.jsp");
        return;
    }
    
    if (sesion == null)
    {
        request.getRequestDispatcher("login.jsp").forward(request, response);
       // response.sendRedirect("login.jsp");
    }
    else
    {
        if (sesion.getAttribute("Logueado") == null)
        {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //response.sendRedirect("login.jsp");
        }
    }

%>


