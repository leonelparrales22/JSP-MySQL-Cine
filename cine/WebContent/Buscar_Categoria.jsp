<%@page import="com.peliculas.pelicula.Categoria"%>
<%@page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buscar por categoría</title>
<link rel="stylesheet" href="estilo1.css">
</head>
<body style="background-color:rgb(35,35,35);">
<p style="color:rgb(255,255,255);"> 

<font face="georgia" size=6>
<form action="Resultado_Buscar_Categoria.jsp" method="post">

<% 
Class.forName("com.mysql.jdbc.Driver");
Categoria c=new Categoria();
out.print(c.mostrarCategoria());

%>

<input type="submit" name="Enviar"><br>
</form>

<br>
<a href="index.jsp">Volver Index</a>
</font>
</p>
</body>
</html>