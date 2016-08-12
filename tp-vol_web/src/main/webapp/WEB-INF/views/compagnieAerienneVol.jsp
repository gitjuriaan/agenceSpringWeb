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
<title>><spring:message code="compagnieAerienneVol.titre"/></title>
</head>
<body>

	<div class="container">
	 
		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="compagnieAerienneVol" />
		</jsp:include>
	
	
	
		<h2><spring:message code="compagnieAerienneVol.h2"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="compagnieAerienneVol.id"/></th>
				
				<th><spring:message code="compagnieAerienneVol.compagnieAerienne"/></th>
				<th><spring:message code="compagnieAerienneVol.vol"/></th>
				
				<th><spring:message code="compagnieAerienneVol.numero"/></th>
				<th><spring:message code="compagnieAerienneVol.ouvert"/></th>
				<td colspan="2"></td>
			</tr>

			<c:forEach items="${compagnieAerienneVols}" var="compagnieAerienneVol">
				<tr>
					<td>${compagnieAerienneVol.id}</td>
					
					<td>${compagnieAerienneVol.id.compagnieAerienne.id}</td>
					<td>${compagnieAerienneVol.id.vol.idVol}</td>
					
					<td>${compagnieAerienneVol.numero}</td>
					<td>${compagnieAerienneVol.ouvert}</td>
					<td><a 	href="edit?id=${compagnieAerienneVol.id}" 
							class="btn btn-info btn-xs"><spring:message code="compagnieAerienneVol.editer"/></a></td>
					<td><a 	href="delete?id=${compagnieAerienneVol.id}" 
							class="btn btn-info btn-xs"><spring:message code="compagnieAerienneVol.supprimer"/></a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="7"><a href="add" class="btn btn-info" ><spring:message code="compagnieAerienneVol.ajouterAgence"/></a></td>
			</tr>

		</table>
	</div>
	
</body>
</html>