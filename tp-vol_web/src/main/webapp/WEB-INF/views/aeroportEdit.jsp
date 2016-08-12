<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="aeroportEdit.titreOnglet" /></title>
</head>
<body>
	<div class="container">

		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="passager" />
		</jsp:include>

		<fieldset>
			<legend>
				<spring:message code="aeroportEdit.titrePage" />
			</legend>

			<form:form method="post" modelAttribute="aeroport" action="save">
				<form:hidden path="idAer" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="nom" class="control-label">
						<spring:message code="aeroportEdit.nom" /> :
					</form:label>
					<form:input path="nom" class="form-control" />
					<form:errors path="nom" class="label label-danger" />
				</div>
					<input type="submit"
						value="<spring:message code="aeroportEdit.valider"/>" class="btn btn-default" />
			</form:form>
		</fieldset>
	</div>
</body>
</html>