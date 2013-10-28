<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
          <script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
        <script type="text/javascript" src="js/plugins/jquery.validate.min.js"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="mainwrapper" style="overflow: hidden">
            <div class="mainwrapperinner">
                <%@include file="left.jsp" %>
                <div class="maincontent noright">
                    <a href="peliculas.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Buscar peliculas por titulo:</span></h2>
                                </div>
                                <br>
                                <section id="fetch">
                                    <input style="width: 172px; height: 36px;" type="text" placeholder="Ingrese la pelicula" id="term" />
                                    <form  class="stdform" >

                                        <p class="stdform" style="width: 130px ! important; margin-left: 184px ! important; margin-top: -35px ! important;">
                                        <button class="submit radius2"  id="search" >Buscar pelicula</button></p>
                                    </form>
                                </section>
                                <section id="poster" style="padding-top:20px; height: 130px;"> </section>
                                <form action="procesaAgregaPelicula.jsp" method="post" class="stdform" id="form1">
                                    <input id="idvideo" type="hidden"  name="idvideo" />
                                    <input id="titulo" type="hidden"  name="titulo" />
                                    <input id="imagenposter" type="hidden"  name="poster"  />
                                    <input id="descripcion" type="hidden"  name="descripcion" />
                                    <input id="genero" type="hidden"  name="genero" />
                                    <p id="guardarfilm" class="stdformbutton" style="margin-left: 112px !important; display: none"><button class="submit radius2" >Agregar</button></p>
                                </form>
                            </div>
                        </div> 
                    </div>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Ultimas peliculas en el cine</span></h2>
                                </div>
                                <br>
                                <div id="peliculas" style="height: 100%;"></div>
                                <div style="clear:both;"></div>
                            </div>
                        </div> 
                    </div>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Agregue una película</span></h2>
                                </div>
                                <br>
                                <form action="procesaAgregaPelicula.jsp" method="post" class="stdform" id="formPeliculas">
                                    <p>
                                        <label>Titulo</label>
                                        <span class="field"><input type="text" class="longinput required" id="titulo" name="titulo"></span>
                                    </p>
                                    <p>
                                        <label>Url imagen</label>
                                        <span class="field"><input type="text" class="longinput required url" id="poster" name="poster"></span>
                                    </p>
                                    <p>
                                        <label>Descripcion</label>
                                        <span class="field"><textarea id="descripcion" class="mediuminput required" name="descripcion" rows="5" cols="80"></textarea></span> 
                                    </p>
                                    <p>
                                        <label>Genero</label>
                                        <span class="field"><input type="text" class="longinput required" id="genero" name="genero"></span>
                                    </p>
                                    <p>
                                        <label>Trailer</label>
                                        <span class="field"><input type="text" class="longinput required" id="idvideo" name="idvideo"></span>
                                    </p>

                                    <p class="stdform">
                                        <button class="submit submit2 radius2">Agregar</button>
                                    </p>
                                </form>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                $("#formPeliculas").validate();
              });
        </script>
        <script>

            $(document).ready(function(){

                $('#term').focus(function(){
                    var full = $("#poster").has("img").length ? true : false;
                    if(full == false){
                        $('#poster').empty();
                    }
                });

                var getPoster = function(){

                    var film = $('#term').val();

                    if(film == ''){            

                    } else {

           
                        var jqxhr=$.getJSON("http://api.themoviedb.org/2.1/Movie.search/en/json/23afca60ebf72f8d88cdcae2c4f31866/" + film + "?callback=?", function(json) {
                            try{
                                jqxhr.overrideMimeType('text/html; charset=iso-8859-1');
                            }
                            catch(e){
 
 
                            }
                            if (json != "Nothing found."){
                                   
                                $('#poster').html('<img style="position: absolute;" id="thePoster" src='+json[0].posters[0].image.url+'/><h1 style="padding-left: 110px; padding-bottom: 13px;">'+json[0].name+'</h1><p style="padding-left: 110px;">'+json[0].overview+'</p> '); 
                                $("#idvideo").attr("value",json[0].id);
                                $("#titulo").attr("value",limpiarTexto(json[0].name)); $('#guardarfilm').show();
                                $("#descripcion").attr("value",limpiarTexto(json[0].overview));
                                $("#imagenposter").attr("value",json[0].posters[0].image.url);
                                $.getJSON("http://api.themoviedb.org/3/movie/7555?api_key=23afca60ebf72f8d88cdcae2c4f31866", function(data) {
                                    // $("#genero").attr("value",data.genres);
                                    var items = [];
                                    $.each(data.genres, function(key, val) {
                                        //  items.push('<li id="' + key + '">' + val.name + '</li>');
                                        if (key==0)
                                        {
                                            $("#genero").attr("value",val.name);
                                        }
                                    });

                                
                                })
					 

                                $('<ul/>', {
                                    'class': 'my-new-list',
                                    html: items.join('')
                                }).appendTo('body');
									   
                            } else {
                                $.getJSON("http://api.themoviedb.org/2.1/Movie.search/en/json/23afca60ebf72f8d88cdcae2c4f31866/goonies?callback=?", function(json) {
                                    console.log(json);
                                    $('#poster').html('<h2 class="loading">Were afraid nothing was found for that search. Perhaps you were looking for The Goonies?</h2><img id="thePoster" src=' + json[0].posters[0].image.url + ' />');
                                });
                            }
                        });

                    }

                    return false;
                }

                $('#search').click(getPoster);
                $('#term').keyup(function(event){
                    if(event.keyCode == 13){
                        getPoster();
                    }
                });
  
            }); 
             $(document).ready(function(){  
                $.getJSON("http://api.themoviedb.org/3/movie/upcoming?api_key=23afca60ebf72f8d88cdcae2c4f31866", function(data) {
                    var items = [];
                    var id=[];
                    $.each(data.results, function(key, val) {
                        items.push('<div style="width:100%; ">');
                        items.push('<div style="float:left; width:250px; height:220px;position:relative;margin-bottom:20px;">');
                        items.push('<li id="'+key+'"><img height="138" id="thePoster" src="http://cf2.imgobject.com/t/p/w92/' + val.poster_path + '" /></li>');
								
                        id.push(val.id);
                        items.push('<li id="'+key+' ><h4 style="height:21px;overflow:hidden;">'+limpiarTexto(val.original_title)+'</h4></li>');
                        items.push('<li id="'+key+'">'+val.release_date+'</li>');
								
                        items.push('<form class="stdform" id="'+val.id+'"  action="procesaAgregaPelicula.jsp" method="post">');
                        items.push('<input type="hidden" name="idvideo" value="'+val.id+'" />');
                        items.push('<input type="hidden" name="titulo" value="'+limpiarTexto(val.title)+'" />');
                        items.push('<input type="hidden" name="release_date" value="'+val.release_date +'"/>');
                        items.push('<input type="hidden" name="poster" value="http://cf2.imgobject.com/t/p/w92/'+val.poster_path+'" />');
                        items.push('<p  class="stdformbutton" style="margin-left: 0px !important;"><img src="images/loader3.gif"/></p>');
                        items.push('</form>');
                        items.push('</div>');
                        items.push('</div>');
								
								
								
							
                    })
							
                    $.each(id, function(key, val) {
						
                        $.getJSON("http://api.themoviedb.org/3/movie/"+val+"?api_key=23afca60ebf72f8d88cdcae2c4f31866", function(data3) {
                            
                            $("#"+val+"").append('<input type="hidden" id="descripcion'+key+'"  name="descripcion" value="" />');
                            var desc=limpiarTexto(data3.overview);
                            $("#descripcion"+key+"").attr("value",desc);
                            $.each(data3.genres, function(key, val2) {
                                $("#"+val+"").append('<input type="hidden" name="genero" value="'+limpiarTexto(val2.name)+'" />');
                               
                            })
                           $("#"+val+"").append('<p  class="stdformbutton" style="margin-left: 0px !important;"><input type="submit" value="Guardar" style="position:absolute;bottom:0px;left:0px"/></p>');
                        });
							
							
                    });
							
							
                    $('<ul/>', {
                        'class': 'my-new-list',
                        html: items.join('')
                    }).appendTo('#peliculas');
                });
					 
            });
            
           function limpiarTexto(texto)
           { 
              var cadena=""+texto+"";
              cadena=cadena.replace(/'/g," ");  
              return cadena;
           }

 
        </script>
       
    </body>
</html>

