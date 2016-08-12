<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="ville.titre"/></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>

<div class="container">
<jsp:include page="menu.jsp">
			<jsp:param name="page" value="ville" />
		</jsp:include>
		
		<h2><spring:message code="ville.titre"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="ville.id"/></th>
				<th><spring:message code="ville.nom"/></th>
				<th colspan="2"></th>
			</tr>

			<c:forEach items="${villes}" var="ville">
				<tr>
					<td>${ville.idVil}</td>
					<td>${ville.nom}</td>
					<td><a href="edit?id=${ville.idVil}" class="btn btn-info btn-xs"><spring:message code="ville.edition"/></a></td>
					<td><a href="delete?id=${ville.idVil}" class="btn btn-info btn-xs"><spring:message code="ville.suppression"/></a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="9"><a href="add" class="btn btn-info"><spring:message code="ville.ajouter"/></a></td>
			</tr>
		</table>
	</div>
	
	

</body>
</html>