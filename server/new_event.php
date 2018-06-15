<?php
  require('./conector.php');

  session_start();
  if (isset($_SESSION['username'])) {
         $con = new ConectorBD('localhost', 'evento_i', '54321');
         if ($con->initConexion('bd_agenda')=='OK') {
             $titulo = $_POST['titulo'];
             $start_date = $_POST['start_date'];

             $diaEntero=$_POST['allDay'];
             $end_date = $_POST['end_date'];
             $end_hour = $_POST['end_hour'];
             $start_hour = $_POST['start_hour'];
             
             $resultado_consulta = $con->obtenerIdUsuario($_SESSION['username']);
             if ($resultado_consulta->num_rows != 0) {
                  $fila = $resultado_consulta->fetch_assoc();
                  if ($con->insertarEvento(0,$titulo, $start_date, $start_hour,$end_date,$end_hour, $fila['usu_codigo'],$diaEntero)) {                  
                     $response['msg']= 'OK';
                  }else {
                     $response['msg']= 'No se pudo realizar la inserción de los datos';
                  }   

             }else{                 
                 $response['msg']= 'Problemas con la conexion de la sesion de usuario.';
             }
        }else {
            $response['msg']= 'No se pudo conectar a la base de datos';
        } 
        $con->cerrarConexion();
  }else {
    $response['msg']= 'No se ha iniciado una sesión';
  }  
  echo json_encode($response);


 ?>
