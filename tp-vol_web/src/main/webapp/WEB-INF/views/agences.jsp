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
<title>><spring:message code="agence.titre"/></title>
</head>
<body>
	<div class="container">
		<h2><spring:message code="agence.h2"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="agence.numAgence"/></th>
				<th><spring:message code="agence.numBanque"/></th>
				<th><spring:message code="agence.codePostal"/></th>
				<th><spring:message code="agence.rue"/></th>
				<th><spring:message code="agence.ville"/></th>
				<th><spring:message code="agence.horaires"/></th>
				<th><spring:message code="agence.libelle"/></th>
				<td><spring:message code="agence.edition"/></td>
				<td><spring:message code="agence.suppression"/></td>
			</tr>

			<c:forEach items="${agences}" var="agence">
				<tr>
					<td>${agence.numAgence}</td>
					<td>${agence.numBanque}</td>
					<td>${agence.adresse.codePostal}</td>
					<td>${agence.adresse.rue}</td>
					<td>${agence.adresse.ville}</td>
					<td>${agence.horaires}</td>
					<td>${agence.libelle}</td>
					<td><a 	href="edit?numAgence=${agence.numAgence}&numBanque=${agence.numBanque}" 
							class="btn btn-info btn-xs"><spring:message code="agence.editer"/></a></td>
					<td><a 	href="delete?numAgence=${agence.numAgence}&numBanque=${agence.numBanque}" 
							class="btn btn-info btn-xs"><spring:message code="agence.supprimer"/></a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="9"><a href="add" class="btn btn-info" ><spring:message code="agence.ajouterAgence"/></a></td>
			</tr>

		</table>
	</div>
</body>
</html>