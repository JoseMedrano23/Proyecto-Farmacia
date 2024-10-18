const express = require("express");
const mysql = require("mysql");
const mariadb = require('mariadb');
const cors = require("cors");
const path = require("path");
const app = express();
app.use(express.static(path.join(__dirname, "public")));
app.use(cors());
app.use(express.json());

const portB = 5000;
const db = mysql.createConnection({
  host: "localhost",
  user: "joseal",
  password: "",
  database: "clinica_farmacia",
});

db.connect(err => {
  if (err) {
    console.error('Error connecting to MariaDB:', err);
  } else {
    console.log('Connected to MariaDB');
  }
});

app.post("/api/add_user", (req, res) => {
  const sql =
    "INSERT INTO medicina ('nombre','docis','precio','cantidad','fecha_caducidad','descripcion','tipo') VALUES (?, ?, ?, ?, ?, ?, ?)";
  const values = [req.body.nombre, req.body.docis, req.body.precio, req.body.cantidad, req.body.fecha_caducidad, req.body.descripcion, req.body.tipo];
  db.query(sql, values, (err, result) => {
    if (err)
      return res.json({ message: "Error inesperado" + err });
    return res.json({ success: "Medicina añadida exitosamente" });
  });
});


app.listen(portB, () => {
    console.log(`listening on port ${portB} `);
  });