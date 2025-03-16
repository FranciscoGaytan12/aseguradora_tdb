let carrito = [];

cargarProductos()
function cargarProductos() {
    fetch('./js/productos.json')
        .then((response) => response.json())
        .then((json) => rellenarPagina(json))
        .catch(() => alert('Intente de nuevo'))

}

class PackSeguros {
    constructor(nombre, precio, imagen, id, subtotal) {
        this.nombre = nombre;
        this.precio = precio;
        this.image = imagen;
        this.cantidad = 1;
        this.id = id;
        this.subtotal = precio;
    }
}

let divContainer = document.getElementById('row');


function rellenarPagina(arrayProductos) {

    for (let producto of arrayProductos) {

        let div = document.createElement('div');
        div.classList = 'col-4 mt-3';

        div.innerHTML = `
        <div class="card" style="width: 18rem;">
            <img src="${producto.imagen}" class="card-img-top" alt="${producto.id}">
            <div class="card-body">
                <h5 class="card-title">${producto.nombre}</h5>
                <p class="card-text"><strong>${producto.precio}</strong></p>
                <button class="btn btn-primary anadirCarrito">Añadir al carrito</button>
            </div>
        </div>`

        divContainer.appendChild(div)

        let botones = document.querySelectorAll('.anadirCarrito')

        botones.forEach(elemento => {
            elemento.addEventListener('click', anadirCarrito)
        })

        botones.forEach(elemento => {
            elemento.addEventListener('click', () => {
                Swal.fire({
                    position: 'top-end',
                    title: 'Producto agregado',
                    showConfirmButton: false,
                    timer: 900,
                    width: 350,
                })
            })
        })
    }
    let carritoLocalStorage = JSON.parse(localStorage.getItem('carrito'))

    if (carritoLocalStorage) {
        carritoNav(carritoLocalStorage)
    }
}


function anadirCarrito(e) {

    let carritoLocalStorage = JSON.parse(localStorage.getItem('carrito'))


    if (carritoLocalStorage) {
        carrito = carritoLocalStorage;
    }


    let index = carrito.findIndex(producto => producto.id == e.target.parentNode.parentNode.children[0].alt)


    let nombre = e.target.parentNode.children[0].textContent;
    let precio = e.target.parentNode.children[1].children[0].textContent;
    let imagen = e.target.parentNode.parentNode.children[0].src;
    let id = e.target.parentNode.parentNode.children[0].alt;

    if (index == -1) {
        const producto = new PackSeguros(nombre, precio, imagen, id);
        carrito.push(producto);
    } else {
        carrito[index].cantidad++;
        carrito[index].subtotal = carrito[index].precio * carrito[index].cantidad;
    }

    localStorage.setItem('carrito', JSON.stringify(carrito))

    carritoNav(carrito)


}

function carritoNav(arrayCarrito) {

    let textoCarrito = document.getElementById('anchor_carrito')
    let totalProductos = 0

    for (let producto of arrayCarrito) {
        totalProductos += producto.cantidad
    }

    textoCarrito.innerHTML = ''
    textoCarrito.innerHTML = `<p>Carrito (${totalProductos})</p>`

}