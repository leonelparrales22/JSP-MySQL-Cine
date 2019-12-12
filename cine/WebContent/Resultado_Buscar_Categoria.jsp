<%@page import="com.peliculas.pelicula.Categoria"%>
<%@page import="com.peliculas.pelicula.Pelicula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Resultado Busqueda Categoría: <%= request.getParameter("cmbCategoria") %> </title>
<link rel="stylesheet" href="estilo1.css">
</head>
<body>
<font face="georgia" size=5>
<center>
<br>
Resultado categoría: <%= request.getParameter("cmbCategoria")%>

<% 
Class.forName("com.mysql.jdbc.Driver");
Categoria c=new Categoria();
String categoria= request.getParameter("cmbCategoria");
out.print(c.consultaPorCategoria(categoria));
%>
<a href="index.jsp">Volver Index</a> <br>
</center>
</font>
</body>
</html>