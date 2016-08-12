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
<title><spring:message code="passager.titre" /></title>
</head>
<body>
	<div class="container">

		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="passager" />
		</jsp:include>

		<fieldset>
			<legend>
				<spring:message code="passagerEdit.titre" />
			</legend>
			
			<form:form method="post" modelAttribute="passager" action="save">
				<form:hidden path="idPas" />
				<form:hidden path="version" />
				
				
				<div class="form-group">
					<form:label path="nom" class="control-label">
						<spring:message code="passagerEdit.nom" /> :</form:label>
					<form:input path="nom" class="form-control" />
					<form:errors path="nom" class="label label-danger" />
				</div>
				<div class="form-group">
					<form:label path="prenom" class="control-label">
						<spring:message code="passagerEdit.prenom" /> :</form:label>
					<form:input path="prenom" class="form-control" />
					<form:errors path="prenom" class="label label-danger" />
				</div>
				<div class="form-group">
					<form:label path="adresse.adresse" class="control-label">
						<spring:message code="passagerEdit.adresse" /> :</form:label>
					<form:input path="adresse.adresse" class="form-control" />
					<form:errors path="adresse.adresse" class="label label-danger" />
				</div>
				<div class="form-group">
					<form:label path="adresse.codePostal" class="control-label">
						<spring:message code="passagerEdit.codePostal" /> :</form:label>
					<form:input path="adresse.codePostal" class="form-control" />
					<form:errors path="adresse.codePostal" class="label label-danger" />
				</div>
				<div class="form-group">
					<form:label path="adresse.ville" class="control-label">
						<spring:message code="passagerEdit.ville" /> :</form:label>
					<form:input path="adresse.ville" class="form-control" />
					<form:errors path="adresse.ville" class="label label-danger" />
				</div>
				<div class="form-group">
					<form:label path="adresse.pays" class="control-label">
						<spring:message code="passagerEdit.pays" /> :</form:label>
					<form:input path="adresse.pays" class="form-control" />
					<form:errors path="adresse.pays" class="label label-danger" />
				</div>

				<input type="submit" value="<spring:message code="passagerEdit.valider" />" class="btn btn-default" />

			</form:form>
		</fieldset>
	</div>
</body>
</html>
