<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.List"%>
<%@ page import="vol.model.Client"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="client.header" /></title>
</head>
<body>

	<div class="container">
		<h2>
			<spring:message code="client.header" />
		</h2>
		<table class="table table-striped">
			<tr>

				<th><spring:message code="client.type" /></th>
				<th><spring:message code="client.id" /></th>
				<th><spring:message code="client.titre" /></th>
				<th><spring:message code="client.nom" /></th>
				<th><spring:message code="client.prenom" /></th>
				<th><spring:message code="client.siret" /></th>
				<th>Email</th>
				<th><spring:message code="client.telephone" /></th>
				<th><spring:message code="client.fax" /></th>

				<th><spring:message code="client.adresse.rue" /></th>
				<th><spring:message code="client.adresse.codePostal" /></th>
				<th><spring:message code="client.adresse.ville" /></th>
				<th><spring:message code="client.adresse.pays" /></th>

				<th><spring:message code="client.login.log" /></th>
				<th><spring:message code="client.login.mdp" /></th>
				<th><spring:message code="client.login.admin" /></th>

				<td><spring:message code="client.edition" /></td>
				<td><spring:message code="client.suppression" /></td>
			</tr>

			<c:forEach items="${listClient}" var="client">
				<tr>

					<td>${client.typeClient}</td>
					<td>${client.idCli}</td>
					
<%-- 					<td><spring:message code="${client.titre.label}"/></td> --%>
					<td>${client.titre.label}</td>
					
					
					<td>${client.nom}</td>
					<c:if test="${client.typeClient.equals('EI')}">
						<td>${client.prenom}</td>
						<td></td>
					</c:if>
					<c:if test="${client.typeClient.equals('Physique')}">
						<td>${client.prenom}</td>
						<td></td>
					</c:if>
					<c:if test="${client.typeClient.equals('Moral')}">
						<td></td>
						<td>${client.siret}</td>
					</c:if>


					<td>${client.email}</td>
					<td>${client.numeroTel}</td>
					<td>${client.numeroFax}</td>
					<td>${client.adresse.adresse}</td>
					<td>${client.adresse.codePostal}</td>
					<td>${client.adresse.ville}</td>
					<td>${client.adresse.pays}</td>
					<td>${client.log.login}</td>
					<td>${client.log.motDePasse}</td>
					<td>${client.log.admin}</td>



					<td><a href="edit?idCli=${client.idCli}"><spring:message
								code="client.edition" /></a></td>
					<td><a href="delete?idCli=${client.idCli}"><spring:message
								code="client.suppression" /></a></td>


				</tr>
			</c:forEach>

			<tr>
				<td colspan="18"><a href="add"><spring:message
							code="client.ajouter" /></a></td>
			</tr>

		</table>
	</div>


</body>
</html>