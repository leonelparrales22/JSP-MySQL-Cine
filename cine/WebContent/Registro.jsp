
<%@page import="com.peliculas.pelicula.Categoria"%>
<%@ page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<meta charset="ISO-8859-1">
<title>Registro</title>
<link rel="stylesheet" href="estilo.css">
</head>

<%//!-body style="background-color: rgb(35, 35, 35);"->%>

<body>
	<!-TITULO->
	<center>
		<p style="color: rgb(255, 255, 255);">
			<font face="georgia" size=20> Registro película </font><br>
			<br>
		</p>


		<!-INICIO DEL FORMULARIO->
		<form action="resultado.jsp" method="post">
			<font face="georgia" size=5>
				<p style="color: rgb(255, 255, 255);">
					Nombre película: <input type="text" name="txtNombre"> <br>
					<%
						Class.forName("com.mysql.jdbc.Driver");
						Categoria c = new Categoria();
						out.print(c.mostrarCategoria());
					%>

					Duración película: <input type="text" name="txtDuracion">
					minutos. <br> Cartelera: <input type="file" id="fileFoto"
						name="fileFoto" accept=".jpg, .jpeg, .png"> <br> <input
						type="submit" name="Registrar">

				</p>
			</font>
		</form>
	</center>
	<a href="index.jsp">Volver Index</a>
</body>
</html>