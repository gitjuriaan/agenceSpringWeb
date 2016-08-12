<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="volEdit.titre"/></title>
</head>
<body>

<div id="container">

		<jsp:include page="menu.jsp">
			<jsp:param name="page" value="vol" />
		</jsp:include>
		
		<fieldset>
			<legend><spring:message code="volEdit.titre"/></legend>
			<form:form method="post" modelAttribute="vol" class="form-inline" action="save">
				<form:hidden path="idVol"/>
				<form:hidden path="version"/>
				<div  >
					<form:label path="dateDepart"><spring:message code="volEdit.dateDepart"/></form:label>
					<form:input path="dateDepart" class="form-control" type = "date"/>
				</div>
				<div  >
					<form:label path="dateArrivee"><spring:message code="volEdit.dateArrivee"/></form:label>
					<form:input path="dateArrivee" class="form-control" type = "date"/>
				</div>
				<div  >
					<form:label path="heureDepart"><spring:message code="volEdit.heureDepart"/></form:label>
					<form:input path="heureDepart" class="form-control" type = "time"/>
				</div>
				<div  >
					<form:label path="heureArrivee"><spring:message code="volEdit.heureArrivee"/></form:label>
					<form:input path="heureArrivee" class="form-control" type = "time"/>
				</div>

<!-- 				<div > -->
<%-- 					<form:label path="aeroportDepart"><spring:message code="volEdit.aeroportDepart"/></form:label> --%>
<%-- 					<form:input path="aeroportDepart" class="form-control" /> --%>
<!-- 				</div> -->
<!-- 				<div > -->
<%-- 					<form:label path="aeroportArrivee"><spring:message code="volEdit.aeroportArrivee"/></form:label> --%>
<%-- 					<form:input path="aeroportArrivee" class="form-control" /> --%>
<!-- 				</div> -->
				<input type = "submit" value="Valider" class="btn btn-info btn-xs">
			</form:form>
		</fieldset>
	</div>

</body>
</html>