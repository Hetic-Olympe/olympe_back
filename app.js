// Import required modules
const express = require('express');

// Create an Express application
const app = express();

// Define a route
app.get('/', (req, res) => {
    res.send('Hello, world!');
});

// Define a route
app.get('/test', (req, res) => {
    res.send('Petit test');
});

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
