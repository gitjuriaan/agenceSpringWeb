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
<title><spring:message code="login.titre" /></title>
</head>
<body>
	<div class="container">


		<form method="post" action="connect">

			<div class="form-group">
				<label class="control-label">
					<spring:message code="login.username" /> :</label>
				<input type="text" name="username" class="form-control" />
			</div>

			<div class="form-group">
				<label class="control-label">
					<spring:message code="login.password" /> :</label>
				<input type="text" name="password" class="form-control" />
			</div>


			<input type="submit" value="<spring:message code="login.valider" />"
				class="btn btn-default" />

		</form>

	</div>
</body>
</html>
