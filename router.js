const express = require('express');
const router = express.Router();
const conexion = require('./database/mysql_connection');


//endpoint de login
router.get('/',(req,res) => {
    res.render('index');
    //console.log("Tener un usuario en el sistema");
})


//endpoints de empleados
router.get('/empleados/EditarEmpleado', (req, res) => {
    res.render('empleados/EditarEmpleado');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la secion empleados");
    console.log("Debe haber por lo menos un registro");
})
router.get('/empleados/RegistrarEmpleado', (req, res) => {
    res.render('empleados/RegistrarEmpleado');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la secion empleados");
})
//endpoints de examenes
router.get('/examenes/EditarTipoExamen', (req, res) => {
    res.render('examenes/EditarTipoExamen');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la secion tipos de examenes");
})
router.get('/examenes/RegistrarTipoExamen', (req, res) => {
    res.render('examenes/RegistrarTipoExamen');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la secion tipos de examenes");
    console.log("Debe haber por lo menos un registro");
})
//endpoints de medicos

router.get('/medicos/RegistrarMedico', (req, res) => {

    //res.render('medicos/RegistrarMedico');
    console.log("Debe iniciar sesion como administrador o secretaria");
    console.log("haber ingresado a la seccion medicos");
     conexion.query("SELECT * FROM medico",(error,results)=>{
         if(error){
             throw error
         }else{
             res.render('medicos/RegistrarMedico',{results:results});
         }
     })

})
router.get('/medicos/EditarMedico/', (req, res) => {
    res.render('medicos/EditarMedico');
    console.log("Debe iniciar sesion como administrador o secretaria");
    console.log("haber ingresado a la seccion medicos");
    console.log("Debe haber por lo menos un registro");
})

//endpoints de muestra

router.get('/muestras/EditarTipoMuestra', (req, res) => {
    res.render('muestras/EditarTipoMuestra');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la seccion tipo de muestra");
    console.log("Debe haber por lo menos un registro");
})
router.get('/muestras/RegistrarTipoMuestra', (req, res) => {
    res.render('muestras/RegistrarTipoMuestra');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la seccion tipo de muestra");
})

//endpoints de pacientes

router.get('/pacientes/RegistrarPaciente', (req, res) => {
    //res.render('pacientes/RegistrarPaciente');
    console.log("Debe iniciar sesion como administrador o secretaria");
    console.log("haber ingresado a la seccion paciente");
    conexion.query("SELECT * FROM paciente",(error,results)=>{
        if(error){
            throw error
        }else{
            res.render('pacientes/RegistrarPaciente',{results:results});
        }
    })
})
router.get('/pacientes/EditarPaciente', (req, res) => {
    res.render('pacientes/EditarPaciente');
    console.log("Debe iniciar sesion como administrador o secretaria");
    console.log("haber ingresado a la seccion paciente");
    console.log("Debe haber por lo menos un registro");
})

//endpoints de usuarios
router.get('/usuarios/RegistrarUsuario', (req, res) => {
    //res.render('usuarios/RegistrarUsuario');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la seccion paciente");
    conexion.query("SELECT * FROM usuario",(error,results)=>{
        if(error){
            throw error
        }else{
            res.render('usuarios/RegistrarUsuario',{results:results});
        }
    })
})
router.get('/usuarios/EditarUsuario/', (req, res) => {
    res.render('usuarios/EditarUsuario');
    console.log("Debe iniciar sesion como administrador");
    console.log("haber ingresado a la seccion usuario");
    
})

//endpoints de consulta
router.get('/consultas/RegistrarConsulta', (req, res) => {
    res.render('consultas/RegistrarConsulta');
    console.log("Debe iniciar sesion como secretaria");
    console.log("haber ingresado a la secion consulta");
    console.log("Debe haber por lo menos un registro de paciente");
    console.log("Debe haber por lo menos un registro de muestra");
    console.log("Debe haber por lo menos un registro de tipo de examen");
})
router.get('/consultas/AnalizarConsulta', (req, res) => {
    res.render('consultas/AnalizarConsulta');
    console.log("Debe iniciar sesion como laboratorista");
    console.log("haber ingresado a la secion consulta");
    console.log("Debe haber por lo menos un registro de consulta");
})
//endpoints de inicio 
router.get('/inicio/InicioAdministrador', (req, res) => {
    res.render('inicio/InicioAdministrador');
})
router.get('/inicio/InicioSecretaria', (req, res) => {
    res.render('inicio/InicioSecretaria');
})
router.get('/inicio/InicioLaboratorista', (req, res) => {
    res.render('inicio/InicioLaboratorista');
})

//crear usuario 
router.get('/crearUsuario',(req,res)=>{
    
})
//crear paciente 
router.get('/crearPaciente',(req,res)=>{
    
})
//crear medico 
router.get('/crearMedico',(req,res)=>{
    
})

//editar usuario  
router.get('/EditarUsuario/:id',(req,res)=>{
    const id = req.params.id;
    conexion.query("SELECT * FROM usuario WHERE id=?",[id],(error,results)=>{
        if(error){
            throw error 
        }else{
            res.render('./usuarios/EditarUsuario',{user:results[0]});
        }
    });
})

//editar paciente 
router.get('/EditarPaciente/:id',(req,res)=>{
    const id = req.params.id;
    conexion.query("SELECT * FROM paciente WHERE id=?",[id],(error,results)=>{
        if(error){
            throw error 
        }else{
            res.render('./pacientes/EditarPaciente',{pacient:results[0]});
        }
    });
})

//editar Medico 
router.get('/EditarMedico/:id',(req,res)=>{
    const id = req.params.id;
    conexion.query("SELECT * FROM medico WHERE id=?",[id],(error,results)=>{
        if(error){
            throw error 
        }else{
            res.render('./medicos/EditarMedico',{doctor:results[0]});
        }
    });
})


const crud = require('./controller/userCRUD');
const crud2 = require('./controller/pacientCRUD');
const crud3= require('./controller/doctorCRUD');

router.post('/crearUsuario',crud.crearUsuario);
router.post('/EditarUsuario',crud.EditarUsuario);
router.post('/crearPaciente',crud2.crearPaciente);
router.post('/EditarPaciente',crud2.EditarPaciente);
router.post('/crearMedico',crud3.crearMedico);
router.post('/EditarMedico',crud3.EditarMedico);



module.exports=router;