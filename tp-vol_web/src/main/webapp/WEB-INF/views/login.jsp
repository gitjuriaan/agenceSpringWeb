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
				<spring:message code="login.titre" />
			</legend>

			<form:form method="post" modelAttribute="passager" action="save">
				<form:hidden path="idPas" />
				<form:hidden path="version" />


				<div class="form-group">
					<form:label path="username" class="control-label">
						<spring:message code="login.username" /> :</form:label>
					<form:input path="username" class="form-control" />
					<form:errors path="username" class="label label-danger" />
				</div>

				<div class="form-group">
					<form:label path="password" class="control-label">
						<spring:message code="login.password" /> :</form:label>
					<form:input path="password" class="form-control" />
					<form:errors path="password" class="label label-danger" />
				</div>


				<input type="submit" value="<spring:message code="login.valider" />"
					class="btn btn-default" />

			</form:form>
		</fieldset>
	</div>
</body>
</html>
