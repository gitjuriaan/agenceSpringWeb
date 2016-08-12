<%@page import="vol.model.Client"%>
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
<title>Edition du client</title>
</head>
<body>



	<div class="container">
		<fieldset>
			<legend>Edition du client </legend>
			
			
			 
		
			<form:form method="post" modelAttribute="client" action="${type}">


				<form:hidden path="idCli" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="titre" class="control-label"><spring:message code="client.titre"/></form:label>
					<form:select path="titre" class="form-control">
						<form:option value="" label="Veuillez sélectionner une civilité" />
						<c:forEach items="${titre}" var="titre">						
							<form:option value="${titre}">
<%-- 								<spring:message code="${titre.label}" /> --%>
							</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="titre"/>
				</div>
				
				<div class="form-group">
					<form:label path="nom"><spring:message code="client.nom"/></form:label>
					<form:input path="nom" class="form-control" />
					<form:errors path="nom"/>
				</div>

				<c:if test="${client.typeClient.equals('EI')}">
					<div class="form-group">
					<form:label path="prenom"><spring:message code="client.prenom"/></form:label>
					<form:input path="prenom" class="form-control" />
					<form:errors path="prenom"/>
				</div>
				</c:if>
				
				<c:if test="${client.typeClient.equals('Physique')}">
					<div class="form-group">
					<form:label path="prenom"><spring:message code="client.prenom"/></form:label>
					<form:input path="prenom" class="form-control" />
					<form:errors path="prenom"/>
				</div>
				</c:if>
				
				<c:if test="${client.typeClient.equals('Moral')}">
					<div class="form-group">
					<form:label path="siret"><spring:message code="client.siret"/></form:label>
					<form:input path="siret" class="form-control" />
					<form:errors path="siret"/>
				</div>
				</c:if>

				


				<div class="form-group">
					<form:label path="email">E-mail :</form:label>
					<form:input path="email" class="form-control" />
					<form:errors path="email"/>
				</div>

				<div class="form-group">
					<form:label path="numeroTel"><spring:message code="client.numeroTel"/></form:label>
					<form:input path="numeroTel" class="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="numeroFax"><spring:message code="client.numeroFax"/></form:label>
					<form:input path="numeroFax" class="form-control" />
				</div>


				<div class="form-group">
					<form:label path="adresse.adresse"><spring:message code="client.adresse.rue"/></form:label>
					<form:input path="adresse.adresse" class="form-control" />
					<form:errors path="adresse.adresse"/>
				</div>

				<div class="form-group">
					<form:label path="adresse.codePostal"><spring:message code="client.adresse.codePostal"/></form:label>
					<form:input path="adresse.codePostal" class="form-control" />
					<form:errors path="adresse.codePostal"/>
				</div>

				<div class="form-group">
					<form:label path="adresse.ville"><spring:message code="client.adresse.ville"/></form:label>
					<form:input path="adresse.ville" class="form-control" />
					<form:errors path="adresse.ville"/>
				</div>
				
				<div class="form-group">
					<form:label path="adresse.pays"><spring:message code="client.adresse.pays"/></form:label>
					<form:input path="adresse.pays" class="form-control" />
					<form:errors path="adresse.pays"/>
				</div>
				
				<div class="form-group">
					<form:label path="log.login"><spring:message code="client.login.log"/></form:label>
					<form:input path="log.login" class="form-control" />
					<form:errors path="log.login"/>
				</div>
				
				<div class="form-group">
					<form:label path="log.motDePasse"><spring:message code="client.login.mdp"/></form:label>
					<form:input path="log.motDePasse" class="form-control" />
					<form:errors path="log.motDePasse"/>
				</div>
				
				<div class="form-group">
					<form:label path="log.admin"><spring:message code="client.login.admin"/></form:label>
					<form:input path="log.admin" class="form-control" />
					<form:errors path="log.admin"/>
				</div>

				<input type="submit" value="<spring:message code="client.valider"/>" class="btn btn-default" />

			</form:form>
			
			
		</fieldset>
	</div>



</body>
</html>