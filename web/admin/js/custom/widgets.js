jQuery(document).ready(function(){
	//datepicker
	jQuery('#datepicker').datepicker();
	
	//show tabbed widget
	jQuery('#tabs').tabs();
	
		//////////// CHARTS /////////////////
		var flash = [], html5 = [];
		for (var i = 0; i < 14; i += 0.5) {
			flash.push([i, Math.sin(i)]);
			html5.push([i, Math.cos(i)]);
		}
		
		function showTooltip(x, y, contents) {
			jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5
			}).appendTo("body").fadeIn(200);
		}

		
		var plot = jQuery.plot(jQuery("#chartplace"),
			   [ { data: flash, label: "Flash(x)", color: "#069"}, { data: html5, label: "HTML5(x)", color: "#ff0000"} ], {
				   series: {
					   lines: { show: true },
					   points: { show: true }
				   },
				   grid: { hoverable: true, clickable: true },
				   yaxis: { min: -1.2, max: 1.2 }
				 });
		
		var previousPoint = null;
		jQuery("#chartplace").bind("plothover", function (event, pos, item) {
			jQuery("#x").text(pos.x.toFixed(2));
			jQuery("#y").text(pos.y.toFixed(2));
			
			if(item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    
                    jQuery("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);
                    
                    showTooltip(item.pageX, item.pageY,
                                item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                jQuery("#tooltip").remove();
                previousPoint = null;            
            }
	
		});
	
		jQuery("#chartplace").bind("plotclick", function (event, pos, item) {
			if (item) {
				jQuery("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
				plot.highlight(item.series, item.datapoint);
			}
		});

});
