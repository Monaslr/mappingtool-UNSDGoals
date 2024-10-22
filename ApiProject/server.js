const express = require('express');
const router = require('./routes/routes');
const dataBase = require('./db/connect');   
const cors = require('cors');

const backend = express();

router.use(express.json());

backend.use(cors({
    origin: 'http://localhost:5173', // Allow requests from this origin
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true, // Enable cookies
}));

//ROOT ROUTE
backend.get('/' , function(req, res)
{
    res.redirect('/api/project');
});


backend.use('/api/', router);

backend.listen(3001, function()
{
    console.log("Server started");
});
