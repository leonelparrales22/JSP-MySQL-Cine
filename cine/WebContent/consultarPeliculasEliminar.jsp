<%@page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar película</title>
<link rel="stylesheet" href="estilo1.css">
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Pelicula p=new Pelicula();
		out.print(p.consultarPeliculas());
	%>
<a href="index.jsp">Volver Index</a>
</body>
</html>