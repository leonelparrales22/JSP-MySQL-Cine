package com.peliculas.pelicula;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import com.peliculas.datos.BDD;

public class Pelicula {

	String nombre;
	int categoria;
	int duracion;
	byte[] cartelera;

	ResultSet ResultSet = null;
	ResultSetMetaData metaData = null;
	int numColumnas = 0;

	public Pelicula() {
	}

	public Pelicula(String nombre, int duracion, byte[] cartelera) {
		super();
		this.nombre = nombre;
		this.duracion = duracion;
		this.cartelera = null;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

	public byte[] getCartelera() {
		return cartelera;
	}

	public void setCartelera(byte[] cartelera) {
		this.cartelera = cartelera;
	}

	public int getCategoria() {
		return categoria;
	}

	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}

	public String ingresarPelicula(String categoria, String ruta) {
		try {
			BDD.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}
		ResultSet rs = null;
		String sql = "SELECT `Id_categoria`FROM `categoria` WHERE Descripcion='" + categoria + "'";
		// CONSULTAR CATEGORIA:
		try {
			BDD.consultar(sql);
			rs = BDD.getResultSet();
			rs.next();
			this.setCategoria(rs.getInt(1));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// GUARDAR IMAGEN:
		FileInputStream fi = null;
		java.sql.PreparedStatement ps = null;
		String insert = "INSERT INTO `pelicula` (`Nombre`, `Minutos`, `Cartelera`, `Id_categoria`) VALUES (?,?,?,?)";
		try {
			File file = new File(ruta);
			fi = new FileInputStream(file);
			ps = BDD.getConnection().prepareStatement(insert);
			ps.setString(1, this.getNombre());
			ps.setInt(2, this.getDuracion());
			ps.setBinaryStream(3, fi);
			ps.setInt(4, this.getCategoria());
			ps.executeUpdate();
			System.out.println("Pelicula Guardada!");
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error al guardar.");
		}

		try {
			BDD.cerrar();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return sql;
	}

	public String consultaTodo(String ruta) {
		try {
			BDD.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}

		String sql = "SELECT * FROM `pelicula`";
		String tabla = "<table border=\"2\">";
		ResultSet rs = null;
		try {
			BDD.consultar(sql);
			rs = BDD.getResultSet();

			boolean inicio = true;
			int contador = 0;
			while (rs.next()) {
				contador = contador + 1;
				if (inicio) {
					tabla += "<tr>";
					inicio = false;
				}

				Blob bytesImagen = rs.getBlob(4);
				InputStream is = bytesImagen.getBinaryStream();
				String rutaServ = ruta + "\\Imagenes\\";
				rutaServ = rutaServ + "copia_" + rs.getString(2);
				FileOutputStream fw = new FileOutputStream(rutaServ);
				byte bytes[] = new byte[1024];
				int leidos = is.read(bytes);
				while (leidos > 0) {
					fw.write(bytes);
					leidos = is.read(bytes);
				}
				fw.close();
				is.close();

				tabla += "<td><img src=\"" + rutaServ + "\" border=\"1\" width=\"150\" height=\"200\"><br>"
						+ rs.getString(2) + " (" + rs.getInt(3) + " min)</td>\n";

				if (contador % 3 == 0) {
					tabla += "</tr>";
					inicio = true;
				}
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
		try {
			BDD.cerrar();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		return tabla;
	}

	public String consultarPeliculas() {
		try {
			BDD.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}

		ResultSet rs = null;
		String sql = "SELECT `Id_pelicula`, `Nombre` FROM `pelicula` ";

		String tabla = "<table border=\"2\">";

		try {
			BDD.consultar(sql);
			rs = BDD.getResultSet();
			
			while (rs.next()) {
				tabla += "<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td><a href=Eliminar.jsp?id="
						+ rs.getInt(1) + "&nom=" + rs.getString(2)
						+ "><img src=\"Imagenes/borrar.png\" width=\"15\" height=\"15\"></a></td></tr>";
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			BDD.cerrar();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return tabla;
	}
	
	public String eliminarPelicula(String id) {
		try {
			BDD.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}
		
		String sql = "DELETE FROM `pelicula` WHERE `Id_pelicula`="+id;
		
		try {
			BDD.ejecutar(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			BDD.cerrar();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		return "PELICULA ELIMINADA";
	}
	
	public String consultarActualizar() {
		try {
			BDD.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}

		ResultSet rs = null;
		String sql = "SELECT `Id_pelicula`, `Nombre`, `Minutos FROM `pelicula` ";

		String tabla = "<table border=\"2\">";

		try {
			BDD.consultar(sql);
			rs = BDD.getResultSet();
			
			while (rs.next()) {
				tabla += "<tr><td>" + rs.getInt(1) + "</td><td><a href=Actualizar.jsp?id="+ rs.getInt(1) + "&nom=" + rs.getString(2)
				+"&min=" + rs.getString(3)+ ">"+ rs.getString(2) + "</a></td></tr>";
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			BDD.cerrar();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		System.out.println("SOY LEONEL PARRALES");
		return tabla;
	}

}
