// JobFlow/backend/src/index.ts
import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import pool from './db'; // Import the database pool

// Load environment variables from .env.local
dotenv.config({ path: './.env.local' });

const app = express();
const port = process.env.PORT || 4000;

// Middleware
app.use(cors());
app.use(express.json()); // For parsing application/json

// Basic route to test the server and DB connection
app.get('/', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT NOW()');
    client.release();
    res.send(`Hello from JobFlow Backend! Database connected at: ${result.rows[0].now}`);
  } catch (err) {
    console.error('Database connection error', err);
    res.status(500).send('Database connection failed');
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
