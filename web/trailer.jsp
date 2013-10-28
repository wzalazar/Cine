<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Documento sin t�tulo</title>
        <link href="css/style_window.css" rel="stylesheet" type="text/css"/>
         <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    </head>

    <body>
        <div id="popupvideo">
             <div id="video"></div>
        </div>
        <script>    
function cargarTrailer(idPelicula)
{
      $.getJSON("http://api.themoviedb.org/3/movie/"+idPelicula+"/trailers?api_key=23afca60ebf72f8d88cdcae2c4f31866", function(json) {
      $('#video').html('<p style="color: salmon; font-size: 13px; font-weight: bold; margin-top: 17px;">Lo sentimos mucho el trailer no esta disponible por el momento.</p>'
	                   +'<p style="color: slategrey; font-size: 13px; font-weight: bold; ">Muchas Gracias.</p>');

		$.each(json.youtube, function(key, val) {
				var codigo=val.source;
				$('#video').html('<iframe  width="636" height="358" src="http://www.youtube.com/embed/'+codigo+'?rel=0&autoplay=1"'
				                +'frameborder="0" allowfullscreen></iframe>');
			});
		});
}
</script>
<script>
<%
int idPelicula=Integer.parseInt(request.getParameter("idvideo"));
out.print("cargarTrailer("+idPelicula+")");
%>
</script>
    </body>


</html>
