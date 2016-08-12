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
<title><spring:message code="villeEdit.titre"/></title>
</head>
<body>


<div class="container">
<jsp:include page="menu.jsp">
			<jsp:param name="page" value="ville" />
		</jsp:include>
		<fieldset>
			<legend><spring:message code="villeEdit.titre"/></legend>
			<form:form method="post" modelAttribute="ville" action="save">
				<form:hidden path="idVil" />

				
			
				<div class="form-group">
					<form:label path="nom" class="control-label"><spring:message code="villeEdit.nom"/></form:label>
					<form:input path="nom" class="form-control" />
					<form:errors path="nom" class="label label-danger" />
					
				</div>
				
				
				<input type="submit" value="Valider" class="btn btn-default" />
			</form:form>
		</fieldset>
	</div>
	
	
	
</body>
</html>