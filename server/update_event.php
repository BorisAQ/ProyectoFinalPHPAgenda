<?php
   require('./conector.php');

  session_start();
  if (isset($_SESSION['username'])) {
         $con = new ConectorBD('localhost', 'evento_u', '12345');
         if ($con->initConexion('bd_agenda')=='OK') {
             $id = $_POST['id'];
             $start_date = $_POST['start_date'];
             $end_date = $_POST['end_date'];
             $start_hour = $_POST['start_hour'];
             $end_hour = $_POST['end_hour'];


             $con->actualizarEvento($id,$start_date, $start_hour, $end_date,$end_hour);             
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
