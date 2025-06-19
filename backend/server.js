const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const path    = require('path');

const app = express();
app.use(cors());
app.use('/assets', express.static(path.join(__dirname, 'assets')));
// Configuración de conexión a la base de datos
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'mariokart',
  waitForConnections: true,
  connectionLimit: 10
});

// Función genérica para ejecutar consultas
async function query(sql, params = []) {
  const [rows] = await pool.execute(sql, params);
  return rows;
}

// Obtener personajes + ruta de skin
app.get('/characters', async (req, res) => {
  try {
    const sql = `
      SELECT
        c.id_character,
        c.character_name,
        c.character_speed,
        c.character_acceleration,
        c.character_weight,
        c.character_handling,
        c.character_traction,
        c.character_mini_turbo,
        c.character_invincibility,

        s.id_skin,
        s.model AS skin_model        -- aquí está la ruta/imagen
      FROM CharacterMK AS c
      LEFT JOIN Skin   AS s ON c.id_skin = s.id_skin
    `;

    const rows = await query(sql);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Error getting characters with skins' });
  }
});

// Obtener todos los karts
app.get('/karts', async (req, res) => {
  try {
    const rows = await query('SELECT * FROM Kart');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Error getting karts' });
  }
});

// Obtener todas las ruedas
app.get('/wheels', async (req, res) => {
  try {
    const rows = await query('SELECT * FROM Wheel');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Error getting ruedas' });
  }
});

// Obtener todos los gliders
app.get('/gliders', async (req, res) => {
  try {
    const rows = await query('SELECT * FROM Glider');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Error getting gliders' });
  }
});

// Inicia el servidor
app.listen(3000, () => {
  console.log('Servidor escuchando en http://localhost:3000');
});
