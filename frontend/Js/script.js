// URL base para las imágenes
const baseImageUrl = 'http://localhost:3000/';

// Mapeo texto del botón → endpoint
const endpoints = {
  'Characters': 'characters',
  'Vehicles'  : 'karts',
  'Wheels'    : 'wheels',
  'Glider'    : 'gliders',
};

// Referencias a la navegación y al buscador
const navLinks   = document.querySelectorAll('.navbar-nav .nav-link');
const searchForm = document.getElementById('searchForm');
const searchInput= document.getElementById('searchInput');

// Almacena la data actualmente mostrada
let currentData = [];

// Escucha clicks en los botones
navLinks.forEach(link => {
  link.addEventListener('click', e => {
    e.preventDefault();

    // Actualiza botón activo
    navLinks.forEach(l => l.classList.remove('active'));
    link.classList.add('active');

    const category = link.textContent.trim();
    fetchDataAndRender(endpoints[category]);
  });
});

// Filtro de búsqueda
searchForm.addEventListener('submit', e => {
  e.preventDefault();
  const query = searchInput.value.trim().toLowerCase();

  // Si está vacío, volvemos a mostrar todo
  if (query === '') {
    renderCards(currentData);
    return;
  }
  //Filtra y limpia los datos
  const filtered = currentData.filter(item => {
    const nameKey = firstKeyEnding(item, '_name') || 'name';
    const idKey =
      Object.keys(item).find(k => /^id(_|$)/i.test(k))   // empieza con id_
      || firstKeyEnding(item, '_id')                     // o termina en _id
      || 'id';  

    const nameMatch = item[nameKey] &&
                      item[nameKey].toLowerCase().includes(query);

    const idMatch = item[idKey] &&
                    String(item[idKey]).includes(query);

    return nameMatch || idMatch;
  });

  renderCards(filtered);
});

//Función para ayudar a las busquedas
function firstKeyEnding(obj, suffix) {
  return Object.keys(obj).find(k => k.endsWith(suffix));
}

//Guarda y muestra las cards de cada dato
function fetchDataAndRender(endpoint) {
  fetch(`http://localhost:3000/${endpoint}`)
    .then(r => {
      if (!r.ok) throw new Error('No answer');
      return r.json();
    })
    .then(data => {
      currentData = data;      // <-- guardamos para búsquedas
      renderCards(data);
    })
    .catch(err => {
      document.getElementById('resultado').textContent =
        'Error loading data: ' + err.message;
    });
}

//Actualiza un modal que muestra las stats de cada parte y personaje
function renderStatsInModal(item) {
  const nameKey  = firstKeyEnding(item, '_name')  || 'name';

    const imageKey =
          firstKeyEnding(item, '_model')
       || firstKeyEnding(item, '_image')
       || 'model';
  const modalContent = document.getElementById('modalContent');

  // Modifica nombre de los campos de la base de datos
  const fieldNames = {
    character_speed: 'Speed',
    character_weight: 'Weight',
    character_acceleration: 'Acceleration',
    character_handling: 'Handling',
    character_traction: 'Traction',
    character_mini_turbo: 'Mini-Turbo',
    character_invincibility: 'Invincibility',
    kart_speed: 'Speed',
    kart_weight: 'Weight',
    kart_acceleration: 'Acceleration',
    kart_handling: 'Handling',
    kart_traction: 'Traction',
    kart_mini_turbo: 'Mini-Turbo',
    kart_invincibility: 'Invincibility',
    wheel_speed: 'Speed',
    wheel_weight: 'Weight',
    wheel_acceleration: 'Acceleration',
    wheel_handling: 'Handling',
    wheel_traction: 'Traction',
    wheel_mini_turbo: 'Mini-Turbo',
    wheel_invincibility: 'Invincibility',
    glider_speed: 'Speed',
    glider_weight: 'Weight',
    glider_acceleration: 'Acceleration',
    glider_handling: 'Handling',
    glider_traction: 'Traction',
    glider_mini_turbo: 'Mini-Turbo',
    glider_invincibility: 'Invincibility'
  };

  // Excluye campos de la base de datos
  const excluded = ['id_character', 'id_kart', 'id_wheel', 'id_glider', 'id_skin', 'id', 'path_sound', 'model',
                    nameKey, imageKey, `${nameKey.split('_')[0]}_sound`, `${nameKey.split('_')[0]}_model`];

  const rows = Object.entries(item)
    .filter(([key]) => !excluded.includes(key))
    .map(([key, val]) => `
      <tr>
        <th scope="row">${fieldNames[key] || key}</th>
        <td>${val}</td>
      </tr>
    `).join('');

  modalContent.innerHTML = `
    <div class="text-center mb-3">
      <img src="${baseImageUrl}${item[imageKey]}" class="img-fluid rounded" alt="${item[nameKey]}" style="max-height: 300px;">
      <h4 class="mt-3">${item[nameKey]}</h4>
    </div>
    <div class="table-responsive">
      <table class="table table-bordered table-striped">
        <tbody>
          ${rows}
        </tbody>
      </table>
    </div>
  `;

  document.getElementById('detailsModalLabel').textContent = item[nameKey];
  const modal = new bootstrap.Modal(document.getElementById('detailsModal'));
  modal.show();
}
//Crea las cards de cada dato
function renderCards(data) {
  const container = document.getElementById('results');
  container.innerHTML = '';

  if (!Array.isArray(data) || data.length === 0) {
    container.textContent = 'No data available';
    return;
  }

  const row = document.createElement('div');
  row.className = 'row';

  data.forEach(item => {
    const nameKey  = firstKeyEnding(item, '_name')  || 'name';

    const imageKey =
          firstKeyEnding(item, '_model')
       || firstKeyEnding(item, '_image')
       || 'model';

    const col = document.createElement('div');
    col.className = 'col-md-3 mb-4';

    col.innerHTML = `
      <div class="card h-100 cursor-pointer bg-black bg-opacity-50 text-white">
        <img src="${baseImageUrl}${item[imageKey]}" class="card-img-top" alt="${item[nameKey]}">
        <div class="card-body">
          <h5 class="card-title">${item[nameKey]}</h5>
        </div>
      </div>
    `;

    col.querySelector('.card')
       .addEventListener('click', () => renderStatsInModal(item));

    row.appendChild(col);
  });

  container.appendChild(row);
}


//Carga los personajes al inicio
document.addEventListener('DOMContentLoaded', () => {
  const charactersLink = [...navLinks].find(
    l => l.textContent.trim() === 'Characters'
  );
  if (charactersLink) charactersLink.classList.add('active');
  fetchDataAndRender('characters');
});
