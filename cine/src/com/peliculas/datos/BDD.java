package com.peliculas.datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BDD {
	
	private static final String DATABASE_URL = "jdbc:mysql://127.0.0.1/cine";
	private static final String DATABASE_USER = "root";
	private static final String DATABSE_PASSWORD = "";
	
	private static Connection connection = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	
	private static boolean conectada = false;
	
	public static void conectar() throws SQLException {
		connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABSE_PASSWORD);
		conectada = true;
	}
	
	public static void consultar(String sentencia) throws SQLException {
		statement = connection.createStatement();
		resultSet = statement.executeQuery(sentencia);
	}
	
	public static int ejecutar(String sentencia) throws SQLException{
		statement = connection.createStatement();
		int r = statement.executeUpdate(sentencia,Statement.RETURN_GENERATED_KEYS);
		resultSet = statement.getGeneratedKeys();
		return r;	
	}
	
	public static void cerrar() throws SQLException {
		if (resultSet != null) {
			resultSet.close();
		}
				
		if (statement != null) {
			statement.close();
		}
		
		if (connection != null) {
			connection.close();
		}
		
		conectada = false;
	}
	
	public static ResultSet getResultSet() {
		
		
		return resultSet;
	}
	
	public static boolean isConectada() {
		return conectada;
	}

	public static Connection getConnection() {
		return connection;
	}
	
	
	
}
