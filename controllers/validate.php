<?php  

	function validate_options(){

		if(!isset($_GET['op'])){
			return false;
		}

		// Incluindo os arquivos necessários
		include_once dirname(__DIR__).'/models/class/Connect.class.php';
		include_once dirname(__DIR__).'/models/class/Manager.class.php';

		switch($_GET['op']){

			case 'manager-users':
				$manager = new Manager;
				$produto = $manager->select_common("admin", null,null,null);
				include_once $GLOBALS['project_path'].'/views/users/manager-users.html';
			break;

			case 'insert-user':
				include_once $GLOBALS['project_path'].'/views/users/insert-user.html';
			break;

			case 'edit-user':
				$manager = new Manager;
				$produto = $manager->select_common("Produto", null,['codproduto'=>$_GET['codproduto']],null);		
				include_once $GLOBALS['project_path'].'/views/users/edit-user.html';
			break;

		}

	}



?>