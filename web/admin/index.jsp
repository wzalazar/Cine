<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>...::: Cinema UTN :::...</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="js/plugins/jquery.flip.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.loginform button').hover(function(){
                $(this).stop().switchClass('default','hover');
            },function(){
                $(this).stop().switchClass('hover','default');
            });
	
            $('#login').submit(function(){
                var u = jQuery(this).find('#username');
                if(u.val() == '') {
                    jQuery('.loginerror').slideDown();
                    u.focus();
                    return false;	
                }
            });
	
            $('#username').keypress(function(){
                jQuery('.loginerror').slideUp();
            });
	
	
        });
    </script>
    <script type="text/javascript">
        $(function(){
            $("#flipPadingreso a:not(.revert)").bind("click",function(){
                var $this = $(this);
                $(".ingreso").flip({
                    direction: $this.attr("rel"),
	
                    onEnd: function(){$(".registro").show();$(".ingreso").hide();}
                })

                return false;
            });
        });

        $(function(){
            $("#flipPadregistro a:not(.revert)").bind("click",function(){
                var $this = $(this);
                $(".registro").flip({
                    direction: $this.attr("rel"),
	
                    onEnd: function(){$(".ingreso").show();$(".registro").hide();}
                })
                return false;
            });


        });
    </script>    
</head>

<body class="login">
    <div>
        <div style="width: 100%;">            
            <div style="position: relative; margin: auto; width: 400px; height:500px;">
                <div class="loginbox radius3 ingreso" style="position: absolute; top: 122px; left: -14px;">
                    <div class="loginboxinner radius3 ">
                        <div class="loginheader">
                            <h1 class="bebas">Ingresar</h1>
                            <div class="logo"></div>
                        </div><!--loginheader-->

                        <div class="loginform">
                            <div class="loginerror"><p>Nombre de usuario o password invalido</p></div>
                            <form method="post" action="Procesa.jsp" id="login">
                                <p>
                                    <label class="bebas" for="username">Nombre</label>
                                    <input class="radius2" name="Usuario" id="username" type="text">
                                </p>
                                <p>
                                    <label class="bebas" for="password">Password</label>
                                    <input class="radius2" name="Password" id="password" type="password">
                                </p>
                                <p>
                                    <button class="radius3 bebas default" style="background-color: steelblue; border-color: #2F2F2F; color: white;">Comenzar</button>
                                </p>                               
                            </form>
                        </div><!--loginform-->
                        
                    </div><!--loginboxinner-->
                </div>
                <div class="loginbox radius3 registro" style="position:absolute; top:0px; left:0px; display:none;">
                    <div class="loginboxinner radius3 ">
                        <div class="loginheader">
                            <h1 class="bebas">Registracion</h1>
                            <div class="logo"></div>
                        </div><!--loginheader-->

                        <div class="loginform">
                            <div class="loginerror"><p>Nombre de usuario o password invalido</p></div>
                            <form method="post" action="Procesa.jsp" id="login">
                                <p>
                                    <label class="bebas" for="username">Nombre</label>
                                    <input class="radius2" name="Usuario" id="username" type="text">
                                </p>
                                <p>
                                    <label class="bebas" for="password">Password</label>
                                    <input class="radius2" name="Password" id="password " type="password">
                                </p>
                                <p>
                                    <button class="radius3 bebas default" style="background-color: steelblue; border-color: #2F2F2F; color: white;">Registrarme</button>
                                </p>
                                <p><a class="whitelink small" href="">&nbsp;</a></p>
                            </form>
                        </div><!--loginform-->
                        <div id="flipPadregistro" style="position: absolute; right: 13px; top: 48px;">

                            <a class="bottom"  rev="#CCCCCC" rel="bt" href="#">Volver al login</a>

                        </div>
                    </div><!--loginboxinner-->
                </div>
            </div><!--loginbox-->
            <pre style="margin: auto; padding-top: 82px; text-align: center; clear: both; width:100%;">Sistema de registración de entradas de cine  -  U.T.N.  -  2012</pre>

        </div>
    </div>   
</body>
</html>
