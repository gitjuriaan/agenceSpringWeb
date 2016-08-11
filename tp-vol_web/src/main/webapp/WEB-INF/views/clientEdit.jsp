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
<title><spring:message code="clientEdit.titre" /></title>
</head>
<body>
	<h2>
		<spring:message code="clientEdit.h2" />
	</h2>

	<div id="container">
		<fieldset>
			<legend>
				<spring:message code="clientEdit.legend" />
			</legend>
			<form:form class="form" method="post" modelAttribute="client"
				action="save">
				<form:hidden path="id" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="civilite" class="control-label col-sm-2" >Civilité :</form:label>
					<form:select path="civilite" class="form">
						<form:option value="" label="Veuillez sélectionner une civilité" />
						<c:forEach items="${civilites}" var="civilite">
							<form:option value="${civilite}">
								<spring:message code="${civilite.label}" />
							</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="civilite" class="label label-danger"/>
				</div>
				<div class="form-group">
					<form:label path="nom" class="control-label col-sm-2" >
						<spring:message code="client.nom" />
					</form:label>
					<form:input path="nom" class="form" />
					<form:errors path="nom" class="label label-danger" />
				</div>
				<div class="form-group">
					<form:label path="prenom" class="control-label col-sm-2" >
						<spring:message code="client.prenom" />
					</form:label>
					<form:input path="prenom" class="form" />
					<form:errors path="prenom" class="label label-danger"/>
				</div>

				<div class="form-group">
					<form:label path="dtNaissance" class="control-label col-sm-2" >
						<spring:message code="client.dtNaissance" />
					</form:label>
					<form:input path="dtNaissance" class="form-group" type="date" />
					<form:errors path="dtNaissance" class="label label-danger"/>
				</div>

				<div class="form-group">
					<form:label path="email" class="control-label col-sm-2" >
						<spring:message code="client.email" />
					</form:label>
					<form:input path="email" class="form" />
					<form:errors path="email" class="label label-danger"/>
				</div>
				<div class="form-group">
					<form:label path="telephone" class="control-label col-sm-2" >
						<spring:message code="client.telephone" />
					</form:label>
					<form:input path="telephone" class="form" />
				</div>
				<div class="form-group">
					<form:label path="professionnel" class="control-label col-sm-2" >
						<spring:message code="client.pro" />
					</form:label>
					<form:radiobutton path="professionnel" value="true" />
					<spring:message code="yes" />
					<form:radiobutton path="professionnel" value="false" />
					<spring:message code="no" />
				</div>
				<div class="form-group">
					<form:label path="adresse.rue" class="control-label col-sm-2" >
						<spring:message code="client.rue" />
					</form:label>
					<form:input path="adresse.rue" class="form" />
					<form:errors path="adresse.rue" class="label label-danger"/>
				</div>
				<div class="form-group">
					<form:label path="adresse.codePostal" class="control-label col-sm-2" >
						<spring:message code="client.codePostal" />
					</form:label>
					<form:input path="adresse.codePostal" class="form" />
					<form:errors path="adresse.codePostal" class="label label-danger"/>
				</div>
				<div class="form-group">
					<form:label path="adresse.ville" class="control-label col-sm-2" >
						<spring:message code="client.ville" />
					</form:label>
					<form:input path="adresse.ville" class="form" />
				</div>

				<tr>
					<td colspan="2"><input type="submit"
						value="<spring:message code="btnValider"/>" class="btn" /></td>
				</tr>
			</form:form>
		</fieldset>
	</div>
</body>
</html>