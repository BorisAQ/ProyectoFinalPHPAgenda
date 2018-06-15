<?php

    include('conector.php');
    $nombreCompleto = $_POST['nombreCompleto'];
    $correoElectronico = $_POST['correoElectronico'];
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $con = new ConectorBD('localhost','user_a','12345');
    $response['conexion'] = $con->initConexion('bd_agenda');
    
    if ($response['conexion']=='OK') {        
           if($con->insertarUsuario(0, $nombreCompleto, $correoElectronico, $fechaNacimiento, $password)  ){
                $response['msg']="exito en la inserción";
                session_start();
                $_SESSION['username']=$correoElectronico;
           }else {
                $response['msg']= "Hubo un error y los datos no han sido cargados";
           }                    
    }else {
        $response['msg']= "No se pudo conectar a la base de datos";
    }
    echo json_encode($response);
    $con->cerrarConexion();
 ?>
