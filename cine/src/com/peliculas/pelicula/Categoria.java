package com.peliculas.pelicula;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.peliculas.datos.BDD;

public class Categoria {
	
	public String mostrarCategoria() {
		try {
			BDD.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}

		ResultSet rs = null;
		String sql = "SELECT * FROM `categoria`";
		String combo = "Seleccionar categoría: <select name=\"cmbCategoria\">\n";

		try {
			BDD.consultar(sql);
			rs = BDD.getResultSet();
			while (rs.next()) {
				combo += "<option value=\"" + rs.getString(2) + "\">" + rs.getString(2) + "</option>\n";
			}
			combo += "</select><br>";
		} catch (Exception e) {
			System.out.println("Error en consulta " + e.getMessage());
		}

		try {
			BDD.cerrar();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return combo;
	}
	
	public String consultaPorCategoria(String idCategoria) {
		try {
			BDD.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}

		int id = 0;
		ResultSet rs = null;
		String sql = "SELECT `Id_categoria`FROM `categoria` WHERE Descripcion='" + idCategoria + "'";
		// CONSULTAR CATEGORIA:
		try {
			BDD.consultar(sql);
			rs = BDD.getResultSet();
			rs.next();
			id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		sql = "SELECT * FROM `pelicula` WHERE pelicula.Id_categoria = " + id;
		String tabla = "<table border=\"2\">";
		rs = null;
		try {
			BDD.consultar(sql);
			rs = BDD.getResultSet();
			int contador = 1;
			while (rs.next()) {
				tabla += "<tr><td>" + contador + ".-" + rs.getString(2) + " (" + rs.getString(3) + " min)"
						+ "</td></tr>";
				contador++;
			}
			tabla += "</table>";
		} catch (Exception e) {
			System.out.println("Error en consulta " + e.getMessage());
		}

		try {
			com.peliculas.datos.BDD.cerrar();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return tabla;
	}

	

}
