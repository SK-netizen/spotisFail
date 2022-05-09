import IMask from 'imask'
var phoneMask = IMask(
    document.getElementById('Nombre'), {
        mask: '+{7}(000)000-00-00'
    });

function prueba(){
    let text = document.getElementById("nombre");
    if(text!="a"){
        return true;
    }else{
        return false;
    }
}
function validacion() {
    let doc = document.getElementById("formulario");
    let error1=prueba();
    if (error1 == false) {
        alert("No se pudo enviar el formulario")
        return false;
    } else {
        alert("Todo correcto,");
        doc.submit();
    }
}