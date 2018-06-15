<?php
  class ConectorBD
  {
    private $host;
    private $user;
    private $password;
    private $conexion;

    function __construct($host, $user, $password){
      $this->host = $host;
      $this->user = $user;
      $this->password = $password;
    }

    function initConexion($nombre_db){
        try {
            mysqli_report(MYSQLI_REPORT_ALL);
            $this->conexion = new mysqli($this->host, $this->user, $this->password, $nombre_db);       
            return 'OK';
        } catch (Exception $e) {
            return 'ERROR:'.$e->getMessage();            
        }
    }


    function getConexion(){
      return $this->conexion;
    }

    function cerrarConexion(){
     // $this->conexion->close();
        try{
            mysqli_report(MYSQLI_REPORT_ALL);
            $this->conexion->close();      
        }catch(Exception $ex){            
        }
    }


    function ejecutarQuery($query){
      mysqli_report(MYSQLI_REPORT_ALL ^ MYSQLI_REPORT_INDEX);
      return $this->conexion->query($query);
    }
    //Inserta nuevos usuarios a la base de datos
    function insertarUsuario($usu_codigo, $usu_nombre_completo, $usu_correo, $usu_fechaNacimiento, $usu_password){
         $sql = "INSERT INTO age_usuario (usu_codigo, usu_nombre_completo, usu_correo, usu_fecha_nacimiento, usu_password) VALUES (0,'$usu_nombre_completo', '$usu_correo','$usu_fechaNacimiento','$usu_password')";         
        return $this->ejecutarQuery($sql);
    }


    function consultarUsuario($usuario){
        $sql = "SELECT usu_correo, usu_password FROM age_usuario WHERE usu_correo ='$usuario'";       
        return $this->ejecutarQuery($sql);
    }

    function obtenerIdUsuario($usuario){
        $sql = "SELECT usu_codigo FROM age_usuario WHERE usu_correo ='$usuario'";       
        return $this->ejecutarQuery($sql);
    }

    function insertarEvento($eve_codigo, $eve_titulo, $eve_fecha_inicio, $eve_hora_inicio, $eve_fecha_fin, $eve_hora_fin, $eve_usu, $eve_dia_entero ){
         $sql = "insert into age_evento (eve_codigo, eve_titulo, eve_fecha_inicio, eve_hora_inicio, eve_fecha_fin, eve_hora_fin, eve_usu, eve_dia_entero) VALUES(0,'$eve_titulo', '$eve_fecha_inicio', '$eve_hora_inicio', '$eve_fecha_fin','$eve_hora_fin',$eve_usu,$eve_dia_entero);";         
        return $this->ejecutarQuery($sql);
    }


    function obtenerEventos($IdUsuario){
        $sql = "select eve_codigo, eve_titulo, eve_fecha_inicio, eve_hora_inicio, eve_fecha_fin, eve_hora_fin, eve_dia_entero FROM age_evento where eve_usu = $IdUsuario;";       
        return $this->ejecutarQuery($sql);
    }

    function eliminarEvento($id){
        $sql = "DELETE from age_evento WHERE eve_codigo = $id ;";       
        return $this->ejecutarQuery($sql);
    }

    function actualizarEvento($id, $eve_fecha_inicio, $eve_hora_inicio, $eve_fecha_fin, $eve_hora_fin){
        $sql = "update age_evento SET eve_fecha_inicio = '$eve_fecha_inicio' , eve_hora_inicio = '$eve_hora_inicio', eve_fecha_fin= '$eve_fecha_fin', eve_hora_fin = '$eve_hora_fin' WHERE eve_codigo = $id;";       
        return $this->ejecutarQuery($sql);
    }
}

?>
