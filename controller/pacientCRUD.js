const conexion = require('../database/mysql_connection');

exports.crearPaciente = (req,res)=>{
    //const id = req.body.idPaciente;
    const cui = req.body.cuiPaciente;
    const nombre = req.body.nombrePaciente;
    const apellido = req.body.apellidoPaciente;
    const sexo = req.body.sexoPaciente;
    const fecha = req.body.fechaPaciente;
    const telefono = req.body.telefonoPaciente;
    const correo = req.body.correoPaciente;

    conexion.query("INSERT INTO paciente SET ?;",{CUI:cui, nombre:nombre,apellido:apellido,sexo:sexo,fecha_nacimiento:fecha,telefono:telefono, correo:correo},(error,results)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('pacientes/RegistrarPaciente');
        }
    })
}
exports.EditarPaciente = (req,res)=>{
    const id = req.body.id;
    const cui = req.body.cuiPaciente;
    const nombre = req.body.nombrePaciente;
    const apellido = req.body.apellidoPaciente;
    const sexo = req.body.sexoPaciente;
    const fecha = req.body.fechaPaciente;
    const telefono = req.body.telefonoPaciente;
    const correo = req.body.correoPaciente;

    conexion.query("UPDATE paciente SET ? WHERE id=?",[{CUI:cui, nombre:nombre,apellido:apellido,sexo:sexo,fecha_nacimiento:fecha,telefono:telefono, correo:correo},id],(error,results)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('pacientes/RegistrarPaciente');
        }
    })
}