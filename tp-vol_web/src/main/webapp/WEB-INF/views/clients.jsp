<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="clients.titre" /></title>
</head>
<body>
	<div class="container">
		<h2>
			<spring:message code="clients.h2" />
		</h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="client.id" /></th>
				<th><spring:message code="client.civilite" /></th>
				<th><spring:message code="client.nom" /></th>
				<th><spring:message code="client.prenom" /></th>
				<th><spring:message code="client.dtNaissance" /></th>
				<th><spring:message code="client.email" /></th>
				<th><spring:message code="client.telephone" /></th>
				<th><spring:message code="client.pro" /></th>
				<th><spring:message code="client.rue" /></th>
				<th><spring:message code="client.codePostal" /></th>
				<th><spring:message code="client.ville" /></th>
				<td><spring:message code="client.edition" /></td>
				<td><spring:message code="client.suppression" /></td>
			</tr>

			<c:forEach items="${clients}" var="client">
				<tr>
					<td>${client.id}</td>
					<td><spring:message code="${client.civilite.label}" /></td>
					<td>${client.nom}</td>
					<td>${client.prenom}</td>
					<td><fmt:formatDate value="${client.dtNaissance}"
							pattern="dd/MM/yyyy" /></td>
					<td>${client.email}</td>
					<td>${client.telephone}</td>
					<td>${client.professionnel}</td>
					<td>${client.adresse.rue}</td>
					<td>${client.adresse.codePostal}</td>
					<td>${client.adresse.ville}</td>
					<td><a href="edit?id=${client.id}" class="btn btn-info btn-xs"><spring:message
								code="client.editer" /></a></td>
					<td><a href="delete?id=${client.id}"
						class="btn btn-info btn-xs"><spring:message
								code="client.supprimer" /></a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="13"><a href="add" class="btn btn-info"><spring:message
							code="client.ajouterClient" /></a></td>
			</tr>

		</table>
	</div>
</body>
</html>