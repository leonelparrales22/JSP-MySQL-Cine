<%@page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualizar_Datos</title>
<link rel="stylesheet" href="estilo1.css">
</head>
<body>
<a href="index.jsp">Volver Index</a><br>
<font face="georgia" size=5>
Seleccione película a acualizar: <br>
</font>
<%
		Class.forName("com.mysql.jdbc.Driver");
		Pelicula p=new Pelicula();
		out.print(p.consultarActualizar());
%>




</body>
</html>