<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar</title>
<link rel="stylesheet" href="estilo1.css">
</head>
<body>
<center>

<% out.print("<form action=Verificar_eliminar.jsp?id="+request.getParameter("id")+"&nom="+request.getParameter("nom")+" method=post>");%>


<font face="georgia" size=6>
Esta seguro que quiere eliminar:<br>
<% out.print(request.getParameter("nom"));%><br>
<% //out.print(request.getParameter("id"));%>
Si <input type="radio" name="opcion" VALUE="si"/>
No <input type="radio" name="opcion" VALUE="no"/><br>
<input type="submit">
</form>
</font>
</center>
</body>
</html>