$(function () {
    $('#formulario').submit(function (event) {
        
        event.preventDefault();
        checkContrasena();
    })
})

function checkContrasena(){
  var contrasena = $('#userPassword1').val();
  var repContrasena = $('#userPassword2').val();

  if (contrasena===repContrasena) {
    getDatos();
  }else {
    alert('Las contraseñas no coinciden')
  }
}

function getDatos() {
    var form_data = new FormData();
    form_data.append('nombreCompleto', $('#userName').val());
    form_data.append('correoElectronico', $('#userCorreo').val());
    form_data.append('fechaNacimiento', $('#userFechaNacimiento').val());
    form_data.append('password', $('#userPassword1').val());
    sendForm(form_data);

}



function sendForm(formData){
  $.ajax({
    url: '../server/create_user.php',
    dataType: "json",
    cache: false,
    processData: false,
    contentType: false,
    data: formData,
    type: 'POST',
    success: function(php_response){
      if (php_response.msg == "exito en la inserción") {
        window.location.href = 'main.html';
      }else {
        alert(php_response.msg);
      }
    },
    error: function(){
      alert("error en la comunicación con el servidor");
    }
  })
}
