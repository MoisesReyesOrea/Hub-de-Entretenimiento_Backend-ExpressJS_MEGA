const sql = require('mssql');
require('dotenv').config();

const config = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    database: process.env.DB_DATABASE,
    port: parseInt(process.env.DB_PORT),
    options: {
        encrypt: false,
        enableArithAbort: true
    }
};

const poolPromise = new sql.ConnectionPool(config)
    .connect()
    .then(pool => {
        console.log("Connectado a SQL Server");
        return pool;
    })
    .catch(err => console.log("Conexion fallida",err));

    module.exports = {
        sql,
        poolPromise
    };
