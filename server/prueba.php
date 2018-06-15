<?php
require('./conector.php');

  session_start();
  if (isset($_SESSION['username'])) {
         $con = new ConectorBD('localhost', 'evento_i', '54321');
         
         if ($con->initConexion('bd_agenda')=='OK') {
             $titulo = 'Evento Prueba';
             $start_date = '2018-01-01';

             $diaEntero=1;
             $end_date = '2018-01-01';
             $end_hour = '08:00:00';
             $start_hour = '08:00:00';
             
             $resultado_consulta = $con->obtenerIdUsuario('b_apaza@hotmail.com');
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

