<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="menu.home" /></title>
</head>
<body>
	<div class="container">


		<nav class="navbar navbar-default">
		<div class="container-fluid">

			<div class="navbar-header">
				<a class="navbar-brand" href="/tp-vol_web/">
				<spring:message code="menu.home" /></a>
			</div>
			<ul class="nav navbar-nav">

				<c:if test="${param.page.equals('client')}">
					<li class="active"><a href="/tp-vol_web/client/list"><spring:message
								code="menu.client" /></a></li>
				</c:if>
				<c:if test="${!param.page.equals('client')}">
					<li><a href="/tp-vol_web/client/list"><spring:message
								code="menu.client" /></a></li>
				</c:if>

				<c:if test="${param.page.equals('compagnieAerienne')}">
					<li class="active"><a
						href="/tp-vol_web/compagnieAerienne/list"><spring:message
								code="menu.compagnieAerienne" /></a></li>
				</c:if>
				<c:if test="${!param.page.equals('compagnieAerienne')}">
					<li><a href="/tp-vol_web/compagnieAerienne/list"><spring:message
								code="menu.compagnieAerienne" /></a></li>
				</c:if>

				<c:if test="${param.page.equals('compagnieAerienneVol')}">
					<li class="active"><a
						href="/tp-vol_web/compagnieAerienneVol/list"><spring:message
								code="menu.compagnieAerienneVol" /></a></li>
				</c:if>
				<c:if test="${!param.page.equals('compagnieAerienneVol')}">
					<li><a href="/tp-vol_web/compagnieAerienneVol/list"><spring:message
								code="menu.compagnieAerienneVol" /></a></li>
				</c:if>


				<c:if test="${param.page.equals('login')}">
					<li class="active"><a href="/tp-vol_web/login/list"><spring:message
								code="menu.login" /></a></li>
				</c:if>
				<c:if test="${!param.page.equals('login')}">
					<li><a href="/tp-vol_web/login/list"><spring:message
								code="menu.login" /></a></li>
				</c:if>

				<c:if test="${param.page.equals('passager')}">
					<li class="active"><a href="/tp-vol_web/passager/list"><spring:message
								code="menu.passager" /></a></li>
				</c:if>
				<c:if test="${!param.page.equals('passager')}">
					<li><a href="/tp-vol_web/passager/list"><spring:message
								code="menu.passager" /></a></li>
				</c:if>

				<c:if test="${param.page.equals('reservation')}">
					<li class="active"><a href="/tp-vol_web/reservation/list"><spring:message
								code="menu.reservation" /></a></li>
				</c:if>
				<c:if test="${!param.page.equals('reservation')}">
					<li><a href="/tp-vol_web/reservation/list"><spring:message
								code="menu.reservation" /></a></li>
				</c:if>

				<c:if test="${param.page.equals('vol')}">
					<li class="active"><a href="/tp-vol_web/vol/list"><spring:message
								code="menu.vol" /></a></li>
				</c:if>
				<c:if test="${!param.page.equals('vol')}">
					<li><a href="/tp-vol_web/vol/list"><spring:message
								code="menu.vol" /></a></li>
				</c:if>

			</ul>
		</div>
		</nav>

	</div>
</body>
</html>