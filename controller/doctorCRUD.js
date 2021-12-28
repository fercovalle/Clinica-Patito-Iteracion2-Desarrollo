const conexion = require('../database/mysql_connection');

exports.crearMedico = (req,res)=>{
    //const id = req.body.idMedico;
    const nombre = req.body.nombreMedico;
    const telefono = req.body.telefonoMedico;
    const cuenta = req.body.cuentaMedico;
    const estado= req.body.estadoMedico;
    const regalia= req.body.regaliaMedico;

    conexion.query("INSERT INTO medico SET ?;",{ nombre:nombre,telefono:telefono,numero_cuenta:cuenta,activo:estado,regalia:regalia},(error,results)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('medicos/RegistrarMedico');
        }
    })
}
exports.EditarMedico = (req,res)=>{
     const id = req.body.id;
     const nombre = req.body.nombreMedico;
     const telefono = req.body.telefonoMedico;
     const cuenta = req.body.cuentaMedico;
     const estado= req.body.estadoMedico;
     const regalia= req.body.regaliaMedico;

    conexion.query("UPDATE medico SET ? WHERE id=?",[{nombre:nombre,telefono:telefono,numero_cuenta:cuenta,activo:estado,regalia:regalia},id],(error,results)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('medicos/RegistrarMedico');
        }
    })
}