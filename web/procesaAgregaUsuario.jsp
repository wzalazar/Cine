
<%@page import="Entidades.Espectador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.DatosEspectadores"%>


<jsp:useBean id="oUsuario" class="Entidades.Espectador" scope="page"/>

<jsp:setProperty name="oUsuario" property="usuario" value="<%=request.getParameter(&quot;usuario&quot;)%>"/>
<jsp:setProperty name="oUsuario" property="password" value="<%=request.getParameter(&quot;password&quot;)%>"/>
<jsp:setProperty name="oUsuario" property="apellido" value="<%=request.getParameter(&quot;apellido&quot;) %>"/>
<jsp:setProperty name="oUsuario" property="nombre" value="<%=request.getParameter(&quot;nombre&quot;) %>"/>
<jsp:setProperty name="oUsuario" property="tipo" value="Espectador"/>
<jsp:setProperty name="oUsuario" property="DNI" value="<%=request.getParameter(&quot;dni&quot;) %>"/>


<%!

DatosEspectadores oDatosEspectador;

%>

<%
    oDatosEspectador = new DatosEspectadores();
    Espectador registrado=oDatosEspectador.BuscarEspectadorNombreUsuario(oUsuario.getUsuario());
   
    if (registrado==null)
    {
        try
        {
            oDatosEspectador.AgregarEspectador(oUsuario);
            %>
            <script>$('#btnRegistrarme').hide();</script><p id="ajaxRegistroT" style="color: green; font-size: 17px;  margin-left: 77px;  margin-top: -20px;">Gracias por regsitrarse.</p>
            <script>setTimeout(function(){$('#popup1').fadeOut(3000);$('#fancy1').fadeOut(3000)} , 000);</script><%
            //response.sendRedirect("index.jsp");
        }
        catch(Exception ex)
        {
            
        }
    }
    else
    {
         %>
            <script>setTimeout(function(){$('#ajaxRegistroError').fadeOut(2000);} , 000)</script><p id="ajaxRegistroError" style="color: red; font-size: 17px;  margin-left: 77px;  margin-top: -10px;">Usuario registrado, vuelva a intentarlo.</p>
         <%
         

    }

%>        
