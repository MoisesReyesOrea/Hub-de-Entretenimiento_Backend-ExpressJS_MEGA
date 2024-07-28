const express = require('express'); // importación del modulo express
const { sql, poolPromise} = require('./db');
const app = express(); // creando el objeto de la aplicación

app.use(express.json());

// Puerto de express (server)
const PORT = 3000;

// Habilitar CORS para permitir solicitudes desde Angular
const cors = require('cors');
app.use(cors());

// Ruta para conectar desde el Frontend con Angular
app.post('/login', async(req, res) => {
  const { email, password} = req.body;
  console.log("Email ingresado por el usuario en inicio de sesión:" , email);
  console.log("Password ingresado por el usuario en inicio de sesión:", password);
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('SELECT * FROM users');
    const usersArray = result.recordset;
    
    var userFound = false; 
     usersArray.forEach(element => {  // forEach para recorrer los objetos del userArray
      if(element.email == email){  // Usuario encontrado
        console.log("Correo electrónico encontrado en la BD")
        console.log(element.email);
        console.log(element.password);
        userFound = true;
        if (element.password == password) { // Contraseña correcta!
          res.send({ message: 'Contraseña correcta'})
      }
        if (element.password !== password) { // Contraseña Incorrecta!
          console.log("contraseña incorrecta")
          res.status(404)
          res.send({message: 'Contraseña incorrecta'})
      }
      }
    });
    if(userFound == false){   // Usuario no encontrado
      console.log("Usuario no registrado")
      res.status(404)
      res.send({message: 'Usuario no registrado'})
    }
  } catch (err) {
    res.status(500).send('Error en la consulta a la base de datos: ' + err.message);
  }
});



// método get, ruta que obtiene datos users de la base de datos
app.get('/users', async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('SELECT * FROM users');
    res.json(result.recordset);
    console.log(result.recordset);
  } catch (err) {
    res.status(500).send('Error en la consulta a la base de datos: ' + err.message);
  }
}
);


// método post: cuando se mande un post a '/users' express hará lo siguiente: 
app.post('/users', async (req, res) => {
    const {name, last_name, second_last_name,  email, password, age, nationality, premium} = req.body;

    try {
        const pool = await poolPromise;

        const result = await pool.request()
            .input('name', sql.VarChar, name)
            .input('last_name', sql.VarChar, last_name)
            .input('second_last_name', sql.VarChar, second_last_name)
            .input('email', sql.VarChar, email)
            .input('password', sql.VarChar, password)
            .input('age', sql.VarChar, age)
            .input('nationality', sql.VarChar, nationality)
            .input('premium', sql.VarChar, premium)
            .query(`
                    INSERT INTO users (name, last_name, second_last_name, email, password, age, nationality, premium )
                    values (@name, @last_name, @second_last_name, @email, @password, @age, @nationality, @premium)          
                `)
                res.status(201).json({message: 'Usuario creado exitosamente'});
    } catch (err) {
        res.status(500).json({error: err.message});
    }
});

// método get, ruta que obtiene datos 'movies' de la base de datos
app.get('/movies', async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('SELECT * FROM movies');
    res.json(result.recordset);
  } catch (err) {
    res.status(500).send('Error en la consulta a la base de datos: ' + err.message);
  }
});

// método get, ruta que obtiene datos 'series' de la base de datos
app.get('/series', async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('SELECT * FROM series');
    res.json(result.recordset);
  } catch (err) {
    res.status(500).send('Error en la consulta a la base de datos: ' + err.message);
  }
});


app.listen(PORT, () => {
    console.log(`server corriendo en el puerto: http://localhost:${PORT}`)
})