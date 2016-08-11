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
<title><spring:message code="agenceEdit.titre"/></title>
</head>
<body>
	<h2><spring:message code="agenceEdit.h2"/></h2>

	<div id="container">
		<fieldset>
			<legend><spring:message code="agenceEdit.legend"/></legend>
			<form:form class="form" method="post" modelAttribute="agence"
				action="save">

				<input type="hidden" name="mode" value="${mode}" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="numBanque" class="control-label"><spring:message code="agence.numBanque"/></form:label>
					<c:if test="${mode eq 'add'}">
						<form:input path="numBanque" class="form" />
					</c:if>
					<c:if test="${mode eq 'edit'}">
						<form:input path="numBanque" class="form" readonly="true" />
					</c:if>
				</div>
				<div class="form-group">
					<form:label path="numAgence" class="control-label"><spring:message code="agence.numAgence"/></form:label>
					<c:if test="${mode eq 'add'}">
						<form:input path="numAgence" class="form" />
					</c:if>
					<c:if test="${mode eq 'edit'}">
						<form:input path="numAgence" class="form" readonly="true" />
					</c:if>
				</div>

				<div class="form-group">
					<form:label path="adresse.codePostal"><spring:message code="agence.codePostal"/></form:label>
					<form:input path="adresse.codePostal" class="form" />
				</div>
				<div class="form-group">
					<form:label path="adresse.rue"><spring:message code="agence.rue"/></form:label>
					<form:input path="adresse.rue" class="form" />
				</div>
				<div class="form-group">
					<form:label path="adresse.ville"><spring:message code="agence.ville"/></form:label>
					<form:input path="adresse.ville" class="form" />
				</div>
				<div class="form-group">
					<form:label path="horaires"><spring:message code="agence.horaires"/></form:label>
					<form:input path="horaires" class="form" />
				</div>
				<div class="form-group">
					<form:label path="libelle"><spring:message code="agence.libelle"/></form:label>
					<form:input path="libelle" class="form" />
				</div>

				<tr>
					<td colspan="2"><input type="submit" value="<spring:message code="btnValider"/>"
						class="btn" /></td>
				</tr>
			</form:form>
		</fieldset>
	</div>
</body>
</html>