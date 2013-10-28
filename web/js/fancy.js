// JavaScript Document
jQuery.fn.fancy=function(){
$(this).live('click',function(e) {
if (!$('#popup1').length)
{
$('body').append('<div id="fancy1" style="z-index:10000;position: absolute; top:0px;background-color:#000;opacity:0.75; width:100%; height:100%;"></div>');
$('body').append('<div id="popup1" style="height: 100%; left: 50%; position: fixed; top: 50px; width: 100%;z-index: 10001;"></div>');
}
var url = $(this).attr('href');
$('body').css("position","relative");
$('#popup1').load(url);



e.preventDefault();
$('*').one('click',function(e){
idclick=e.target.id;/*saco el id de donde se hizo click */
var idpopup=($('#fancy1').find('div').attr('id'));
var idpopup=($('#popup1').find('div').attr('id'));
var padre = document.getElementById(idpopup);
Node=e.target;/*obtengo el nodo*/
if (((idclick!=idpopup) && !($.contains(padre,Node))) || (idclick==fancy1))/*compruebo si donde hizo click y si el nodo es hijo*/
{
$('#fancy1').remove();
$('#popup1').remove();
$('#'+idpopup).remove();

}
})
})
}