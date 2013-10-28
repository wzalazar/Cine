<%@page session="true" %>
<%@include file="ValidarAdmin.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        

	<!-- START OF HEADER -->
	<div class="header radius3">
    	<div class="headerinner">
        	
            <a href=""><img src="images/starlight_admin_template_logo_small.png" alt=""></a>
            
              
            <div class="headright">
            	<div class="headercolumn">&nbsp;</div>
            	<!--headercolumn-->
            	<div id="searchPanel" class="headercolumn">
                	<div class="searchbox">
                        <form action="" method="post">
                            <input aria-haspopup="true" aria-autocomplete="list" role="textbox" autocomplete="off" id="keyword" name="keyword" class="radius2 ui-autocomplete-input required" value="Search here" type="text"> 
                        </form>
                    </div><!--searchbox-->
                </div><div id="notiPanel" class="headercolumn">
                    <div class="notiwrapper">
                        <a href="ajax/messages.php" class="notialert radius2">5</a>
                        <div class="notibox">
                            <ul class="tabmenu">
                                <li class="current"><a href="ajax/messages.php" class="msg">Messages (2)</a></li>
                                <li><a href="ajax/activities.php" class="act">Recent Activity (3)</a></li>
                            </ul>
                            <br clear="all">
                            <div class="loader"><img src="images/loaders/loader3.gif" alt="Loading Icon"> Loading...</div>
                            <div class="noticontent"></div><!--noticontent-->
                        </div><!--notibox-->
                    </div><!--notiwrapper-->
                </div><div id="userPanel" class="headercolumn">
                    <a href="" class="userinfo radius2">
                        <img src="images/avatar.png" alt="" class="radius2">
                        <span><strong>Justin Meller</strong></span>
                    </a>
                    <div class="userdrop">
                        <ul>
                            <li><a href="">Profile</a></li>
                            <li><a href="">Account Settings</a></li>
                            <li><a href="index.html">Logout</a></li>
                        </ul>
                    </div><!--userdrop-->
                </div><!--headercolumn-->
                <!--headercolumn-->
            </div><!--headright-->
        
        </div><!--headerinner-->
	</div><!--header-->
    <!-- END OF HEADER -->
        
    <!-- START OF MAIN CONTENT -->
    <div class="mainwrapper">
     	<div class="mainwrapperinner">
         	
       <%@include file="left.jsp" %>
        
        <div class="maincontent noright">
             <a href="reservas.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
             <div class="content">
        	<div class="maincontentinner">
            	
              
               
                <div class="content">
                
                 
       
                    
                    <div class="contenttitle">
                    	<h2 class="form"><span>Agregue una reserva</span></h2>
                    </div><!--contenttitle-->
                    
                    <br>
                    
                    <form action="" method="post" class="stdform" id="form1" novalidate="novalidate">
                    	<p>
                        	<label>First Name</label>
                            <span class="field"><input type="text" class="longinput required" id="firstname" name="firstname"></span>
                        </p>
                        
                        <p>
                        	<label>Last Name</label>
                            <span class="field"><input type="text" class="longinput required" id="lastname" name="lastname"></span>
                        </p>
                        
                        <p>
                        	<label>Email</label>
                            <span class="field"><input type="text" class="longinput required" id="email" name="email"></span>
                        </p>
                        
                        <p>
                        	<label>Location</label>
                            <span class="field"><textarea id="location" class="mediuminput required" name="location" rows="5" cols="80"></textarea></span> 
                        </p>
                        
                        <p>
                        	<label>Select</label>
                            <span class="field">
                            <select id="selection" name="selection">
                            	<option value="">Choose One</option>
                                <option value="1">Selection One</option>
                                <option value="2">Selection Two</option>
                                <option value="3">Selection Three</option>
                                <option value="4">Selection Four</option>
                            </select>
                            </span>
                        </p>
                        
                       
                        
                        <p class="stdform">
                        	<button class="submit submit2 radius2">Submit Button</button>
                        </p>
                    </form>
                    
           
                    
               
                                        
                    
                </div><!--content-->
                
            </div>
            <div class="footer">
            	<p></p>
            </div><!--footer-->
            
        </div><!--maincontent-->
                        
     	</div><!--mainwrapperinner-->
    </div><!--mainwrapper-->
	<!-- END OF MAIN CONTENT -->
    </div>



<ul style="z-index: 1; top: 0px; left: 0px; display: none;" aria-activedescendant="ui-active-menuitem" role="listbox" class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"></ul>
    </body>
    <script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/plugins/error.js"></script>
</html>

