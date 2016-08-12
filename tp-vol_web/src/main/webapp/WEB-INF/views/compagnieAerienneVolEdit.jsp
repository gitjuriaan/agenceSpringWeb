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
<title><spring:message code="compagnieAerienneVolEdit.titre" /></title>
</head>
<body>

	<div class="container">

		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="compagnieAerienneVol" />
		</jsp:include>


		<h2>
			<spring:message code="compagnieAerienneVolEdit.h2" />
		</h2>

		<fieldset>
			<legend>
				<spring:message code="compagnieAeriennVoleEdit.legend" />
			</legend>
			<form:form class="form" method="post"
				modelAttribute="compagnieAerienneVol" action="save">

				<form:hidden path="id" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="id.compagnieAerienne.id" class="control-label">Compagnie Aerienne :</form:label>
					<form:select path="id.compagnieAerienne.id" class="form-control">
						<form:option value=""
							label="Veuillez sélectionner une compagnie aerienne!" />
						<c:forEach items="${compagnieAeriennes}" var="compagnieAerienne">
							<form:option value="${compagnieAerienne.id}">
								${compagnieAerienne.nom}
							</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="id.compagnieAerienne.id" class="label label-danger"/>
				</div>

				<div class="form-group">
					<form:label path="id.vol.idVol" class="control-label">Vol :</form:label>
					<form:select path="id.vol.idVol" class="form-control">
						<form:option value=""
							label="Veuillez sélectionner un vol" />
						<c:forEach items="${vols}" var="vol">
							<form:option value="${vol.idVol}">
								${vol.idVol}
							</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="id.vol.idVol" class="label label-danger"/>
				</div>



				<div class="form-group">
					<form:label path="numero" class="control-label">
						<spring:message code="compagnieAerienneVolEdit.numero" />
					</form:label>
					<form:input path="numero" class="form-control" />
					<form:errors path="numero" class="label label-danger" />
				</div>
				<div class="form-group">
					<form:label path="ouvert" class="control-label">
						<spring:message code="compagnieAerienneVolEdit.ouvert" />
					</form:label>

					<form:radiobutton path="ouvert" value="true" />
					<spring:message code="yes" />
					<form:radiobutton path="ouvert" value="false" />
					<spring:message code="no" />
					<form:errors path="ouvert" class="label label-danger" />


				</div>

				<tr>
					<td colspan="2"><input type="submit"
						value="<spring:message code="btnValider"/>"
						class="btn btn-default" /></td>
				</tr>
			</form:form>
		</fieldset>
	</div>

</body>
</html>