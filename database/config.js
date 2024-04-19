const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres', // Nom d'utilisateur de la base de données
  host: 'postgres', // Nom du service PostgreSQL dans Docker Compose
  database: 'mydatabase', // Nom de la base de données
  password: 'example', // Mot de passe de la base de données
  port: 5432, // Port par défaut pour PostgreSQL
});

module.exports = pool;
