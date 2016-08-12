<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="reservationEdit.edit"/></title>
</head>
<body>
<div class="container">
<jsp:include page="menu.jsp">
			<jsp:param name="page" value="reservation" />
		</jsp:include>
		<fieldset>
			<legend><spring:message code="reservationEdit.edit"/></legend>
			<form:form method="post" modelAttribute="reservation" action="save">
				<form:hidden path="idRes" />
				<form:hidden path="version" />
				
				<div class="form-group">
					<form:label path="etatReservation" class="control-label"><spring:message code="reservationEdit.etatReservation"/></form:label>
					<form:select path="etatReservation" class="form-control">
						<form:option value="" label="Veuillez sélectionner l'état de votre réservation" />
						<c:forEach items="${etatReservations}" var="etatRerservation">						
							<form:option value="${etatReservation}">
								<spring:message code="${etatReservation.label}" />
							</form:option>
						</c:forEach>
					</form:select>
					
				</div>
				
				
				<div class="form-group">
					<form:label path="numero" class="control-label"><spring:message code="reservationEdit.numero"/></form:label>
					<form:input path="numero" class="form-control" />
					
				</div>
				
				
				<div class="form-group">
					<form:label path="date" class="control-label"><spring:message code="reservationEdit.date"/></form:label>
					<form:input path="date" class="form-control" type="date" />
					
				</div>

				<input type="submit" value="Valider" class="btn btn-default" />
			</form:form>
		</fieldset>
	</div>


</body>
</html>