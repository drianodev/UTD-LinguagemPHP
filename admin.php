<?php 

	include_once 'models/config.php';
	include_once 'controllers/validate.php';


	function page_content(){
		
		// Chamando o validador de opções
		validate_options();
	}


	include_once 'views/template.html';


?>