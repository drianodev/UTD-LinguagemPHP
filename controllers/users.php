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
			$_POST['user_password'] = sha1($_POST['user_password']);
			$manager->insert_common("users", $_POST, null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;

		case 'edit':
			unset($_POST['action']);
			if($_POST['user_password'] == ""){
				unset($_POST['user_password']);
			}else{
				$_POST['user_password'] = sha1($_POST['user_password']);
			}		

			$manager->update_common("admin", $_POST, ['user_id'=>$_POST['user_id']],null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;

		case 'delete':
			$manager->delete_common("admin", ['user_id'=>$_GET['id']],null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;
	}



?>