<?php


  require('./conector.php');

  $con = new ConectorBD('localhost','user_l','123456');

  $response['conexion'] = $con->initConexion('bd_agenda');

  if ($response['conexion']=='OK') {    
    $resultado_consulta = $con->consultarUsuario($_POST['username']);
    

    if ($resultado_consulta->num_rows != 0) {
      $fila = $resultado_consulta->fetch_assoc();
      if (password_verify($_POST['password'], $fila['usu_password'])) {
        $response['acceso'] = 'concedido';
        session_start();
        $_SESSION['username']=$fila['usu_correo'];
      }else {
        $response['motivo'] = 'Contraseña incorrecta';
        $response['acceso'] = 'rechazado';
      }
    }else{
      $response['motivo'] = 'Email incorrecto';
      $response['acceso'] = 'rechazado';
    }
  }

  echo json_encode($response);

  $con->cerrarConexion();




 ?>
