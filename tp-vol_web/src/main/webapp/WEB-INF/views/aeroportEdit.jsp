<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="aeroportEdit.titreOnglet" /></title>
</head>
<body>
	<h2>
		<spring:message code="aeroportEdit.titrePage" />
	</h2>

	<form:form method="post" modelAttribute="aeroport" action="save">
		<form:hidden path="idAer" />
		<form:hidden path="version" />

		<div>
			<form:label path="nom">
				<spring:message code="aeroportEdit.nom" />
			</form:label>
			<div>
				<form:input path="nom" />
			</div>
		</div>
		<p>
			<input type="submit"
				value="<spring:message code="aeroportEdit.valider"/>" />
		</p>
	</form:form>
</body>
</html>