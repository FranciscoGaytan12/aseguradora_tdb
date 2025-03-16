
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

    const seleccionAuto = document.querySelector('#seleccionVehiculo').value
    const cobertura = document.querySelector('#tipoCobertura').value
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
    document.querySelector('#cotizacionResultante').innerHTML = `<div style='display:flex; flex-direction:column'>
                                                                    <p>Tu elección de vehiculo <b>${seleccionAuto.toUpperCase()}</b></p>
                                                                    <p>Tu elección de cobertura <b>${cobertura.toUpperCase()}</b></p>
                                                                    <p>El valor de su cobertura será <b>${cuotaSeguro.toFixed(2)}</b></p>
                                                                </div>`
    const formulario = document.createElement('div')
    formulario.innerHTML = `<form style='display:flex; flex-direction:column'>
                                <label>Ingresa tus datos de contacto</label><br>
                                <input type="text" placeholder="Ingresa tu nombre"><br>
                                <input type="text" placeholder="Ingresa tu apellido"><br>
                                <input type="email" placeholder="Ingresa tu email"><br>
                                <input type="number" placeholder="Ingresa tu telefono"><br>
                            </form>`
    document.querySelector('#cotizacionResultante').appendChild(formulario)
    const boton = document.createElement('button')
    boton.innerText = 'Solicitar Cotizacion'
    document.querySelector('#cotizacionResultante').appendChild(boton)
    boton.addEventListener('click', () => {
        Swal.fire({
            title: 'Cotización enviada!',
            text: 'Nuestros operadores se comunicaran contigo',
            icon: 'success'
        })
    })


}

