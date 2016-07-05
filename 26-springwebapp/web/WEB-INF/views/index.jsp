<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bienvenido!</title>
<script type="text/javascript" src='<c:url value="/res/js/jquery-3.0.0.js" />'></script>

<script type="text/javascript">
$(document).ready(function() {
	alert("Bienvenidos");
});

</script>
</head>
<body>
<h1>Hola mundo!</h1>

<a href='<c:url value="/about"></c:url>'>Acerca de...</a><br>
<a href='<c:url value="/admin"></c:url>'>Gestionar administradores</a><br>

Nombre del admin: <c:out value="${adminForm}"></c:out><br>

</body>
</html>