<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="aeroport.titreOnglet" /></title>
</head>
<body>
	<div class="container">

		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="aeroport" />
		</jsp:include>

		<h2>
			<spring:message code="aeroport.titrePage" />
		</h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="aeroport.id" /></th>
				<th><spring:message code="aeroport.nom" /></th>
				<th colspan = "2"></th>
			</tr>

			<c:forEach items="${aeroports}" var="aeroport">
				<tr>
					<td>${aeroport.idAer}</td>
					<td>${aeroport.nom}</td>
					<td><a href="edit?id=${aeroport.idAer}"
						class="btn btn-info btn-xs"><spring:message
								code="aeroport.editer" /></a></td>
					<td><a href="delete?id=${aeroport.idAer}"
						class="btn btn-info btn-xs"><spring:message
								code="aeroport.supprimer" /></a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="4"><a href="add" class="btn btn-info"><spring:message
							code="aeroport.ajouter" /></a></td>
			</tr>
		</table>
	</div>
</body>
</html>