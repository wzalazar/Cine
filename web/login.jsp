<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Documento sin tï¿½tulo</title>
        <link href="css/style_window.css" rel="stylesheet" type="text/css"/>
         <script type="text/javascript" src="js/jquery.min.js"></script>
         <script type="text/javascript" src="js/jquery.form.js"></script>
         <script type="text/javascript" src="js/jquery.validate.min.js"></script>
         <script type="text/javascript" src="js/error.js"></script>
    </head>
   

    <body>
        <div id="popup" style="height:240px !important"> 
            <div style="text-align:center; width:100%;">
                <h2><span>Ingresar a Cinema</span></h2>
            </div>
             <form action="Procesa.jsp" method="post"  id="formLogin">
                <p>
                    <label>Nombre</label>
                    <span class="field"><input type="text" class="longinput required" id="Usuario" name="Usuario"></span>
                </p>
                <p>
                    <label>Password</label>
                    <span class="field"><input type="password" class="longinput required" id="Password" name="Password"></span>
                </p>
                <br>
                    <p class="stdformbutton">
                        <button  class="button">¡Entrar!</button>
                    </p>
                    <div id="ajaxLogin"></div>
            </form>
        </div>
    </body>
    <script>
         $('#formLogin').ajaxForm({
            target: '#ajaxLogin',
            success: function() {
                $('#ajaxLogin').fadeIn('slow');
            }
        });
    </script>
</html>
