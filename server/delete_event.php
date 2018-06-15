<?php
  require('./conector.php');

  session_start();
  if (isset($_SESSION['username'])) {
         $con = new ConectorBD('localhost', 'evento_d', '12345');
         if ($con->initConexion('bd_agenda')=='OK') {
             $id = $_POST['id'];
             $con->eliminarEvento($id);             
             $response['msg']= 'OK';             
        }else {
            $response['msg']= 'No se pudo conectar a la base de datos';
        } 
        $con->cerrarConexion();
  }else {
    $response['msg']= 'No se ha iniciado una sesión';
  }  
  echo json_encode($response);


 ?>
