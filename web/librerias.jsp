<title>Cinema UTN</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />

<link rel="stylesheet" href="css/style.css" type="text/css" />
<!--[if IE 9]>
    <link rel="stylesheet" media="screen" href="css/ie9.css"/>
<![endif]-->

<!--[if IE 8]>
    <link rel="stylesheet" media="screen" href="css/ie8.css"/>
<![endif]-->

<!--[if IE 7]>
    <link rel="stylesheet" media="screen" href="css/ie7.css"/>
<![endif]-->
<script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="js/custom/general.js"></script>
<script type="text/javascript" src="js/plugins/wysiwyg/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="js/plugins/wysiwyg/wysiwyg.image.js"></script>
<script type="text/javascript" src="js/plugins/wysiwyg/wysiwyg.link.js"></script>
<script type="text/javascript" src="js/plugins/wysiwyg/wysiwyg.table.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
								
	jQuery('#wysiwyg').wysiwyg({
		controls: {
			indent: { visible: false },
			outdent: { visible: false },
			subscript: { visible: false },
			superscript: { visible: false },
			redo: { visible: false },
			undo: { visible: false },
			insertOrderedList: { visible: false },
			insertUnorderedList: { visible: false },
			insertHorizontalRule: { visible: false },
			insertTable: { visible: false },
			code: { visible: false },
			removeFormat: { visible: false },
			strikethrough: { visible: false },
			strikeThrough: { visible: false },
		}
	});
	
	jQuery('#wysiwyg2').wysiwyg({
		controls: { 
			cut: {visible: true },
			copy: { visible: true },
			paste: { visible: true }
		}
	});
});
</script>