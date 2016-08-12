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
<title><spring:message code="reservation.edit"/></title>
</head>
<body>
<div class="container">
		<fieldset>
			<legend><spring:message code="reservation.edit"/></legend>
			<form:form method="post" modelAttribute="reservation" action="save">
				<form:hidden path="idRes" />
				<form:hidden path="version" />
				
				<div class="form-group">
					<form:label path="etatRerservation" class="control-label"><spring:message code="reservation.etatReservation"/></form:label>
					<form:select path="etatRerservation" class="form-control">
						<form:option value="" label="Veuillez s�lectionner l'�tat de votre r�servation" />
						<c:forEach items="${etatRerservations}" var="etatRerservation">						
							<form:option value="${etatRerservation}">
								<spring:message code="${etatRerservation.label}" />
							</form:option>
						</c:forEach>
					</form:select>
					
				</div>
				
				
				<div class="form-group">
					<form:label path="numero" class="control-label"><spring:message code="reservation.numero"/></form:label>
					<form:input path="numero" class="form-control" />
					
				</div>
				
				
				<div class="form-group">
					<form:label path="date" class="control-label"><spring:message code="reservation.date"/></form:label>
					<form:input path="date" class="form-control" type="date" />
					
				</div>

				<input type="submit" value="Valider" class="btn btn-default" />
			</form:form>
		</fieldset>
	</div>


</body>
</html>