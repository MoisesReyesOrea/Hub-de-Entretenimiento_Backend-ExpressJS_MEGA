const express = require('express'); // importacion del modulo express
const { sql, poolPromise} = require('./db');
const bcrypt = require('bcrypt');
const app = express(); // creando el objeto de la aplicacion

app.use(express.json());

//puerto de express, del server
const PORT = 3000;

// método get, ruta que obtiene datos series de la base de datos
app.get('/series', async (req, res) => {
    try {
      const pool = await poolPromise;
      const result = await pool.request().query('SELECT * FROM series');
      res.json(result.recordset);
    } catch (err) {
      res.status(500).send('Error en la consulta a la base de datos: ' + err.message);
    }
  });

// método post: cuando se mande un post a '/users' express hará lo siguiente: 
app.post('/users', async (req, res) => {
    const {name, last_name, email, password} = req.body;

    try {
        const pool = await poolPromise;

        const result = await pool.request()
            .input('name', sql.VarChar, name)
            .input('last_name', sql.VarChar, last_name)
            .input('email', sql.VarChar, email)
            .input('password', sql.VarChar, password)
            .query(`
                    INSERT INTO users (name, last_name, email, password )
                    values (@name, @last_name, @email, @password)              
                `)
                res.status(201).json({message: 'Usuario creado exitosamente'});
    } catch (err) {
        res.status(500).json({error: err.message});
    }
});


app.listen(PORT, () => {
    console.log(`server corriendo en el puerto ${PORT}`)
})