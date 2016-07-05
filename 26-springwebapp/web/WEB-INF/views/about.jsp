<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
</head>
<body>
<h1>Estamos en about</h1>

Atributos del Model: <c:out value="${mensaje}"></c:out><br>
Atributos de la sesion: <c:out value="${sessionScope.resultado}"></c:out>
</body>
</html>