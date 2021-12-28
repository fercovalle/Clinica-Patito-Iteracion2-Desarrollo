const conexion = require('../database/mysql_connection');


exports.crearUsuario = (req,res)=>{
    const rol = req.body.rol;
    const nombre = req.body.nombreUsuario;
    const clave = req.body.claveUsuario;
    const telefono = req.body.telefonoUsuario;
    const correo = req.body.correoUsuario;
    let estado = req.body.estadoUsuario;

    if(estado==="activo"){
        estado=1;
    }else{
        estado=0;
    }

    conexion.query("INSERT INTO usuario SET ?;",{rol:rol, nombre:nombre, clave:clave, telefono:telefono, correo:correo,activo:estado},(error,results)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('usuarios/RegistrarUsuario');
        }
    })
}
exports.EditarUsuario = (req,res)=>{
    const id = req.body.id;
    const rol = req.body.rol;
    const nombre = req.body.nombreUsuario;
    const clave = req.body.claveUsuario;
    const telefono = req.body.telefonoUsuario;
    const correo = req.body.correoUsuario;
    let estado = req.body.estadoUsuario;

    conexion.query("UPDATE usuario SET ? WHERE id=?",[{rol:rol, nombre:nombre, clave:clave, telefono:telefono, correo:correo,activo:estado},id],(error,results)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('usuarios/RegistrarUsuario');
        }
    })
    exports.accesoUsuario=(req,res)=>{
        res.render('RegistroUsuario');
    }
}
