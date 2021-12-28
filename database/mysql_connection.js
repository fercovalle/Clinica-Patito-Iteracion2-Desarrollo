const mysql = require('mysql');

const conection = mysql.createConnection({
    host:'localhost',
    database:'patitolabs',
    user:'admin',
    password:'Administracion.1234'
});

conection.connect((err)=>{
    if(err)throw err
    console.log('La conexion funciona');
})

/*conection.query('SELECT * FROM usuario',(err,rows)=>{
    if(err)throw err
    console.log("Los datos de la tabla son:");
    console.log(rows);
})*/

module.exports = conection; 