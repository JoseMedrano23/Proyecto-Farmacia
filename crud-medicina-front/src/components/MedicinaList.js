import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import '../styles/styles.css'; 

const MedicinaList = () => {
  const [medicinas, setMedicinas] = useState([]);
  const [todasMedicinas, setTodasMedicinas] = useState([]); 
  const [nombre, setNombre] = useState('');
  const [dosis, setDosis] = useState('');
  const [precio, setPrecio] = useState('');
  const [cantidad, setCantidad] = useState('');
  const [fechacaducidad, setFechacaducidad] = useState('');
  const [descripcion, setDescripcion] = useState('');
  const [tipo, setTipo] = useState('');
  const [editando, setEditando] = useState(false);
  const [medicinaId, setMedicinaId] = useState(null);
  const inputRef = useRef(null);

  useEffect(() => {
    cargarMedicinas();
    inputRef.current.focus();
  }, []);

  const cargarMedicinas = async () => {
    try {
      const response = await axios.get('http://localhost:3000/medicinas');
      setMedicinas(response.data);
      setTodasMedicinas(response.data); 
    } catch (error) {
      console.error('Error al cargar medicinas:', error);
    }
  };

  const crearMedicina = async () => {
    try {
      if (editando) {
        await axios.put(`http://localhost:3000/medicinas/${medicinaId}`, {   nombre,
          dosis,
          precio,
          cantidad,
          fecha_caducidad: fechacaducidad,
          descripcion,
          tipo,
         });
        setEditando(false);
      } else {
        await axios.post('http://localhost:3000/medicinas', {   nombre,
          dosis,
          precio,
          cantidad,
          fecha_caducidad: fechacaducidad,
          descripcion,
          tipo,
         });
      }
      cargarMedicinas();
      cancelarRegistro();
    } catch (error) {
      console.error('Error al crear/actualizar medicina:', error);
    }
  };

  const eliminarMedicina = async (id) => {
    try {
      await axios.delete(`http://localhost:3000/medicinas/${id}`);
      cargarMedicinas();
    } catch (error) {
      console.error('Error al eliminar medicina:', error);
    }
  };

  const iniciarEdicion = (medicina) => {
    setEditando(true);
    setMedicinaId(medicina.id);
    setNombre(medicina.nombre);
    setDosis(medicina.dosis);
    setPrecio(medicina.precio);
    setCantidad(medicina.cantidad);
    setFechacaducidad(medicina.fecha_caducidad);
    setDescripcion(medicina.descripcion);
    setTipo(medicina.tipo);
    inputRef.current.focus();
  };

  const cancelarRegistro = () => {
    setNombre('');
    setDosis('');
    setPrecio('');
    setCantidad('');
    setFechacaducidad('');
    setDescripcion('');
    setTipo('');
    setEditando(false);
    inputRef.current.focus();
  };

  // Función de búsqueda modificada
  const buscarMedicina = (e) => {
    const query = e.target.value.toLowerCase();
    
    // Si no hay búsqueda, restablece la lista completa
    if (query === '') {
      setMedicinas(todasMedicinas);
    } else {
      const medicinasFiltradas = todasMedicinas.filter((medicina) =>
        medicina.nombre.toLowerCase().includes(query)
      );
      setMedicinas(medicinasFiltradas);
    }
  };

  return (
    <div className="container-general">
      <div className="menu-lateral"></div> {/* Borde azul a la izquierda */}
      <div className="contenedor-titulo-y-principal">
        <h1 className="titulo-pagina">Inventario</h1>
        <div className="contenedor-principal">
          <div className="formulario">
            <h2 className="titulo-seccion">{editando ? 'Editar Medicina' : 'Agregar Nueva Medicina'}</h2>
            <form onSubmit={(e) => e.preventDefault()}>
              <label>Nombre:</label>
              <input
                type="text"
                ref={inputRef}
                placeholder="Nombre"
                value={nombre}
                onChange={(e) => setNombre(e.target.value)}
                className="form-control mb-3"
              />
              <label>Dosis:</label>
              <input
                type="text"
                placeholder="Dosis"
                value={dosis}
                onChange={(e) => setDosis(e.target.value)}
                className="form-control mb-3"
              />
              <label>Precio:</label>
              <input
                type="number"
                step="0.01"
                placeholder="Precio"
                value={precio}
                onChange={(e) => setPrecio(e.target.value)}
                className="form-control mb-3"
              />
              <label>Cantidad:</label>
              <input
                type="number"
                placeholder="Cantidad"
                value={cantidad}
                onChange={(e) => setCantidad(e.target.value)}
                className="form-control mb-3"
              />
              <label>Fecha de Caducidad:</label>
              <input
                type="date"
                value={fechacaducidad}
                onChange={(e) => setFechacaducidad(e.target.value)}
                className="form-control mb-3"
              />
              <label>Descripción:</label>
              <input
                type="text"
                placeholder="Descripción"
                value={descripcion}
                onChange={(e) => setDescripcion(e.target.value)}
                className="form-control mb-3"
              />
              <label>Tipo:</label>
              <input
                type="number"
                placeholder="Tipo"
                value={tipo}
                onChange={(e) => setTipo(e.target.value)}
                className="form-control mb-3"
              />
              <button onClick={crearMedicina} className="btn btn-success mr-2">
                {editando ? 'Guardar Cambios' : 'Agregar'}
              </button>
              <button onClick={cancelarRegistro} className="btn btn-secondary">
                Cancelar
              </button>
            </form>
          </div>

          <div className="lista-medicinas">
            <h2 className="titulo-seccion">Lista de Medicinas</h2>
            <input
              type="text"
              placeholder="Buscar medicina"
              className="form-control mb-3"
              onChange={buscarMedicina} // Usa la nueva función de búsqueda
            />
            <table className="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre</th>
                  <th>Dosis</th>
                  <th>Precio</th>
                  <th>Cantidad</th>
                  <th>Fecha Caducidad</th>
                  <th>Tipo</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {medicinas.map((medicina) => (
                  <tr key={medicina.id}>
                    <td>{medicina.id}</td>
                    <td>{medicina.nombre}</td>
                    <td>{medicina.dosis}</td>
                    <td>{medicina.precio}</td>
                    <td>{medicina.cantidad}</td>
                    <td>{medicina.fecha_caducidad}</td>
                    <td>{medicina.tipo}</td>
                    <td className="acciones">
                      <button
                        onClick={() => iniciarEdicion(medicina)}
                        className="btn btn-success btn-block mb-2">
                        Editar
                      </button>
                      <button
                        onClick={() => eliminarMedicina(medicina.id)}
                        className="btn btn-danger btn-block">
                        Eliminar
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MedicinaList;
