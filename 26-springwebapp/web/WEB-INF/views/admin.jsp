<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administración</title>
<script type="text/javascript"
	src='<c:url value="/res/js/jquery-3.0.0.js" />'></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		$('#confirm').on("click", function() {
			return confirm("¿Desea elminar este administrador?");
		});
	});
	
	</script>
</head>
<body>
	<h1>Estamos en admin</h1>

	<sf:form action="${pageContext.request.contextPath}/admin/save"
		method="post" commandName="admin">
		<table>

			<c:if test="${admin.idAd ne 0}">
				<sf:input path="idAd" type="hidden" />
				<sf:input path="fechaCreacion" type="hidden" />
			</c:if>

			<tr>
				<td>Nombre</td>
				<td><sf:input path="nombre" type="text" /></td>
			</tr>

			<tr>
				<td>Cargo</td>
				<td><sf:input path="cargo" type="text" /></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="Guardar cambios"></td>
			</tr>
		</table>
	</sf:form>

	<c:out value="${resultado}"></c:out>

	<table border="1">
		<thead>
			<tr>
				<th>Nombre</th>
				<th>Cargo</th>
				<th>Fecha de creación</th>
			</tr>
			<c:forEach var="admin" items="${admins}">
				<tr>
					<td><c:out value="${admin.nombre}" /></td>
					<td><c:out value="${admin.cargo}" /></td>
					<td><c:out value="${admin.fechaCreacion}" /></td>
					<td><a
						href='<c:url value="/admin/${admin.idAd}/update"></c:url>'>Actualizar</a></td>
					<td><a id="confirm"
						href='<c:url value="/admin/${admin.idAd}/delete"></c:url>'>Eliminar</a></td>
				</tr>
			</c:forEach>
		</thead>
	</table>

</body>
</html>