const { dirname } = require('path');
const express = require('express');
const { json } = require('express');
const app = express();
const port = 8000;
const conection = require('./database/mysql_connection');
const bodyParser = require('body-parser');
const encoder = bodyParser.urlencoded();

//configuracion de ejs
app.set('views', './views');
app.set('view engine', 'ejs');

app.use(express.urlencoded({extended:false}));
app.use(express(json));

//referenciando rutas al enrutador
app.use('/', require('./router'));

//configuracion de archivos estaticos

app.use(express.static('./views'));
app.use(express.static('./styles'));
app.use(express.static('./images'));

app.listen('8000', () => console.log("corriendo en puerto", port));

//metodo para autenticar usuarios registrados 

app.post('/autenticar',encoder, async (req, res) => {

    const user = req.body.user;
    const password = req.body.password;
     

    if (user && password) {
        conection.query("SELECT * FROM usuario WHERE nombre=? AND clave=?;", [user, password], function (error, results, fields) {
            if (results.length > 0) {
                if(results[0].rol==="administrador"){
                    res.render('inicio/InicioAdministrador');
                }else if(results[0].rol==="secretaria"){
                    res.render('inicio/InicioSecretaria');
                }else if(results[0].rol==="laboratorista"){
                    res.render('inicio/InicioLaboratorista');
                }
            } else {
                res.send("Autenticacion incorrecta");
            }
            res.end();
        })
    }
})











