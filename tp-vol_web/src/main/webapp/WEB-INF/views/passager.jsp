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
<title><spring:message code="passager.titre" /></title>
</head>
<body>
	<div class="container">

		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="passager" />
		</jsp:include>

		<h2>
			<spring:message code="passager.titre" />
		</h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="passager.id" /></th>
				<th><spring:message code="passager.nom" /></th>
				<th><spring:message code="passager.prenom" /></th>
				<th><spring:message code="passager.adresse" /></th>
				<th><spring:message code="passager.codePostal" /></th>
				<th><spring:message code="passager.ville" /></th>
				<th><spring:message code="passager.pays" /></th>
				<th colspan="2"></th>
			</tr>

			<c:forEach items="${passager}" var="passager">
				<tr>
					<td>${passager.idPas}</td>
					<td>${passager.nom}</td>
					<td>${passager.prenom}</td>
					<td>${passager.adresse.adresse}</td>
					<td>${passager.adresse.codePostal}</td>
					<td>${passager.adresse.ville}</td>
					<td>${passager.adresse.pays}</td>
					<td><a href="edit?idPas=${passager.idPas}"
						class="btn btn-info btn-xs"><spring:message
								code="passager.editer" /></a></td>
					<td><a href="delete?idPas=${passager.idPas}"
						class="btn btn-info btn-xs"><spring:message
								code="passager.supprimer" /></a></td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="9"><a href="add" class="btn btn-info"><spring:message
							code="passager.ajouter" /></a></td>
			</tr>
		</table>
	</div>
</body>
</html>