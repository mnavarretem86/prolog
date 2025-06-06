const form = document.getElementById('diagnostico-form');
const sintomasLista = document.getElementById('sintomas-lista');
const divResultado = document.getElementById('resultado');
const diagnosticoEl = document.getElementById('diagnostico');
const probabilidadEl = document.getElementById('probabilidad');
const recomendacionEl = document.getElementById('recomendacion');
const sintomasSeleccionadosEl = document.getElementById('sintomas-seleccionados');
const btnLimpiar = document.getElementById('btn-limpiar');

// Contador
const contadorSintomas = document.createElement('p');
contadorSintomas.id = 'contador-sintomas';
contadorSintomas.style.fontWeight = 'bold';
contadorSintomas.style.marginBottom = '10px';
sintomasLista.before(contadorSintomas);
actualizarContador();

// Title case
function toTitleCase(str) {
  return str
    .toLowerCase()
    .split('_')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

// Obtener síntomas
async function obtenerSintomasDesdeServidor() {
  try {
    const res = await fetch('http://192.168.174.149:9090/sintomas');
    const data = await res.json();
    if (res.ok && data.sintomas) {
      crearCheckboxes(data.sintomas);
    } else {
      mostrarError('No se pudo cargar la lista de síntomas.');
    }
  } catch (err) {
    mostrarError('Error al conectar con el servidor de síntomas.');
  }
}

// Crear checkboxes
function crearCheckboxes(sintomas) {
  const categorias = {};
  sintomas.forEach(({ categoria, sintoma }) => {
    if (!categorias[categoria]) categorias[categoria] = [];
    categorias[categoria].push(sintoma);
  });

  sintomasLista.innerHTML = '';

  for (const categoria in categorias) {
    const categoriaBox = document.createElement('div');
    categoriaBox.classList.add('categoria-box');

    const titulo = document.createElement('h3');
    titulo.textContent = categoria;
    categoriaBox.appendChild(titulo);

    categorias[categoria].forEach(sintoma => {
      const id = `chk_${sintoma}`;

      const label = document.createElement('label');
      label.htmlFor = id;
      label.textContent = toTitleCase(sintoma);

      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.id = id;
      checkbox.name = 'sintomas';
      checkbox.value = sintoma;

      checkbox.addEventListener('change', limitarSeleccion);

      label.prepend(checkbox);
      categoriaBox.appendChild(label);
    });

    sintomasLista.appendChild(categoriaBox);
  }
  actualizarContador();
}

// Limita la selección a máximo 7 síntomas
function limitarSeleccion() {
  const seleccionados = document.querySelectorAll('input[name="sintomas"]:checked');
  actualizarContador();
  if (seleccionados.length > 7) {
    this.checked = false;
    mostrarError('Solo puedes seleccionar hasta 7 síntomas.');
  }
}

// Actualizar contador
function actualizarContador() {
  const seleccionados = document.querySelectorAll('input[name="sintomas"]:checked');
  contadorSintomas.innerHTML = `<i class="fa-solid fa-list-check"></i> Síntomas seleccionados: ${seleccionados.length} / 7`;
}


// Enviar al backend
form.addEventListener('submit', async (e) => {
  e.preventDefault();
  ocultarMensajes();

  const checkboxes = document.querySelectorAll('input[name="sintomas"]:checked');
  const sintomas = Array.from(checkboxes).map(cb => cb.value);

  if (sintomas.length < 5 || sintomas.length > 7) {
    mostrarError('Debes seleccionar entre 5 y 7 síntomas.');
    return;
  }

  try {
    const res = await fetch('http://192.168.174.149:9090/diagnostico', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ sintomas })
    });

    const data = await res.json();

    if (res.ok && data.status === 'ok') {
      diagnosticoEl.textContent = toTitleCase(data.diagnostico);
      probabilidadEl.textContent = `${data.probabilidad}`;
      recomendacionEl.textContent = data.recomendacion;
      sintomasSeleccionadosEl.textContent = sintomas.map(toTitleCase).join(', ');
      divResultado.classList.remove('oculto');
    } else {
      mostrarError(data.error || 'Hubo un problema con el diagnóstico.');
    }
  } catch (err) {
    mostrarError('No se pudo conectar al servidor. Intenta más tarde.');
  }
});

// Limpiar formulario
btnLimpiar.addEventListener('click', () => {
  const checkboxes = document.querySelectorAll('input[name="sintomas"]:checked');
  checkboxes.forEach(cb => (cb.checked = false));
  ocultarMensajes();
  diagnosticoEl.textContent = '';
  probabilidadEl.textContent = '';
  recomendacionEl.textContent = '';
  sintomasSeleccionadosEl.textContent = '';
  actualizarContador();
});

function ocultarMensajes() {
  divResultado.classList.add('oculto');
}

// Mostrar toast de error
function mostrarError(msg) {
  const toastContainer = document.getElementById('toast-container');

  const toast = document.createElement('div');
  toast.className = 'toast';
  toast.innerHTML = `<i class="fas fa-exclamation-triangle"></i> ${msg}`;

  toastContainer.appendChild(toast);

  setTimeout(() => {
    toast.remove();
  }, 4000);
}

// Cargar al inicio
obtenerSintomasDesdeServidor();