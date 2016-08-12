<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="aeroport.titreOnglet" /></title>
</head>
<body>
	<h2>
		<spring:message code="aeroport.titrePage" />
	</h2>
	<table>
		<tr>
			<th><spring:message code="aeroport.id" /></th>
			<th><spring:message code="aeroport.nom" /></th>
			<th><spring:message code="aeroport.edition" /></th>
			<th><spring:message code="aeroport.suppression" /></th>
		</tr>
		
		<c:forEach items="${aeroports}" var="aeroport">
				<tr>
					<td>${aeroport.idAer}</td>
					<td>${aeroport.nom}</td>
					<td><a href="edit?id=${aeroport.idAer}" ><spring:message code="aeroport.editer"/></a></td>
					<td><a href="delete?id=${aeroport.idAer}" ><spring:message code="aeroport.supprimer"/></a></td>
				</tr>
			</c:forEach>
			
		<tr>
				<td colspan = "4"><a href="add"><spring:message code="aeroport.ajouter"/></a></td>
			</tr>
	</table>
</body>
</html>