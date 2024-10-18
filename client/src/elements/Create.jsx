import React, { useState } from 'react'
import axios from 'axios'
import {Link, useNavigate} from 'react-router-dom'

function Create() {
    const [values, setValues] = useState({
        nombre: '',
        dosis: '',
        precio: '',
        cantidad: '',
        fecha_caducidad: '',
        descripcion: '',
        tipo: ''
    })

    const navigate = useNavigate()

    function handleSubmit(e){
        e.preventDefault()

        axios.post('/api/add_user', values)
        .then((res)=>{
            
            navigate('/')
            console.log(res)
        })
        .catch((err)=>console.log(err))
    }
  return (
    <div className='container vh-100 vw-100 bg-primary'>
        <div className='row'>
            <h3>Añadir medicina</h3>
            <div className='d-flex justify-content-end'>
                <Link to='/' class='btn btn-success'>Home</Link>
            </div>
            <form onSubmit={handleSubmit}>
                <div className='form-group my-3'>
                    <label htmlFor='name'>Nombre</label>
                    <input type='text' name='name' required onChange={(e)=> setValues({...values, nombre: e.target.value})} />
                </div>
                <div className='form-group my-3'>
                    <label htmlFor='dosis'>dosis</label>
                    <input type='text' name='dosis' required onChange={(e)=> setValues({...values, dosis: e.target.value})} />
                </div>
                <div className='form-group my-3'>
                    <label htmlFor='precio'>precio</label>
                    <input type='number' name='precio' required onChange={(e)=> setValues({...values, precio: e.target.value})} />
                </div>
                <div className='form-group my-3'>
                    <label htmlFor='cantidad'>cantidad</label>
                    <input type='number' name='cantidad' required onChange={(e)=> setValues({...values, cantidad: e.target.value})} />
                </div>
                <div className='form-group my-3'>
                    <label htmlFor='fecha'>Fecha_caducidad</label>
                    <input type='date' name='fecha' required onChange={(e)=> setValues({...values, fecha_caducidad: e.target.value})} />
                </div>
                <div className='form-group my-3'>
                    <label htmlFor='descripcion'>Descripcion</label>
                    <input type='text' name='decripcion' required onChange={(e)=> setValues({...values, descripcion: e.target.value})} />
                </div>
                <div className='form-group my-3'>
                    <label htmlFor='tipo'>tipo</label>
                    <input type='text' name='tipo' required onChange={(e)=> setValues({...values, tipo: e.target.value})} />
                </div>
                <div className='form-group my-3'>
                    <button type='submit' name='btn btn-success'>Save</button>
                </div>
            </form>
        </div>
    </div>
  )
}

export default Create