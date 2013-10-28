jQuery(document).ready(function(){
	
	//image edit
	jQuery('.ajax').colorbox({
		onComplete: function(){
			jQuery('.cancel').click(function(){
				jQuery.fn.colorbox.close();
				return false;	//we use return false because we use button and to prevent form submission 
			});
			
			jQuery('#editphoto').submit(function(){
				var formdata = jQuery(this).serialize();	//get all form data
				var url = jQuery(this).attr('action');		//get the url to be submitted
				jQuery.post(url, formdata, function(data){							
					//if success, then show message notification as success message
					jQuery('.notifyMessage').addClass('notifySuccess');
					//otherwise
					//jQuery('.notifyMessage').addClass('notifyError');
					jQuery.fn.colorbox.resize();	
				});
				return false;
			});
		}
	});
	
	//a little image effectts
	jQuery('.imagelist img').hover(function(){
		jQuery(this).stop().animate({opacity: 0.75});
	},function(){
		jQuery(this).stop().animate({opacity: 1});
	});
	
	//image view
	jQuery('.view').colorbox();
	
	
	//delete image in grid list
	jQuery('.imagelist .delete').click(function(){
		var parent = jQuery(this).parents('li');
		var c = confirm('Delete this image?');
		if(c) parent.hide('explode',500);
	});
	
	
	//delete image in table list
	jQuery('.mediatable .delete').click(function(){
		var c = confirm("Continue delete?");
		if(c) jQuery(this).parents('tr').fadeOut();
		return false; //to prevent page reload
	});
	
	jQuery('#togglemenuleft a').trigger('click');
	
});