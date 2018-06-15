<?php
  require('./conector.php');
  $response = array();
  $eventos = array();
  session_start();
  if (isset($_SESSION['username'])) {
   $con = new ConectorBD('localhost', 'evento_s', '12345');
   if ($con->initConexion('bd_agenda')=='OK') {
        $resultado_consulta = $con->obtenerIdUsuario($_SESSION['username']);
        if ($resultado_consulta->num_rows != 0) {
             $fila = $resultado_consulta->fetch_assoc();
             $eventosUsuario =  $con->obtenerEventos($fila['usu_codigo']);

    
              while($filaEvento = $eventosUsuario->fetch_assoc()){
                  $evento = array();
                  $evento['id'] = $filaEvento['eve_codigo'];
                  $evento['title'] = $filaEvento['eve_titulo'];
                  $evento['start'] =$filaEvento['eve_fecha_inicio'];
                  $evento['end'] = $filaEvento['eve_fecha_fin'];
                  if ($filaEvento['eve_dia_entero']==1){
                       $evento['allDay'] = true;
                  }else{
                       $evento['allDay'] = false;
                  }
                  array_push($eventos, $evento);
             
              }
              $response['msg']= 'OK';
        }else{                 
             $response['msg']= 'Problemas con la conexion de la sesion de usuario.';
        }
   }else{
       $response['msg']= 'Problemas con la conexion de la sesion de usuario.';
   }
  
  }else {
    $response['msg']= 'No se ha iniciado una sesión';
    $con->cerrarConexion();
  }  
  $response['eventos']= $eventos;
  echo json_encode($response);







 ?>
