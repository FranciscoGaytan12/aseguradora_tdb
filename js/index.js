console.log('Desafio obligatorio');

//Simulador cotizador seguro

/*
    1. Seleccionar tipo de automovil (Chico, mediano, camioneta)
    2. Elegir tipo de cobertura (basica o todo riesgo)
    3. ingresar el valor del auto

*/

const tipoVehiculo = ['Chico', 'Mediano', 'Camioneta']
const tipoSeguro = ['Básica', 'Todo riesgo']


const $resultado = document.querySelector('#resultado')



$resultado.onclick = function () {
    // OBTENGO VALORES
    const seleccionAuto = document.forms['seleccionVehiculo'].elements['seleccion'].value
    const cobertura = document.forms.tipoCobertura.cobertura.value
    const valorAuto = document.getElementById('valorAuto').value

    let cantidad = 0
    switch (seleccionAuto) {
        case 'chico':
            cantidad = valorAuto * 0.002
            break;
        case 'mediano':
            cantidad = valorAuto * 0.003
            break;
        case 'grande':
            cantidad = valorAuto * 0.004
            break;

        default:
            break;
    };

    let cuotaSeguro = 0;
    if (cobertura == 'basico') {
        cuotaSeguro = cantidad * 1.2

    } else if (cobertura == 'todo riesgo') {
        cuotaSeguro = cantidad * 1.3
    };

    //IMPRIMO RESULTADO EN PANTALLA
    document.querySelector('#cotizacionResultante').innerText = 'Tu elección de vehiculo: ' + seleccionAuto + '\n' + 'Tu elección de cobertura: ' + cobertura + '\n' + 'El valor de su cobertura mensual es de aproximadamente $' + cuotaSeguro.toFixed(2)
}






