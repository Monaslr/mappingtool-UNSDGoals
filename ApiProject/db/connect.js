const mysql = require('mysql2'); 

const connection = mysql.createConnection(
    {
        host: 'localhost',
        user: 'user001', // change this to match the user you are using to test on your machine
        password: 'test', // change this to match the user password you are using to test on your machine
        database: 'mappingtool'
    }
);

connection.connect((err) => 
    {
        if (err) 
        {
            console.error('Error connecting to the database:', err.stack);
            process.exit() // return to prompt if failed to connect to db
        }
        console.log('Connected to the database with threadId:', connection.threadId);
    }
);

module.exports = connection;
