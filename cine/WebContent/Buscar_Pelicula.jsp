<%@page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Todas las películas</title>
<link rel="stylesheet" href="estilo2.css">
</head>
<body>
<center>
<%
Class.forName("com.mysql.jdbc.Driver");
Pelicula miPelicula=new Pelicula();
out.print(miPelicula.consultaTodo(request.getRealPath("")));
%>

<a href="index.jsp">Volver Index</a>
</center>
</body>
</html>