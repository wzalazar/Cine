jQuery(document).ready(function(){

	jQuery('.chatsearch input').bind('focusin focusout',function(e){
		if(e.type == 'focusin') {
			if(jQuery(this).val() == 'Search') jQuery(this).val('');	
		} else {
			if(jQuery(this).val() == '') jQuery(this).val('Search');	
		}
	});
	
	jQuery('.messagebox button').click(function(){
		enterMessage();
	});
	
	jQuery('.messagebox input').keypress(function(e){
		if(e.which == 13)
			enterMessage();
	});
	
	function enterMessage() {
		var msg = jQuery('.messagebox input').val();										
		if(msg != '') {
			jQuery('#chatmessageinner').append('<p><strong>You:</strong> '+msg+'</p>');
			jQuery('.messagebox input').val('');
			jQuery('.messagebox input').focus();
			jQuery('#chatmessageinner').animate({scrollTop: jQuery('#chatmessageinner').height()});
						
			window.setTimeout(  
				function() {  
					//this is just a sample reply when somebody send a message
					jQuery('#chatmessageinner').append('<p><strong>Joey Lacaba:</strong> This is an automated reply!!</p>', function(){
						jQuery(this).animate({scrollTop: jQuery(this).height()});
					});
				}, 1000);			
		}	
	}
	
});
