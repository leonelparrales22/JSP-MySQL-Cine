<%@page import="com.peliculas.pelicula.Categoria"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualizar_Datos</title>
<link rel="stylesheet" href="estilo.css">
</head>
<body>
<center>
		<p style="color: rgb(255, 255, 255);">
			<font face="georgia" size=20>Actualizar película: 
			<%= request.getParameter("nom")%>
			</font>
			<br>
			<br>
		</p>


		<!-INICIO DEL FORMULARIO->
		<% out.print("<form action=Verificar_Actualizar.jsp?id="+request.getParameter("id")+"&nom="+request.getParameter("nom")+"&min="+request.getParameter("min")+" method=post>");%>
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