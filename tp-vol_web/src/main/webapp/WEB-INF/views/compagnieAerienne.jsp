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
<title>><spring:message code="compagnieAerienne.titre"/></title>
</head>
<body>

	<div class="container">
	 
		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="compagnieAerienne" />
		</jsp:include>
	
	
	
		<h2><spring:message code="compagnieAerienne.h2"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="compagnieAerienne.id"/></th>
				<th><spring:message code="compagnieAerienne.nom"/></th>
				<td><spring:message code="compagnieAerienne.edition"/></td>
				<td><spring:message code="compagnieAerienne.suppression"/></td>
			</tr>

			<c:forEach items="${compagnieAeriennes}" var="compagnieAerienne">
				<tr>
					<td>${compagnieAerienne.id}</td>
					<td>${compagnieAerienne.nom}</td>
					<td><a 	href="edit?id=${compagnieAerienne.id}" 
							class="btn btn-info btn-xs"><spring:message code="compagnieAerienne.editer"/></a></td>
					<td><a 	href="delete?id=${compagnieAerienne.id}" 
							class="btn btn-info btn-xs"><spring:message code="compagnieAerienne.supprimer"/></a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="4"><a href="add" class="btn btn-info" ><spring:message code="compagnieAerienne.ajouterAgence"/></a></td>
			</tr>

		</table>
	</div>
	
</body>
</html>