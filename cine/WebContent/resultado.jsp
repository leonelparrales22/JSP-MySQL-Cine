<%@page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado</title>
<link rel="stylesheet" href="estilo2.css">
</head>
<body>
<font face="georgia" size=6>
	<b>Datos Ingresados:</b> <br>
	Nombre: <%= request.getParameter("txtNombre")%> <br>
	Categoría: <%= request.getParameter("cmbCategoria") %> <br>
	Duración: <%= request.getParameter("txtDuracion") %> <br>
	Cartelera: <%= request.getParameter("fileFoto") %> <br>
	<a href="index.jsp">Volver Index</a> <br>
	<% 
	String Nombre=request.getParameter("txtNombre");
	String Categoria=request.getParameter("cmbCategoria");
	int Duracion=Integer.parseInt(request.getParameter("txtDuracion"));
	String ruta=request.getParameter("fileFoto");
	
	byte[] Cartelera=ruta.getBytes();
	Class.forName("com.mysql.jdbc.Driver");
	Pelicula miPelicula=new Pelicula(Nombre, Duracion, Cartelera);
	miPelicula.ingresarPelicula(Categoria, ruta);
	%>
</font>	
</body>
</html>