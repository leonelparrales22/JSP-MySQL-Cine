<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verificar Actualizar</title>
<link rel="stylesheet" href="estilo1.css">
</head>
<body>
<font face="georgia" size=6>
Nombre: <%= request.getParameter("txtNombre")%> <br>
	Categoría: <%= request.getParameter("cmbCategoria") %>null <br>
	Duración: <%= request.getParameter("txtDuracion") %>jbj <br>
	Cartelera: <%= request.getParameter("fileFoto") %>hghjhgjhhg<br>
	<br>
	Aparte
	<br>
	
	Nombre: <%= request.getParameter("nom") %> <br>
	Min: <%= request.getParameter("min") %>
	
	
	
	<a href="index.jsp">Volver Index</a> <br>
</font>	
</body>
</html>