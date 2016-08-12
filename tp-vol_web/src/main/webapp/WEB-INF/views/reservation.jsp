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
<title><spring:message code="reservation.titre"/></title>
</head>
<body >
<div class="container">
<jsp:include page="menu.jsp">
			<jsp:param name="page" value="reservation" />
		</jsp:include>
		
		<h2><spring:message code="reservation.titre"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="reservation.id"/></th>
				<th><spring:message code="reservation.etatReservation"/></th>
				<th><spring:message code="reservation.numero"/></th>
				<th><spring:message code="reservation.date"/></th>
				
				<th colspan="2"></th>
			</tr>

			<c:forEach items="${reservations}" var="reservation">
				<tr>
					<td>${reservation.idRes}</td>
					<td><spring:message code="${reservation.etatReservation.label}"/></td>
					<td>${reservation.numero}</td>
					<td><fmt:formatDate value="${reservation.date}"
							pattern="dd/MM/yyyy" /></td>
					<td><a href="edit?id=${reservation.idRes}" class="btn btn-info btn-xs"><spring:message code="reservation.editer"/></a></td>
					<td><a href="delete?id=${reservation.idRes}" class="btn btn-info btn-xs"><spring:message code="reservation.supprimer"/></a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="9"><a href="add" class="btn btn-info"><spring:message code="reservation.ajouter"/></a></td>
			</tr>
		</table>
	</div>



</body>
</html>