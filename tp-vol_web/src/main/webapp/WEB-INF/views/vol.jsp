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
<title><spring:message code="vol.titre"/></title>
</head>
<body>
	<div class="container">
	
		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="vol" />
		</jsp:include>
		
		<h2><spring:message code="vol.titre"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="vol.id"/></th>
				<th><spring:message code="vol.dateDepart"/></th>
				<th><spring:message code="vol.dateArrivee"/></th>
				<th><spring:message code="vol.heureDepart"/></th>
				<th><spring:message code="vol.heureArrivee"/></th>
				<th><spring:message code="vol.aeroportDepart"/></th>
				<th><spring:message code="vol.aeroportArrivee"/></th>
				<td colspan="2">
			</tr>

			<c:forEach items="${vols}" var="vol">
				<tr>
					<td>${vol.idVol}</td>
					<td><fmt:formatDate value="${vol.dateDepart}"
					pattern="dd/MM/yyyy" /></td>
					<td><fmt:formatDate value="${vol.dateArrivee}"
					pattern="dd/MM/yyyy" /></td>
					<td><fmt:formatDate value="${vol.heureDepart}"
					pattern="HH:mm" /></td>
					<td><fmt:formatDate value="${vol.heureArrivee}"
					pattern="HH:mm" /></td>
					<td></td>
					<td></td>
<%-- 					<td>${vol.aeroportDepart}</td> --%>
<%-- 					<td>${vol.aeroportArrivee}</td> --%>
					<td><a href="edit?idVol=${vol.idVol}"class="btn btn-info btn-xs"><spring:message code="vol.editer"/></a></td>
					<td><a href="delete?idVol=${vol.idVol}" class="btn btn-info btn-xs"><spring:message code="vol.supprimer"/></a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="9"><a href="add"class="btn btn-info btn-xs"><spring:message code="vol.ajouter"/></a></td>
			</tr>
		</table>
	</div>


</body>
</html>