<?php  

	ini_set("display_errors", 1);

	// Incluindo os arquivos necessários
	include_once dirname(__DIR__).'/models/config.php';
	include_once dirname(__DIR__).'/models/class/Connect.class.php';
	include_once dirname(__DIR__).'/models/class/Manager.class.php';

	$manager = new Manager;

	if(isset($_GET['action']) && $_GET['action'] == "delete"){
		$_POST['action'] = "delete";
	}


	switch ($_POST['action']) {
		
		case 'add':
			unset($_POST['action']);
			$_POST['codproduto'] = ($_POST['codproduto']);
			$manager->insert_common("Produto", $_POST, null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;

		case 'edit':
			unset($_POST['codproduto']);
			if($_POST['codproduto'] == ""){
				unset($_POST['codproduto']);
			}else{
				$_POST['codproduto'] = ($_POST['codproduto']);
			}		

			$manager->update_common("Produto", $_POST, ['codproduto'=>$_POST['codproduto']],null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;

		case 'delete':
			$manager->delete_common("Produto", ['codproduto'=>$_GET['id']],null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;
	}



?>