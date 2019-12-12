<%@page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verificar Eliminar</title>
<link rel="stylesheet" href="estilo1.css">
</head>
<body>
<font face="georgia" size=6>

<% Pelicula p=new Pelicula();
Class.forName("com.mysql.jdbc.Driver");
	String id=request.getParameter("id");
	String op=request.getParameter("opcion");
	if (op.equals("si")) {
		out.print(p.eliminarPelicula(request.getParameter("id")));
	} else {
		response.sendRedirect("consultarPeliculasEliminar.jsp");
	}
%>

: <%= request.getParameter("nom")%><br>
<a href="consultarPeliculasEliminar.jsp">Regresar al menú eliminar</a>

</font>
</body>
</html>