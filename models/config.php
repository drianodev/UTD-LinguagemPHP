<?php  

	// Nome do Projeto
	$project_name = "/projeto/project/";
	$project_index = "http://".$_SERVER['SERVER_NAME'].$project_name;
	$project_path = $_SERVER['DOCUMENT_ROOT'].$project_name;

	// VAriaveis globais
	$GLOBALS['project_index'] = $project_index;
	$GLOBALS['project_path'] = $project_path;

	
?>